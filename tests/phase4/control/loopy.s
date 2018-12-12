.data

	# Line 2: x: int
	.comm _x, 4, 4

.text
.global main
	.type  main,  @function
main:
	call   start 

	# Line 18: Exit call
	pushl  $0    
	call   exit  



.global start
	.type  start, @function
start:

	# Line 6: x := 3
	pushl  $3    
	popl   _x    

	# Line 7: if (x > 0) then
	pushl  _x    
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	setg   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if0  
	jmp    _else0
_if0:

	# Line 8: loop while x > 0
_while0:
	pushl  _x    
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	setg   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _whilebody0
	jmp    _endwhile0
_whilebody0:

	# Line 9: out.writeint(x)
	pushl  _x    
	call   writeint
	addl   $4,    %esp  

	# Line 10: x := x - 1
	pushl  _x    
	pushl  $1    
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	popl   _x    
	jmp    _while0
_endwhile0:
	jmp    _endif0
_else0:

	# Line 13: out.writeint(999)
	pushl  $999  
	call   writeint
	addl   $4,    %esp  
_endif0:
	ret          

