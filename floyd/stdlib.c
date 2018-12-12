/*
 * File: stdlib.c
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: Runtime support for Floyd programs
 */

#include <stdarg.h> // va_list
#include <unistd.h> // System Calls
#include <stdlib.h> // calloc

int RESERVED = 4;   // 4 bytes reserved per object
int DIM = 4;        // Dimension slot for arrays
int VTABLE = 0;     // Virtual function table slot for objects
int REF = 1;        // Reference count slot for objects
int CID = 2;        // Class id for objects
int SIZE = 3;       // Size for objects

int allocated = 0;  // Number of allocated bytes
int freed = 0;      // Number of freed bytes

/**
 * Prints a C string, one byte at a time
 * @str The C string to print
*/
void printstring(char *str) {
  while(*str) {
    write(1, str, 1);
    str++;
  }
}

/**
 * Prints an integer, one byte at a time
 * @x The integer to print
*/
void printint(int x) {
  char cur;
  if(x == 0) {
    cur = '0';
    write(1, &cur, 1);
    return;
  } else if(x < 0) {
    x = -x;
    cur = '-';
    write(1, &cur, 1);
  }

  char tmp[20];
  int idx = 0;
  while(x > 0) {
    tmp[idx++] = (x % 10) + '0';
    x /= 10;
  }

  while(idx > 0) {
    write(1, tmp + --idx, 1);
  }
}

/**
 * Similar to C's printf(), but only supports
 * %d and %s for ints and strings.
 * @fmt The format string
 * @... Other arguments
*/
void print(char *fmt, ...) {
  int params = 0;
  char *cur = fmt;
  while(*cur) {
    if(*cur == '%') { params++; }
    cur++;
  }

  va_list va;
  va_start(va, params);

  cur = fmt;
  while(*cur) {
    if(*cur == '%') {
      cur++;
      switch(*cur++) {
        case 'd': printint(va_arg(va, int)); break;
        case 's': printstring(va_arg(va, char*)); break;
        default: break;
      }
    } else {
      write(1, cur++, 1);
    }
  }

  va_end(va);
}

/**
 * A helper function for error reporting
 * @message The error message
 * @line The line number
 * @file The file name
*/
void error(char *message, int line, char *file) {
  print("%s: %s, line #%d\n", message, file, line);
  exit(1);
}

// ----------------------------------------------------------------------
// I/O Management Functions
// ----------------------------------------------------------------------

/**
 * Writes a character to stdout
 * @out The Floyd Writer object
 * @ch The character to print
*/
void Writer_io_write(int* out, int ch) {
  char c = ch;
  write(1, &c, 1);  
  out[REF]--;
}

/**
 * Reads a character from stdin
 * @in The Floyd Reader object
 * @return The character
*/
int Reader_io_read(int* in) {
  char c;
  read(0, &c, 1);
  in[REF]--;
  return c;
}

/**
 * Helper function to print null pointer exceptions
 * @line The line it occurred on
 * @file The file name
*/
void nullexception(int line, char *file) {
  error("Null pointer exception", line, file);
}

/**
 * Helper function to print inherit exception
 * @line The line it occurred on
 * @file The file
 * @to The type tryint to cast to
 * @from The type casting from
*/
void inheritexception(int line, char *file, char *to, char *from) {
  print("Invalid type cast from %s to %s: %s, line #%d\n", from, to, file, line);
  exit(1);
}

/**
 * Function to initialize memory for an n-dimension
 * array, and return the created object
 * @vtable The array's virtual function table
 * @classID The arrays' class ID
 * @n The number of dimensions
 * @... The dimension sizes
 * @return The initialized array
*/
int *addarray(int vtable, int classID, int n, ...) {
  int dim[n];
  int size = 1;
  int i;

  va_list va;
  va_start(va, n);
  for(i = 0; i < n; i++) {
    dim[i] = va_arg(va, int);
    size *= dim[i];
  }
  va_end(va);

  int *array = (int*) calloc(size + n + RESERVED, 4);
  allocated += (size + n + RESERVED) * 4;
  array[VTABLE] = vtable;
  array[CID] = -classID;
  array[SIZE] = size;
  array[DIM] = n;
  if(n > 1) { array[DIM + n - 1] = dim[n - 1]; }
  for(i = n - 2; i >= 1; i--) {
    array[DIM + i] = array[DIM + i + 1] * dim[i];
  }

  return array;
}

/**
 * Indexes an array, either returning the value or the pointer
 * to the requested slot in memory
 * @line The line number of access (for errors)
 * @file The file name
 * @array The array itself
 * @pointer Whether to return a pointer or value
 * @n The number of indexes
 * @... The size of each index
 * @return The value or pointer
*/
int indexarray(int line, char *file, int *array, int pointer, int n, ...) {
  if(!array) { nullexception(line, file); }

  int idx = 0;
  int i;

  va_list va;
  va_start(va, n);
  for(i = 0; i < n - 1; i++) {
    idx += va_arg(va, int) * array[DIM + i + 1];
  }
  idx += va_arg(va, int);
  va_end(va);

  if(idx >= array[SIZE] || idx < 0) {
    error("Array index out of bounds exception", line, file);
  }

  if(n != array[DIM]) {
    error("Subarray assignment exception", line, file);
  }

  idx += RESERVED + array[DIM];
  if(pointer) {
    return (int) (array + idx);
  } else {
    return array[idx];
  }
}

/**
 * Adds an object, initializing its attributes
 * @vtable The object's virtual function table
 * @size The object's size
 * @return The initialized object
*/
int *addobject(int vtable, int size) {
  int *object = (int*) calloc(size + RESERVED, 4);
  allocated += (size + RESERVED) * 4;
  object[VTABLE] = vtable;
  object[CID] = vtable;
  object[SIZE] = size;
  return object;
}

/**
 * Destroys the object, releasing any possible
 * memory it has claimed. Tracks the number
 * of bytes allocated and freed
 * @object The object to destroy
*/
void destroyobject(int *object) {
  int i;
  if(object[CID] <= 0) {
    if(object[CID] < 0) { // Class Type
      int start = RESERVED + object[DIM];
      for(i = start; i < object[SIZE] + start; i++) {
        // Call the object's destroy method
        if(object[i]) { calldestroy(object[i]); } 
      }
    }
    freed += (RESERVED + object[DIM] + object[SIZE]) * 4;
  } else {
    freed += (object[SIZE] + RESERVED) * 4;
  }
  free(object);
  object = NULL;
}

/**
 * Prints out some stats at the end of every program run
*/
void stats() {
  print("----------------------\n");
  print("Program Complete.\n");
  print("%d bytes allocated.\n", allocated);
  print("%d bytes freed.\n", freed);
  print("%d bytes active.\n", allocated - freed);
  print("----------------------\n");
}

/**
 * Constructs a Floyd String from the given 
 * string literal and vtable
 * @lit The string literal
 * @vtable The virtual function table
 * @return The initialized string
*/
int *createstring(char *lit, int vtable) {
  int *newStr = addobject(vtable, 1);
  Stringinit(newStr);
  while (*lit) {
    newStr[REF]++;
    String_appendChar(newStr, *lit);
    lit++;
  }

  return newStr; 
}