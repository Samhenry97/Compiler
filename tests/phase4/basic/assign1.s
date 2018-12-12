	# Global variables
.data
	.comm  _in,   4,4
	.comm  _out,  4,4

	.section .rodata
.stringlit0:
	.string "unknown"
.stringlit1:
	.string "stdlib.floyd"
.stringlit2:
	.string "../tests/phase4/basic/assign1.floyd"
.stringlit3:
	.string "IntVector"
.stringlit4:
	.string "Reader"
.stringlit5:
	.string "String"
.stringlit6:
	.string "Array"
.stringlit7:
	.string "Integer"
.stringlit8:
	.string "Assign1"
.stringlit9:
	.string "Oyd"
.stringlit10:
	.string "Boolean"
.stringlit11:
	.string "Vector"
.stringlit12:
	.string "Map"
.stringlit13:
	.string "Writer"

.text

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 6: class Oyd is  |
	# |                                      |
	# \**************************************/
	#    *******                  **
	#   *********                 **
	#  ***********                **
	#  ***     *** ***   ***  ******
	#  ***     *** **** **** *******
	#  ***     *** **** **** *******
	#  ***     ***  *** ***  ***  **
	#  ***     ***  *******  ***  **
	#  ***********   *****   *******
	#   *********    *****   *******
	#    *******      ***     ******
	#              ******
	#              *****
	#              *****
.global Oyddestroy
	.type  Oyddestroy, @function
Oyddestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy0
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy0
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy0:
	leave
	ret

.global Oydname
	.type  Oydname, @function
Oydname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit9, %eax
	leave
	ret


	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 7: toString(): string is  |
	# |                                               |
	# \***********************************************/
.global Oyd_toString
	.type  Oyd_toString, @function
Oyd_toString:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 9: toString := "none"  |
	# |                                            |
	# \********************************************/
	.section .rodata
.stringlit14:
	.string "none"
.text
	pushl  $Stringvtable
	pushl  $.stringlit14
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy1
_destroy2:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy1
	cmpl   $0,    %ebx
	jne    _destroy2
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $9
	movl   $0,    %eax
	call   inheritexception
_destroy1:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy3
	addl   $1,    4(%ecx)
_destroy3:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy4
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy4:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy5
	subl   $1,    4(%eax)
_destroy5:
	leave
	ret


	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 12: val(): Oyd is  |
	# |                                        |
	# \****************************************/
.global Oyd_val
	.type  Oyd_val, @function
Oyd_val:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 14: val := null  |
	# |                                      |
	# \**************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy6
_destroy7:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy6
	cmpl   $0,    %ebx
	jne    _destroy7
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $14
	movl   $0,    %eax
	call   inheritexception
_destroy6:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy8
	addl   $1,    4(%ecx)
_destroy8:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy9
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy9:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy10
	subl   $1,    4(%eax)
_destroy10:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 17: eq(other: Oyd): boolean is  |
	# |                                                     |
	# \*****************************************************/
.global Oyd_eq
	.type  Oyd_eq, @function
Oyd_eq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 19: eq := true  |
	# |                                     |
	# \*************************************/
	movl   $1,    -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy11
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy11:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 22: neq(other: Oyd): boolean is  |
	# |                                                      |
	# \******************************************************/
.global Oyd_neq
	.type  Oyd_neq, @function
Oyd_neq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 24: neq := not eq(other)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy12
_destroy13:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy12
	cmpl   $0,    %ebx
	jne    _destroy13
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $24
	movl   $0,    %eax
	call   inheritexception
_destroy12:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy14
	addl   $1,    4(%ecx)
_destroy14:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest0
	pushl  $.stringlit1
	pushl  $24
	movl   $0,    %eax
	call   nullexception
_nulltest0:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   20(%eax), %ebx
	call   *%ebx              # eq()
	addl   $8,    %esp
	xorl   $1,    %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy15
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy15:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 27: _lt_(other: Oyd): boolean is  |
	# |                                                       |
	# \*******************************************************/
.global Oyd__lt_
	.type  Oyd__lt_, @function
Oyd__lt_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 29: _lt_ := true  |
	# |                                       |
	# \***************************************/
	movl   $1,    -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy16
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy16:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 32: _lteq_(other: Oyd): boolean is  |
	# |                                                         |
	# \*********************************************************/
.global Oyd__lteq_
	.type  Oyd__lteq_, @function
Oyd__lteq_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 34: _lteq_ := _lt_(other) or eq(other)  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy17
_destroy18:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy17
	cmpl   $0,    %ebx
	jne    _destroy18
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $34
	movl   $0,    %eax
	call   inheritexception
_destroy17:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy19
	addl   $1,    4(%ecx)
_destroy19:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest1
	pushl  $.stringlit1
	pushl  $34
	movl   $0,    %eax
	call   nullexception
_nulltest1:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   28(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy20
_destroy21:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy20
	cmpl   $0,    %ebx
	jne    _destroy21
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $34
	movl   $0,    %eax
	call   inheritexception
_destroy20:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy22
	addl   $1,    4(%ecx)
_destroy22:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest2
	pushl  $.stringlit1
	pushl  $34
	movl   $0,    %eax
	call   nullexception
_nulltest2:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   20(%eax), %ebx
	call   *%ebx              # eq()
	addl   $8,    %esp
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy23
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy23:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 37: _gteq_(other: Oyd): boolean is  |
	# |                                                         |
	# \*********************************************************/
.global Oyd__gteq_
	.type  Oyd__gteq_, @function
Oyd__gteq_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 39: _gteq_ := not _lt_(other)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy24
_destroy25:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy24
	cmpl   $0,    %ebx
	jne    _destroy25
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $39
	movl   $0,    %eax
	call   inheritexception
_destroy24:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy26
	addl   $1,    4(%ecx)
_destroy26:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest3
	pushl  $.stringlit1
	pushl  $39
	movl   $0,    %eax
	call   nullexception
_nulltest3:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   28(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	xorl   $1,    %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy27
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy27:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 42: _gt_(other: Oyd): boolean is  |
	# |                                                       |
	# \*******************************************************/
.global Oyd__gt_
	.type  Oyd__gt_, @function
Oyd__gt_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 44: _gt_ := not _lteq_(other)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy28
_destroy29:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy28
	cmpl   $0,    %ebx
	jne    _destroy29
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $44
	movl   $0,    %eax
	call   inheritexception
_destroy28:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy30
	addl   $1,    4(%ecx)
_destroy30:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest4
	pushl  $.stringlit1
	pushl  $44
	movl   $0,    %eax
	call   nullexception
_nulltest4:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   32(%eax), %ebx
	call   *%ebx              # _lteq_()
	addl   $8,    %esp
	xorl   $1,    %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy31
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy31:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 47: _and_(other: Oyd): boolean is  |
	# |                                                        |
	# \********************************************************/
.global Oyd__and_
	.type  Oyd__and_, @function
Oyd__and_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 49: _and_ := false  |
	# |                                         |
	# \*****************************************/
	movl   $0,    -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy32
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy32:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 52: _or_(other: Oyd): boolean is  |
	# |                                                       |
	# \*******************************************************/
.global Oyd__or_
	.type  Oyd__or_, @function
Oyd__or_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 54: _or_ := false  |
	# |                                        |
	# \****************************************/
	movl   $0,    -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy33
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy33:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 57: _add_(other: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Oyd__add_
	.type  Oyd__add_, @function
Oyd__add_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 59: _add_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy34
_destroy35:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy34
	cmpl   $0,    %ebx
	jne    _destroy35
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $59
	movl   $0,    %eax
	call   inheritexception
_destroy34:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy36
	addl   $1,    4(%ecx)
_destroy36:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy37
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy37:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy38
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy38:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy39
	subl   $1,    4(%eax)
_destroy39:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 62: _sub_(other: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Oyd__sub_
	.type  Oyd__sub_, @function
Oyd__sub_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 64: _sub_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy40
_destroy41:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy40
	cmpl   $0,    %ebx
	jne    _destroy41
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $64
	movl   $0,    %eax
	call   inheritexception
_destroy40:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy42
	addl   $1,    4(%ecx)
_destroy42:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy43
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy43:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy44
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy44:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy45
	subl   $1,    4(%eax)
_destroy45:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 67: _mul_(other: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Oyd__mul_
	.type  Oyd__mul_, @function
Oyd__mul_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 69: _mul_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy46
_destroy47:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy46
	cmpl   $0,    %ebx
	jne    _destroy47
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $69
	movl   $0,    %eax
	call   inheritexception
_destroy46:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy48
	addl   $1,    4(%ecx)
_destroy48:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy49
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy49:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy50
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy50:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy51
	subl   $1,    4(%eax)
_destroy51:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 72: _div_(other: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Oyd__div_
	.type  Oyd__div_, @function
Oyd__div_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 74: _div_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy52
_destroy53:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy52
	cmpl   $0,    %ebx
	jne    _destroy53
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $74
	movl   $0,    %eax
	call   inheritexception
_destroy52:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy54
	addl   $1,    4(%ecx)
_destroy54:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy55
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy55:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy56
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy56:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy57
	subl   $1,    4(%eax)
_destroy57:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 77: _cat_(other: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Oyd__cat_
	.type  Oyd__cat_, @function
Oyd__cat_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 79: _cat_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy58
_destroy59:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy58
	cmpl   $0,    %ebx
	jne    _destroy59
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $79
	movl   $0,    %eax
	call   inheritexception
_destroy58:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy60
	addl   $1,    4(%ecx)
_destroy60:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy61
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy61:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy62
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy62:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy63
	subl   $1,    4(%eax)
_destroy63:
	leave
	ret


	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 82: _idx_(val: Oyd): Oyd is  |
	# |                                                  |
	# \**************************************************/
.global Oyd__idx_
	.type  Oyd__idx_, @function
Oyd__idx_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 84: _idx_ := null  |
	# |                                        |
	# \****************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy64
_destroy65:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy64
	cmpl   $0,    %ebx
	jne    _destroy65
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $84
	movl   $0,    %eax
	call   inheritexception
_destroy64:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy66
	addl   $1,    4(%ecx)
_destroy66:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy67
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy67:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # val
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy68
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy68:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy69
	subl   $1,    4(%eax)
_destroy69:
	leave
	ret


	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 95: class Array is  |
	# |                                         |
	# \*****************************************/
	#    ****
	#    *****
	#    *****
	#   *******   ***** *****  ****** ***   ***
	#   *** ***   ***** *****  ****** **** ****
	#  **** ****  ***** *****  ****** **** ****
	#  **** ****  **    **    *******  *** ***
	#  *********  **    **    *******  *******
	# *********** **    **    *******   *****
	# ***     *** **    **    *******   *****
	# ***     *** **    **    *******    ***
	#                                 ******
	#                                 *****
	#                                 *****
.global Arraydestroy
	.type  Arraydestroy, @function
Arraydestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy70
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy70
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy70:
	leave
	ret

.global Arrayname
	.type  Arrayname, @function
Arrayname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit6, %eax
	leave
	ret


	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 107: class IntVector is  |
	# |                                              |
	# \**********************************************/
	#  **                 ***     ***
	#  **           **    ***     ***                  **
	#  **           **    ****   ****                  **
	#  **  *******  *****  ***   ***   *****    *****  *****   ******   *****
	#  **  *******  *****  **** ****  *******  ******  *****  ********  *****
	#  **  *******  **      *** ***   *******  ******  **     ********  *****
	#  **  **  ***  **      *******   *******  ***     **     ***  ***  **
	#  **  **   **  ***     *******   *******  ***     ***    ***  ***  **
	#  **  **   **  ******   *****    ******   ******  ****** ********  **
	#  **  **   **  ******   *****    ******   ******  ****** ********  **
	#  **  **   **  ******    ***      *****    *****  ******  ******   **
.global IntVectorinit
	.type  IntVectorinit, @function
IntVectorinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 108: data := new int[4]  |
	# |                                              |
	# \**********************************************/
	movl   $4,    %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy71
	addl   $1,    4(%ecx)
_destroy71:
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 109: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 110: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushl  $4
	movl   8(%ebp), %ecx
	popl   24(%ecx)
	leave
	ret

.global IntVectordestroy
	.type  IntVectordestroy, @function
IntVectordestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy72
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy72
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy73
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy73:
	call   destroyobject
	addl   $4,    %esp
_destroy72:
	leave
	ret

.global IntVectorname
	.type  IntVectorname, @function
IntVectorname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit3, %eax
	leave
	ret


	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 112: size(): int is  |
	# |                                          |
	# \******************************************/
.global IntVector_size
	.type  IntVector_size, @function
IntVector_size:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 114: size := last  |
	# |                                        |
	# \****************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 117: getData(): int[] is  |
	# |                                               |
	# \***********************************************/
.global IntVector_getData
	.type  IntVector_getData, @function
IntVector_getData:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 119: getData := data  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy74
	addl   $1,    4(%ecx)
_destroy74:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy75
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy75:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy76
	subl   $1,    4(%eax)
_destroy76:
	leave
	ret


	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 122: resize(allocSize: int): IntVector is  |
	# |                                                                |
	# \****************************************************************/
.global IntVector_resize
	.type  IntVector_resize, @function
IntVector_resize:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 123: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 124: tmp := new int[allocSize]  |
	# |                                                     |
	# \*****************************************************/
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy77
	addl   $1,    4(%ecx)
_destroy77:
	popl   -12(%ebp)

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 126: loop while not (idx >= last)  |
	# |                                                        |
	# \********************************************************/
_while0:
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody0
	jmp    _endwhile0
_whilebody0:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 127: tmp[idx] := data[idx]  |
	# |                                                 |
	# \*************************************************/
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	pushl  -12(%ebp)
	pushl  $.stringlit1
	pushl  $127
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $127
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 128: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while0
_endwhile0:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 131: data := tmp  |
	# |                                       |
	# \***************************************/
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy78
	addl   $1,    4(%ecx)
_destroy78:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy79
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy79:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 133: resize := me  |
	# |                                        |
	# \****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy80
_destroy81:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy80
	cmpl   $0,    %ebx
	jne    _destroy81
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $133
	movl   $0,    %eax
	call   inheritexception
_destroy80:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy82
	addl   $1,    4(%ecx)
_destroy82:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy83
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy83:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy84
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy84:
	addl   $4,    %esp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy85
	subl   $1,    4(%eax)
_destroy85:
	leave
	ret


	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 136: push_back(x: int): IntVector is  |
	# |                                                           |
	# \***********************************************************/
.global IntVector_push_back
	.type  IntVector_push_back, @function
IntVector_push_back:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 138: if last >= alloc then  |
	# |                                                 |
	# \*************************************************/
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # alloc
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if0
	jmp    _else0
_if0:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 139: alloc := alloc * 2  |
	# |                                              |
	# \**********************************************/
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # alloc
	movl   $2,    %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   24(%ecx)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 140: resize(alloc)  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest5
	pushl  $.stringlit1
	pushl  $140
	movl   $0,    %eax
	call   nullexception
_nulltest5:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # resize()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy86
	cmpl   $0,    4(%ebx)
	jg     _destroy86
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy86:
	jmp    _endif0
_else0:
_endif0:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 142: data[last] := x  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $142
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   12(%ebp), %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 143: last := last + 1  |
	# |                                            |
	# \********************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 144: push_back := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy87
_destroy88:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy87
	cmpl   $0,    %ebx
	jne    _destroy88
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $144
	movl   $0,    %eax
	call   inheritexception
_destroy87:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy89
	addl   $1,    4(%ecx)
_destroy89:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy90
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy90:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy91
	subl   $1,    4(%eax)
_destroy91:
	leave
	ret


	# /****************************************************************************\
	# |                                                                            |
	# |  stdlib.floyd, line 147: init(newData: int[]; newLast: int): IntVector is  |
	# |                                                                            |
	# \****************************************************************************/
.global IntVector_init
	.type  IntVector_init, @function
IntVector_init:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 148: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 150: loop while idx < newLast  |
	# |                                                    |
	# \****************************************************/
_while1:
	pushl  16(%ebp)           # newLast
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody1
	jmp    _endwhile1
_whilebody1:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 151: push_back(newData[idx])  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $151
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest6
	pushl  $.stringlit1
	pushl  $151
	movl   $0,    %eax
	call   nullexception
_nulltest6:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy92
	cmpl   $0,    4(%ebx)
	jg     _destroy92
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy92:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 152: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while1
_endwhile1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 155: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy93
_destroy94:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy93
	cmpl   $0,    %ebx
	jne    _destroy94
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $155
	movl   $0,    %eax
	call   inheritexception
_destroy93:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy95
	addl   $1,    4(%ecx)
_destroy95:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy96
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy96:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy97
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy97:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy98
	subl   $1,    4(%eax)
_destroy98:
	leave
	ret


	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 158: reserve(allocSize: int): IntVector is  |
	# |                                                                 |
	# \*****************************************************************/
.global IntVector_reserve
	.type  IntVector_reserve, @function
IntVector_reserve:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 160: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 161: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushl  12(%ebp)           # allocSize
	movl   8(%ebp), %ecx
	popl   24(%ecx)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 162: data := new int[alloc]  |
	# |                                                  |
	# \**************************************************/
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy99
	addl   $1,    4(%ecx)
_destroy99:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy100
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy100:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 164: reserve := me  |
	# |                                         |
	# \*****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy101
_destroy102:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy101
	cmpl   $0,    %ebx
	jne    _destroy102
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $164
	movl   $0,    %eax
	call   inheritexception
_destroy101:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy103
	addl   $1,    4(%ecx)
_destroy103:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy104
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy104:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy105
	subl   $1,    4(%eax)
_destroy105:
	leave
	ret


	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 167: copy(): IntVector is  |
	# |                                                |
	# \************************************************/
.global IntVector_copy
	.type  IntVector_copy, @function
IntVector_copy:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 169: copy := new IntVector.init(data, last)  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy106
	addl   $1,    4(%ecx)
_destroy106:

	# Pushing caller
	pushl  $3
	pushl  $IntVectorvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   IntVectorinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest7
	pushl  $.stringlit1
	pushl  $169
	movl   $0,    %eax
	call   nullexception
_nulltest7:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # init()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy107
_destroy108:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy107
	cmpl   $0,    %ebx
	jne    _destroy108
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $169
	movl   $0,    %eax
	call   inheritexception
_destroy107:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy109
	addl   $1,    4(%ecx)
_destroy109:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy110
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy110:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy111
	subl   $1,    4(%eax)
_destroy111:
	leave
	ret


	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 172: at(idx: int): int is  |
	# |                                                |
	# \************************************************/
.global IntVector_at
	.type  IntVector_at, @function
IntVector_at:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 174: at := data[idx]  |
	# |                                           |
	# \*******************************************/
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $174
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 177: insert(x: IntVector): IntVector is  |
	# |                                                              |
	# \**************************************************************/
.global IntVector_insert
	.type  IntVector_insert, @function
IntVector_insert:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 178: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 179: last := x.size()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest8
	pushl  $.stringlit1
	pushl  $179
	movl   $0,    %eax
	call   nullexception
_nulltest8:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 181: loop while idx < last  |
	# |                                                 |
	# \*************************************************/
_while2:
	pushl  -12(%ebp)          # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody2
	jmp    _endwhile2
_whilebody2:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 182: push_back(x.at(idx))  |
	# |                                                |
	# \************************************************/

	# Pushing parameters

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest9
	pushl  $.stringlit1
	pushl  $182
	movl   $0,    %eax
	call   nullexception
_nulltest9:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest10
	pushl  $.stringlit1
	pushl  $182
	movl   $0,    %eax
	call   nullexception
_nulltest10:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy112
	cmpl   $0,    4(%ebx)
	jg     _destroy112
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy112:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 183: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while2
_endwhile2:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 186: insert := me  |
	# |                                        |
	# \****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy113
_destroy114:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy113
	cmpl   $0,    %ebx
	jne    _destroy114
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $186
	movl   $0,    %eax
	call   inheritexception
_destroy113:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy115
	addl   $1,    4(%ecx)
_destroy115:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy116
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy116:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # x
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy117
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy117:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy118
	subl   $1,    4(%eax)
_destroy118:
	leave
	ret


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 189: partition(low: int; high: int): int is  |
	# |                                                                  |
	# \******************************************************************/
.global IntVector_partition
	.type  IntVector_partition, @function
IntVector_partition:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $20,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 190: pivot := data[high]  |
	# |                                               |
	# \***********************************************/
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $190
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	movl   %eax,  -8(%ebp)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 191: i := low - 1  |
	# |                                        |
	# \****************************************/
	pushl  12(%ebp)           # low
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 192: j := low  |
	# |                                    |
	# \************************************/
	pushl  12(%ebp)           # low
	popl   -16(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 193: tmp: int  |
	# |                                    |
	# \************************************/
	movl   $0,    -20(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 195: loop while not (j > high - 1)  |
	# |                                                         |
	# \*********************************************************/
_while3:
	pushl  16(%ebp)           # high
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -16(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody3
	jmp    _endwhile3
_whilebody3:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 196: if not (data[j] > pivot) then  |
	# |                                                         |
	# \*********************************************************/
	pushl  -8(%ebp)           # pivot
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $196
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if1
	jmp    _else1
_if1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 197: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 198: tmp := data[i]  |
	# |                                          |
	# \******************************************/
	movl   -12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $198
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	movl   %eax,  -20(%ebp)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 199: data[i] := data[j]  |
	# |                                              |
	# \**********************************************/
	movl   -12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $199
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $199
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 200: data[j] := tmp  |
	# |                                          |
	# \******************************************/
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $200
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -20(%ebp), %eax
	popl   %ecx
	movl   %eax,  (%ecx)
	jmp    _endif1
_else1:
_endif1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 202: j := j + 1  |
	# |                                      |
	# \**************************************/
	pushl  -16(%ebp)          # j
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _while3
_endwhile3:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 205: tmp := data[i + 1]  |
	# |                                              |
	# \**********************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $205
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	movl   %eax,  -20(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 206: data[i + 1] := data[high]  |
	# |                                                     |
	# \*****************************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $206
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $206
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	popl   %ecx
	movl   %eax,  (%ecx)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 207: data[high] := tmp  |
	# |                                             |
	# \*********************************************/
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $207
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -20(%ebp), %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 209: partition := i + 1  |
	# |                                              |
	# \**********************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /************************************************************************\
	# |                                                                        |
	# |  stdlib.floyd, line 212: quicksort(low: int; high: int): IntVector is  |
	# |                                                                        |
	# \************************************************************************/
.global IntVector_quicksort
	.type  IntVector_quicksort, @function
IntVector_quicksort:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 213: pivot: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 215: if not (low >= high) then  |
	# |                                                     |
	# \*****************************************************/
	pushl  16(%ebp)           # high
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if2
	jmp    _else2
_if2:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 216: pivot := partition(low, high)  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	movl   16(%ebp), %eax
	pushl  %eax
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest11
	pushl  $.stringlit1
	pushl  $216
	movl   $0,    %eax
	call   nullexception
_nulltest11:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # partition()
	addl   $12,   %esp
	movl   %eax,  -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 217: quicksort(low, pivot - 1)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # pivot
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest12
	pushl  $.stringlit1
	pushl  $217
	movl   $0,    %eax
	call   nullexception
_nulltest12:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy119
	cmpl   $0,    4(%ebx)
	jg     _destroy119
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy119:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 218: quicksort(pivot + 1, high)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  -8(%ebp)           # pivot
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest13
	pushl  $.stringlit1
	pushl  $218
	movl   $0,    %eax
	call   nullexception
_nulltest13:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy120
	cmpl   $0,    4(%ebx)
	jg     _destroy120
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy120:
	jmp    _endif2
_else2:
_endif2:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 221: quicksort := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy121
_destroy122:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy121
	cmpl   $0,    %ebx
	jne    _destroy122
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $221
	movl   $0,    %eax
	call   inheritexception
_destroy121:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy123
	addl   $1,    4(%ecx)
_destroy123:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy124
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy124:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy125
	subl   $1,    4(%eax)
_destroy125:
	leave
	ret


	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 224: sort(): IntVector is  |
	# |                                                |
	# \************************************************/
.global IntVector_sort
	.type  IntVector_sort, @function
IntVector_sort:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 226: sort := quicksort(0, last - 1)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   $0,    %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest14
	pushl  $.stringlit1
	pushl  $226
	movl   $0,    %eax
	call   nullexception
_nulltest14:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy126
_destroy127:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy126
	cmpl   $0,    %ebx
	jne    _destroy127
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $226
	movl   $0,    %eax
	call   inheritexception
_destroy126:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy128
	addl   $1,    4(%ecx)
_destroy128:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy129
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy129:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy130
	subl   $1,    4(%eax)
_destroy130:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 235: class String is  |
	# |                                           |
	# \*******************************************/
	#   ******              ****
	#  *******  **          ****
	#  *******  **
	#  ***      *****  ***** **  *******   ******
	#  ******   *****  ***** **  *******  *******
	#  *******  **     ***** **  *******  *******
	#    *****  **     **    **  **  ***  ***  **
	#      ***  ***    **    **  **   **  ***  **
	#  *******  ****** **    **  **   **  *******
	#  *******  ****** **    **  **   **  *******
	#  *******  ****** **    **  **   **   ******
	#                                     *******
	#                                     *******
	#                                     *******
.global Stringinit
	.type  Stringinit, @function
Stringinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 236: data := new IntVector  |
	# |                                                 |
	# \*************************************************/
	pushl  $3
	pushl  $IntVectorvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   IntVectorinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy131
_destroy132:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy131
	cmpl   $0,    %ebx
	jne    _destroy132
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $236
	movl   $0,    %eax
	call   inheritexception
_destroy131:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy133
	addl   $1,    4(%ecx)
_destroy133:
	movl   8(%ebp), %ecx
	popl   16(%ecx)
	leave
	ret

.global Stringdestroy
	.type  Stringdestroy, @function
Stringdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy134
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy134
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy135
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy135:
	call   destroyobject
	addl   $4,    %esp
_destroy134:
	leave
	ret

.global Stringname
	.type  Stringname, @function
Stringname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit5, %eax
	leave
	ret


	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 238: size(): int is  |
	# |                                          |
	# \******************************************/
.global String_size
	.type  String_size, @function
String_size:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 240: size := data.size()  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest15
	pushl  $.stringlit1
	pushl  $240
	movl   $0,    %eax
	call   nullexception
_nulltest15:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 243: length(): int is  |
	# |                                            |
	# \********************************************/
.global String_length
	.type  String_length, @function
String_length:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 245: length := data.size()  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest16
	pushl  $.stringlit1
	pushl  $245
	movl   $0,    %eax
	call   nullexception
_nulltest16:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 248: getData(): IntVector is  |
	# |                                                   |
	# \***************************************************/
.global String_getData
	.type  String_getData, @function
String_getData:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 250: getData := data  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy136
_destroy137:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy136
	cmpl   $0,    %ebx
	jne    _destroy137
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $250
	movl   $0,    %eax
	call   inheritexception
_destroy136:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy138
	addl   $1,    4(%ecx)
_destroy138:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy139
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy139:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy140
	subl   $1,    4(%eax)
_destroy140:
	leave
	ret


	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 253: init(newData: IntVector): String is  |
	# |                                                               |
	# \***************************************************************/
.global String_init
	.type  String_init, @function
String_init:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 255: data := newData  |
	# |                                           |
	# \*******************************************/
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy141
_destroy142:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy141
	cmpl   $0,    %ebx
	jne    _destroy142
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $255
	movl   $0,    %eax
	call   inheritexception
_destroy141:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy143
	addl   $1,    4(%ecx)
_destroy143:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy144
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy144:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 256: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy145
_destroy146:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy145
	cmpl   $0,    %ebx
	jne    _destroy146
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $256
	movl   $0,    %eax
	call   inheritexception
_destroy145:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy147
	addl   $1,    4(%ecx)
_destroy147:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy148
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy148:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy149
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy149:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy150
	subl   $1,    4(%eax)
_destroy150:
	leave
	ret


	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 259: appendChar(ch: int): String is  |
	# |                                                          |
	# \**********************************************************/
.global String_appendChar
	.type  String_appendChar, @function
String_appendChar:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 261: data.push_back(ch)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest17
	pushl  $.stringlit1
	pushl  $261
	movl   $0,    %eax
	call   nullexception
_nulltest17:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy151
	cmpl   $0,    4(%ebx)
	jg     _destroy151
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy151:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 262: appendChar := me  |
	# |                                            |
	# \********************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy152
_destroy153:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy152
	cmpl   $0,    %ebx
	jne    _destroy153
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $262
	movl   $0,    %eax
	call   inheritexception
_destroy152:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy154
	addl   $1,    4(%ecx)
_destroy154:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy155
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy155:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy156
	subl   $1,    4(%eax)
_destroy156:
	leave
	ret


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 265: catIntHelper(num: int; str: String) is  |
	# |                                                                  |
	# \******************************************************************/
.global String_catIntHelper
	.type  String_catIntHelper, @function
String_catIntHelper:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 266: digit: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 268: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushl  12(%ebp)           # num
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 269: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx
	popl   %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if3
	jmp    _else3
_if3:

	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 270: catIntHelper(num / 10, str)  |
	# |                                                       |
	# \*******************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy157
_destroy158:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy157
	cmpl   $0,    %ebx
	jne    _destroy158
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $270
	movl   $0,    %eax
	call   inheritexception
_destroy157:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy159
	addl   $1,    4(%ecx)
_destroy159:
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest18
	pushl  $.stringlit1
	pushl  $270
	movl   $0,    %eax
	call   nullexception
_nulltest18:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # catIntHelper()
	addl   $12,   %esp
	jmp    _endif3
_else3:
_endif3:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 272: str.appendChar(digit + 48)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # digit
	movl   $48,   %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   16(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest19
	pushl  $.stringlit1
	pushl  $272
	movl   $0,    %eax
	call   nullexception
_nulltest19:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy160
	cmpl   $0,    4(%ebx)
	jg     _destroy160
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy160:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  16(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy161
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy161:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 275: copy(): String is  |
	# |                                             |
	# \*********************************************/
.global String_copy
	.type  String_copy, @function
String_copy:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 277: copy := new String.init(data.copy())  |
	# |                                                                |
	# \****************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest20
	pushl  $.stringlit1
	pushl  $277
	movl   $0,    %eax
	call   nullexception
_nulltest20:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy162
_destroy163:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy162
	cmpl   $0,    %ebx
	jne    _destroy163
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $277
	movl   $0,    %eax
	call   inheritexception
_destroy162:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy164
	addl   $1,    4(%ecx)
_destroy164:

	# Pushing caller
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest21
	pushl  $.stringlit1
	pushl  $277
	movl   $0,    %eax
	call   nullexception
_nulltest21:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy165
_destroy166:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy165
	cmpl   $0,    %ebx
	jne    _destroy166
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $277
	movl   $0,    %eax
	call   inheritexception
_destroy165:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy167
	addl   $1,    4(%ecx)
_destroy167:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy168
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy168:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy169
	subl   $1,    4(%eax)
_destroy169:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 280: cat(str: String): String is  |
	# |                                                       |
	# \*******************************************************/
.global String_cat
	.type  String_cat, @function
String_cat:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 281: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest22
	pushl  $.stringlit1
	pushl  $281
	movl   $0,    %eax
	call   nullexception
_nulltest22:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy170
_destroy171:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy170
	cmpl   $0,    %ebx
	jne    _destroy171
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $281
	movl   $0,    %eax
	call   inheritexception
_destroy170:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy172
	addl   $1,    4(%ecx)
_destroy172:
	popl   -8(%ebp)

	# Statement list

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 283: newStr.getData().insert(str.getData())  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest23
	pushl  $.stringlit1
	pushl  $283
	movl   $0,    %eax
	call   nullexception
_nulltest23:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy173
_destroy174:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy173
	cmpl   $0,    %ebx
	jne    _destroy174
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $283
	movl   $0,    %eax
	call   inheritexception
_destroy173:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy175
	addl   $1,    4(%ecx)
_destroy175:

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest24
	pushl  $.stringlit1
	pushl  $283
	movl   $0,    %eax
	call   nullexception
_nulltest24:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest25
	pushl  $.stringlit1
	pushl  $283
	movl   $0,    %eax
	call   nullexception
_nulltest25:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # insert()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy176
	cmpl   $0,    4(%ebx)
	jg     _destroy176
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy176:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 284: cat := newStr  |
	# |                                         |
	# \*****************************************/
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy177
_destroy178:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy177
	cmpl   $0,    %ebx
	jne    _destroy178
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $284
	movl   $0,    %eax
	call   inheritexception
_destroy177:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy179
	addl   $1,    4(%ecx)
_destroy179:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy180
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy180:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy181
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy181:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy182
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy182:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy183
	subl   $1,    4(%eax)
_destroy183:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 287: _cat_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global String__cat_
	.type  String__cat_, @function
String__cat_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 288: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy184
_destroy185:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy184
	cmpl   $0,    %ebx
	jne    _destroy185
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $288
	movl   $0,    %eax
	call   inheritexception
_destroy184:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy186
	addl   $1,    4(%ecx)
_destroy186:
	popl   -8(%ebp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 290: _cat_ := cat(tmp)  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy187
_destroy188:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy187
	cmpl   $0,    %ebx
	jne    _destroy188
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $290
	movl   $0,    %eax
	call   inheritexception
_destroy187:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy189
	addl   $1,    4(%ecx)
_destroy189:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest26
	pushl  $.stringlit1
	pushl  $290
	movl   $0,    %eax
	call   nullexception
_nulltest26:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # cat()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy190
_destroy191:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy190
	cmpl   $0,    %ebx
	jne    _destroy191
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $290
	movl   $0,    %eax
	call   inheritexception
_destroy190:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy192
	addl   $1,    4(%ecx)
_destroy192:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy193
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy193:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy194
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy194:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy195
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy195:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy196
	subl   $1,    4(%eax)
_destroy196:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 293: catChar(ch: int): String is  |
	# |                                                       |
	# \*******************************************************/
.global String_catChar
	.type  String_catChar, @function
String_catChar:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 294: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest27
	pushl  $.stringlit1
	pushl  $294
	movl   $0,    %eax
	call   nullexception
_nulltest27:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy197
_destroy198:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy197
	cmpl   $0,    %ebx
	jne    _destroy198
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $294
	movl   $0,    %eax
	call   inheritexception
_destroy197:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy199
	addl   $1,    4(%ecx)
_destroy199:
	popl   -8(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 296: newStr.appendChar(ch)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest28
	pushl  $.stringlit1
	pushl  $296
	movl   $0,    %eax
	call   nullexception
_nulltest28:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy200
	cmpl   $0,    4(%ebx)
	jg     _destroy200
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy200:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 297: catChar := newStr  |
	# |                                             |
	# \*********************************************/
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy201
_destroy202:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy201
	cmpl   $0,    %ebx
	jne    _destroy202
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $297
	movl   $0,    %eax
	call   inheritexception
_destroy201:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy203
	addl   $1,    4(%ecx)
_destroy203:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy204
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy204:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy205
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy205:
	addl   $4,    %esp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy206
	subl   $1,    4(%eax)
_destroy206:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 300: catInt(num: int): String is  |
	# |                                                       |
	# \*******************************************************/
.global String_catInt
	.type  String_catInt, @function
String_catInt:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 301: result: String  |
	# |                                          |
	# \******************************************/
	movl   $0,    -8(%ebp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 302: i: int  |
	# |                                  |
	# \**********************************/
	movl   $0,    -12(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 304: if not (num = 0) then  |
	# |                                                 |
	# \*************************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if4
	jmp    _else4
_if4:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 305: result := new String  |
	# |                                                |
	# \************************************************/
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy207
_destroy208:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy207
	cmpl   $0,    %ebx
	jne    _destroy208
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $305
	movl   $0,    %eax
	call   inheritexception
_destroy207:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy209
	addl   $1,    4(%ecx)
_destroy209:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy210
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy210:
	addl   $4,    %esp
	popl   -8(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 307: if (0 > num) then  |
	# |                                             |
	# \*********************************************/
	pushl  12(%ebp)           # num
	movl   $0,    %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if5
	jmp    _else5
_if5:

	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 308: result.appendChar(45) ~ minus sign  |
	# |                                                              |
	# \**************************************************************/

	# Pushing parameters
	movl   $45,   %eax
	pushl  %eax

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest29
	pushl  $.stringlit1
	pushl  $308
	movl   $0,    %eax
	call   nullexception
_nulltest29:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy211
	cmpl   $0,    4(%ebx)
	jg     _destroy211
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy211:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 309: num := -num  |
	# |                                       |
	# \***************************************/
	movl   12(%ebp), %eax
	negl   %eax
	movl   %eax,  12(%ebp)
	jmp    _endif5
_else5:
_endif5:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 313: catIntHelper(num, result)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy212
_destroy213:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy212
	cmpl   $0,    %ebx
	jne    _destroy213
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $313
	movl   $0,    %eax
	call   inheritexception
_destroy212:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy214
	addl   $1,    4(%ecx)
_destroy214:
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest30
	pushl  $.stringlit1
	pushl  $313
	movl   $0,    %eax
	call   nullexception
_nulltest30:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # catIntHelper()
	addl   $12,   %esp
	jmp    _endif4
_else4:

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 315: result := (new String).catChar(48) ~ 0  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters
	movl   $48,   %eax
	pushl  %eax

	# Pushing caller
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest31
	pushl  $.stringlit1
	pushl  $315
	movl   $0,    %eax
	call   nullexception
_nulltest31:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # catChar()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy215
_destroy216:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy215
	cmpl   $0,    %ebx
	jne    _destroy216
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $315
	movl   $0,    %eax
	call   inheritexception
_destroy215:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy217
	addl   $1,    4(%ecx)
_destroy217:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy218
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy218:
	addl   $4,    %esp
	popl   -8(%ebp)
_endif4:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 318: catInt := cat(result)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy219
_destroy220:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy219
	cmpl   $0,    %ebx
	jne    _destroy220
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $318
	movl   $0,    %eax
	call   inheritexception
_destroy219:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy221
	addl   $1,    4(%ecx)
_destroy221:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest32
	pushl  $.stringlit1
	pushl  $318
	movl   $0,    %eax
	call   nullexception
_nulltest32:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # cat()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy222
_destroy223:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy222
	cmpl   $0,    %ebx
	jne    _destroy223
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $318
	movl   $0,    %eax
	call   inheritexception
_destroy222:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy224
	addl   $1,    4(%ecx)
_destroy224:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy225
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy225:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy226
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy226:
	addl   $4,    %esp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy227
	subl   $1,    4(%eax)
_destroy227:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 321: charAt(idx: int): int is  |
	# |                                                    |
	# \****************************************************/
.global String_charAt
	.type  String_charAt, @function
String_charAt:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 323: if 0 > idx or idx >= size() then  |
	# |                                                            |
	# \************************************************************/
	pushl  12(%ebp)           # idx
	movl   $0,    %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	pushl  %eax

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest33
	pushl  $.stringlit1
	pushl  $323
	movl   $0,    %eax
	call   nullexception
_nulltest33:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	cmpl   $0,    %eax
	jne    _if6
	jmp    _else6
_if6:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 324: charAt := -1  |
	# |                                        |
	# \****************************************/
	movl   $-1,   -4(%ebp)
	jmp    _endif6
_else6:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 326: charAt := data.at(idx)  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest34
	pushl  $.stringlit1
	pushl  $326
	movl   $0,    %eax
	call   nullexception
_nulltest34:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	movl   %eax,  -4(%ebp)
_endif6:

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 331: eq(other: Oyd): boolean is  |
	# |                                                      |
	# \******************************************************/
.global String_eq
	.type  String_eq, @function
String_eq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 332: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy228
_destroy229:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy228
	cmpl   $0,    %ebx
	jne    _destroy229
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $332
	movl   $0,    %eax
	call   inheritexception
_destroy228:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy230
	addl   $1,    4(%ecx)
_destroy230:
	popl   -8(%ebp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 333: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -12(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 334: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest35
	pushl  $.stringlit1
	pushl  $334
	movl   $0,    %eax
	call   nullexception
_nulltest35:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -16(%ebp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 336: if not (len = tmp.length()) then  |
	# |                                                            |
	# \************************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest36
	pushl  $.stringlit1
	pushl  $336
	movl   $0,    %eax
	call   nullexception
_nulltest36:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	pushl  %eax
	movl   -16(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if7
	jmp    _else7
_if7:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 337: eq := false  |
	# |                                       |
	# \***************************************/
	movl   $0,    -4(%ebp)
	jmp    _endif7
_else7:

	# /*************************************************************************************\
	# |                                                                                     |
	# |  stdlib.floyd, line 339: loop while not (i >= len) and (charAt(i) = tmp.charAt(i))  |
	# |                                                                                     |
	# \*************************************************************************************/
_while4:
	pushl  -16(%ebp)          # len
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	pushl  %eax

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest37
	pushl  $.stringlit1
	pushl  $339
	movl   $0,    %eax
	call   nullexception
_nulltest37:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest38
	pushl  $.stringlit1
	pushl  $339
	movl   $0,    %eax
	call   nullexception
_nulltest38:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody4
	jmp    _endwhile4
_whilebody4:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 340: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while4
_endwhile4:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 342: eq := (i = len)  |
	# |                                           |
	# \*******************************************/
	pushl  -16(%ebp)          # len
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
_endif7:

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy231
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy231:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy232
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy232:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 346: gt(str: String): boolean is  |
	# |                                                       |
	# \*******************************************************/
.global String_gt
	.type  String_gt, @function
String_gt:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 347: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 348: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest39
	pushl  $.stringlit1
	pushl  $348
	movl   $0,    %eax
	call   nullexception
_nulltest39:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*****************************************************************************************************************\
	# |                                                                                                                 |
	# |  stdlib.floyd, line 350: loop while not (i >= len) and not (i >= str.length()) and (charAt(i) = str.charAt(i))  |
	# |                                                                                                                 |
	# \*****************************************************************************************************************/
_while5:
	pushl  -12(%ebp)          # len
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	pushl  %eax

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest40
	pushl  $.stringlit1
	pushl  $350
	movl   $0,    %eax
	call   nullexception
_nulltest40:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	pushl  %eax

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest41
	pushl  $.stringlit1
	pushl  $350
	movl   $0,    %eax
	call   nullexception
_nulltest41:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest42
	pushl  $.stringlit1
	pushl  $350
	movl   $0,    %eax
	call   nullexception
_nulltest42:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody5
	jmp    _endwhile5
_whilebody5:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 351: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -8(%ebp)           # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while5
_endwhile5:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 353: if (i >= len) or (i >= str.length()) then  |
	# |                                                                     |
	# \*********************************************************************/
	pushl  -12(%ebp)          # len
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	pushl  %eax

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest43
	pushl  $.stringlit1
	pushl  $353
	movl   $0,    %eax
	call   nullexception
_nulltest43:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	cmpl   $0,    %eax
	jne    _if8
	jmp    _else8
_if8:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 354: gt := len > str.length()  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest44
	pushl  $.stringlit1
	pushl  $354
	movl   $0,    %eax
	call   nullexception
_nulltest44:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
	jmp    _endif8
_else8:

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 356: gt := (charAt(i) > str.charAt(i))  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest45
	pushl  $.stringlit1
	pushl  $356
	movl   $0,    %eax
	call   nullexception
_nulltest45:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest46
	pushl  $.stringlit1
	pushl  $356
	movl   $0,    %eax
	call   nullexception
_nulltest46:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
_endif8:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy233
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy233:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 360: gteq(str: String): boolean is  |
	# |                                                         |
	# \*********************************************************/
.global String_gteq
	.type  String_gteq, @function
String_gteq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 362: gteq := gt(str) or eq(str)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy234
_destroy235:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy234
	cmpl   $0,    %ebx
	jne    _destroy235
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $362
	movl   $0,    %eax
	call   inheritexception
_destroy234:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy236
	addl   $1,    4(%ecx)
_destroy236:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest47
	pushl  $.stringlit1
	pushl  $362
	movl   $0,    %eax
	call   nullexception
_nulltest47:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # gt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy237
_destroy238:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy237
	cmpl   $0,    %ebx
	jne    _destroy238
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $362
	movl   $0,    %eax
	call   inheritexception
_destroy237:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy239
	addl   $1,    4(%ecx)
_destroy239:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest48
	pushl  $.stringlit1
	pushl  $362
	movl   $0,    %eax
	call   nullexception
_nulltest48:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   20(%eax), %ebx
	call   *%ebx              # eq()
	addl   $8,    %esp
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy240
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy240:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 365: _lt_(other: Oyd): boolean is  |
	# |                                                        |
	# \********************************************************/
.global String__lt_
	.type  String__lt_, @function
String__lt_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 366: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy241
_destroy242:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy241
	cmpl   $0,    %ebx
	jne    _destroy242
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $366
	movl   $0,    %eax
	call   inheritexception
_destroy241:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy243
	addl   $1,    4(%ecx)
_destroy243:
	popl   -8(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 368: _lt_ := not gteq(tmp)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy244
_destroy245:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy244
	cmpl   $0,    %ebx
	jne    _destroy245
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $368
	movl   $0,    %eax
	call   inheritexception
_destroy244:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy246
	addl   $1,    4(%ecx)
_destroy246:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest49
	pushl  $.stringlit1
	pushl  $368
	movl   $0,    %eax
	call   nullexception
_nulltest49:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   124(%eax), %ebx
	call   *%ebx              # gteq()
	addl   $8,    %esp
	xorl   $1,    %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy247
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy247:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy248
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy248:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 371: toString(): String is  |
	# |                                                 |
	# \*************************************************/
.global String_toString
	.type  String_toString, @function
String_toString:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 373: toString := me  |
	# |                                          |
	# \******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy249
_destroy250:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy249
	cmpl   $0,    %ebx
	jne    _destroy250
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $373
	movl   $0,    %eax
	call   inheritexception
_destroy249:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy251
	addl   $1,    4(%ecx)
_destroy251:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy252
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy252:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy253
	subl   $1,    4(%eax)
_destroy253:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 386: class Writer is  |
	# |                                           |
	# \*******************************************/
	# ***         ***      ****
	# ***   ***   ***      **** **
	# ***  *****  ***           **
	# **** ***** **** ***** **  *****   *****   *****
	#  *** ***** ***  ***** **  *****  *******  *****
	#  *** ***** ***  ***** **  **     *******  *****
	#  ****** ******  **    **  **     *******  **
	#   ***** *****   **    **  ***    *******  **
	#   ***** *****   **    **  ****** ******   **
	#   ***** *****   **    **  ****** ******   **
	#    ***   ***    **    **  ******  *****   **
.global Writerdestroy
	.type  Writerdestroy, @function
Writerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy254
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy254
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy254:
	leave
	ret

.global Writername
	.type  Writername, @function
Writername:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit13, %eax
	leave
	ret


	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 389: writechar(char: int): Writer is  |
	# |                                                           |
	# \***********************************************************/
.global Writer_writechar
	.type  Writer_writechar, @function
Writer_writechar:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 391: io_write(char)  |
	# |                                          |
	# \******************************************/

	# Pushing parameters
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest50
	pushl  $.stringlit1
	pushl  $391
	movl   $0,    %eax
	call   nullexception
_nulltest50:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 392: writechar := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy255
_destroy256:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy255
	cmpl   $0,    %ebx
	jne    _destroy256
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $392
	movl   $0,    %eax
	call   inheritexception
_destroy255:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy257
	addl   $1,    4(%ecx)
_destroy257:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy258
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy258:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy259
	subl   $1,    4(%eax)
_destroy259:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 397: writeintHelper(num: int) is  |
	# |                                                       |
	# \*******************************************************/
.global Writer_writeintHelper
	.type  Writer_writeintHelper, @function
Writer_writeintHelper:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 398: digit: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 400: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushl  12(%ebp)           # num
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 401: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx
	popl   %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if9
	jmp    _else9
_if9:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 402: writeintHelper(num / 10)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	movl   $0,    %edx
	idivl  %ebx

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest51
	pushl  $.stringlit1
	pushl  $402
	movl   $0,    %eax
	call   nullexception
_nulltest51:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # writeintHelper()
	addl   $8,    %esp
	jmp    _endif9
_else9:
_endif9:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 404: io_write(digit + 48)  |
	# |                                                |
	# \************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # digit
	movl   $48,   %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest52
	pushl  $.stringlit1
	pushl  $404
	movl   $0,    %eax
	call   nullexception
_nulltest52:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 408: writeint(num: int): Writer is  |
	# |                                                         |
	# \*********************************************************/
.global Writer_writeint
	.type  Writer_writeint, @function
Writer_writeint:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 410: if (num = 0) then  |
	# |                                             |
	# \*********************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if10
	jmp    _else10
_if10:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 411: io_write(48)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movl   $48,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest53
	pushl  $.stringlit1
	pushl  $411
	movl   $0,    %eax
	call   nullexception
_nulltest53:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp
	jmp    _endif10
_else10:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 413: if not (num >= 0) then  |
	# |                                                  |
	# \**************************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if11
	jmp    _else11
_if11:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 414: io_write(45) ~ - symbol  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movl   $45,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest54
	pushl  $.stringlit1
	pushl  $414
	movl   $0,    %eax
	call   nullexception
_nulltest54:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 415: num := -num  |
	# |                                       |
	# \***************************************/
	movl   12(%ebp), %eax
	negl   %eax
	movl   %eax,  12(%ebp)
	jmp    _endif11
_else11:
_endif11:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 417: writeintHelper(num)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest55
	pushl  $.stringlit1
	pushl  $417
	movl   $0,    %eax
	call   nullexception
_nulltest55:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # writeintHelper()
	addl   $8,    %esp
_endif10:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 420: io_write(13)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movl   $13,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest56
	pushl  $.stringlit1
	pushl  $420
	movl   $0,    %eax
	call   nullexception
_nulltest56:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 421: io_write(10)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movl   $10,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest57
	pushl  $.stringlit1
	pushl  $421
	movl   $0,    %eax
	call   nullexception
_nulltest57:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 423: writeint := me  |
	# |                                          |
	# \******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy260
_destroy261:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy260
	cmpl   $0,    %ebx
	jne    _destroy261
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $423
	movl   $0,    %eax
	call   inheritexception
_destroy260:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy262
	addl   $1,    4(%ecx)
_destroy262:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy263
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy263:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy264
	subl   $1,    4(%eax)
_destroy264:
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 427: write(str: String): Writer is  |
	# |                                                         |
	# \*********************************************************/
.global Writer_write
	.type  Writer_write, @function
Writer_write:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 428: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -8(%ebp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 429: len := str.length()  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest58
	pushl  $.stringlit1
	pushl  $429
	movl   $0,    %eax
	call   nullexception
_nulltest58:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 431: loop while not (i >= len)  |
	# |                                                     |
	# \*****************************************************/
_while6:
	pushl  -12(%ebp)          # len
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody6
	jmp    _endwhile6
_whilebody6:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 432: io_write(str.charAt(i))  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest59
	pushl  $.stringlit1
	pushl  $432
	movl   $0,    %eax
	call   nullexception
_nulltest59:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest60
	pushl  $.stringlit1
	pushl  $432
	movl   $0,    %eax
	call   nullexception
_nulltest60:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 433: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -8(%ebp)           # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while6
_endwhile6:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 436: write := me  |
	# |                                       |
	# \***************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy265
_destroy266:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy265
	cmpl   $0,    %ebx
	jne    _destroy266
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $436
	movl   $0,    %eax
	call   inheritexception
_destroy265:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy267
	addl   $1,    4(%ecx)
_destroy267:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy268
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy268:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy269
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy269:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy270
	subl   $1,    4(%eax)
_destroy270:
	leave
	ret


	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 440: writeln(str: String): Writer is  |
	# |                                                           |
	# \***********************************************************/
.global Writer_writeln
	.type  Writer_writeln, @function
Writer_writeln:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 442: write(str)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy271
_destroy272:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy271
	cmpl   $0,    %ebx
	jne    _destroy272
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $442
	movl   $0,    %eax
	call   inheritexception
_destroy271:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy273
	addl   $1,    4(%ecx)
_destroy273:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest61
	pushl  $.stringlit1
	pushl  $442
	movl   $0,    %eax
	call   nullexception
_nulltest61:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy274
	cmpl   $0,    4(%ebx)
	jg     _destroy274
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy274:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 443: io_write(13)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movl   $13,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest62
	pushl  $.stringlit1
	pushl  $443
	movl   $0,    %eax
	call   nullexception
_nulltest62:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 444: io_write(10)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movl   $10,   %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest63
	pushl  $.stringlit1
	pushl  $444
	movl   $0,    %eax
	call   nullexception
_nulltest63:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 445: writeln := me  |
	# |                                         |
	# \*****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy275
_destroy276:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy275
	cmpl   $0,    %ebx
	jne    _destroy276
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $445
	movl   $0,    %eax
	call   inheritexception
_destroy275:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy277
	addl   $1,    4(%ecx)
_destroy277:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy278
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy278:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy279
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy279:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy280
	subl   $1,    4(%eax)
_destroy280:
	leave
	ret


	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 448: writeObject(o: Oyd) is  |
	# |                                                  |
	# \**************************************************/
.global Writer_writeObject
	.type  Writer_writeObject, @function
Writer_writeObject:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 450: writeln(o.toString())  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest64
	pushl  $.stringlit1
	pushl  $450
	movl   $0,    %eax
	call   nullexception
_nulltest64:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   12(%eax), %ebx
	call   *%ebx              # toString()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy281
_destroy282:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy281
	cmpl   $0,    %ebx
	jne    _destroy282
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $450
	movl   $0,    %eax
	call   inheritexception
_destroy281:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy283
	addl   $1,    4(%ecx)
_destroy283:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest65
	pushl  $.stringlit1
	pushl  $450
	movl   $0,    %eax
	call   nullexception
_nulltest65:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # writeln()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy284
	cmpl   $0,    4(%ebx)
	jg     _destroy284
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy284:

	# Garbage collection (args)
	pushl  12(%ebp)           # o
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy285
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy285:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 463: class Reader is  |
	# |                                           |
	# \*******************************************/
	#  *******                          **
	#  ********                         **
	#  ********                         **
	#  **   ***   *****    ******   ******   *****   *****
	#  ** *****  *******   ******  *******  *******  *****
	#  ********  *******   ******  *******  *******  *****
	#  *******   *******  *******  ***  **  *******  **
	#  ** ****   *******  *******  ***  **  *******  **
	#  **  ****  ******   *******  *******  ******   **
	#  **   **** ******   *******  *******  ******   **
	#  **   ****  *****   *******   ******   *****   **
.global Readerdestroy
	.type  Readerdestroy, @function
Readerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy286
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy286
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy286:
	leave
	ret

.global Readername
	.type  Readername, @function
Readername:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit4, %eax
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 465: skipWS(): int is  |
	# |                                            |
	# \********************************************/
.global Reader_skipWS
	.type  Reader_skipWS, @function
Reader_skipWS:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 466: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest66
	pushl  $.stringlit1
	pushl  $466
	movl   $0,    %eax
	call   nullexception
_nulltest66:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# Statement list

	# /**************************************************************************\
	# |                                                                          |
	# |  stdlib.floyd, line 468: loop while char = 10 or char = 13 or char = 32  |
	# |                                                                          |
	# \**************************************************************************/
_while7:
	pushl  $10
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $13
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	pushl  %eax
	pushl  $32
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody7
	jmp    _endwhile7
_whilebody7:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 469: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest67
	pushl  $.stringlit1
	pushl  $469
	movl   $0,    %eax
	call   nullexception
_nulltest67:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while7
_endwhile7:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 471: skipWS := char  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # char
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 474: readline(): String is  |
	# |                                                 |
	# \*************************************************/
.global Reader_readline
	.type  Reader_readline, @function
Reader_readline:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 475: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest68
	pushl  $.stringlit1
	pushl  $475
	movl   $0,    %eax
	call   nullexception
_nulltest68:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 476: s := new String  |
	# |                                           |
	# \*******************************************/
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy287
_destroy288:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy287
	cmpl   $0,    %ebx
	jne    _destroy288
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $476
	movl   $0,    %eax
	call   inheritexception
_destroy287:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy289
	addl   $1,    4(%ecx)
_destroy289:
	popl   -12(%ebp)

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 478: loop while not (char = 10)  |
	# |                                                      |
	# \******************************************************/
_while8:
	pushl  $10
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody8
	jmp    _endwhile8
_whilebody8:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 479: if not (char = 13) then  |
	# |                                                   |
	# \***************************************************/
	pushl  $13
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if12
	jmp    _else12
_if12:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 480: s.appendChar(char)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   -12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest69
	pushl  $.stringlit1
	pushl  $480
	movl   $0,    %eax
	call   nullexception
_nulltest69:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy290
	cmpl   $0,    4(%ebx)
	jg     _destroy290
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy290:
	jmp    _endif12
_else12:
_endif12:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 482: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest70
	pushl  $.stringlit1
	pushl  $482
	movl   $0,    %eax
	call   nullexception
_nulltest70:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while8
_endwhile8:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 485: readline := s  |
	# |                                         |
	# \*****************************************/
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy291
_destroy292:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy291
	cmpl   $0,    %ebx
	jne    _destroy292
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $485
	movl   $0,    %eax
	call   inheritexception
_destroy291:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy293
	addl   $1,    4(%ecx)
_destroy293:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy294
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy294:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy295
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy295:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy296
	subl   $1,    4(%eax)
_destroy296:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 488: read(): String is  |
	# |                                             |
	# \*********************************************/
.global Reader_read
	.type  Reader_read, @function
Reader_read:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 489: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest71
	pushl  $.stringlit1
	pushl  $489
	movl   $0,    %eax
	call   nullexception
_nulltest71:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # skipWS()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 490: s := new String  |
	# |                                           |
	# \*******************************************/
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy297
_destroy298:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy297
	cmpl   $0,    %ebx
	jne    _destroy298
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $490
	movl   $0,    %eax
	call   inheritexception
_destroy297:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy299
	addl   $1,    4(%ecx)
_destroy299:
	popl   -12(%ebp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 492: loop while char != 10 and char != 13 and char != 32  |
	# |                                                                               |
	# \*******************************************************************************/
_while9:
	pushl  $10
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $13
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	pushl  %eax
	pushl  $32
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody9
	jmp    _endwhile9
_whilebody9:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 493: s.appendChar(char)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   -12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest72
	pushl  $.stringlit1
	pushl  $493
	movl   $0,    %eax
	call   nullexception
_nulltest72:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy300
	cmpl   $0,    4(%ebx)
	jg     _destroy300
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy300:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 494: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest73
	pushl  $.stringlit1
	pushl  $494
	movl   $0,    %eax
	call   nullexception
_nulltest73:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while9
_endwhile9:

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 497: read := s  |
	# |                                     |
	# \*************************************/
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy301
_destroy302:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy301
	cmpl   $0,    %ebx
	jne    _destroy302
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $497
	movl   $0,    %eax
	call   inheritexception
_destroy301:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy303
	addl   $1,    4(%ecx)
_destroy303:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy304
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy304:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy305
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy305:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy306
	subl   $1,    4(%eax)
_destroy306:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 500: readint(): int is  |
	# |                                             |
	# \*********************************************/
.global Reader_readint
	.type  Reader_readint, @function
Reader_readint:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 501: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest74
	pushl  $.stringlit1
	pushl  $501
	movl   $0,    %eax
	call   nullexception
_nulltest74:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # skipWS()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 502: mult := 1  |
	# |                                     |
	# \*************************************/
	movl   $1,    -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 503: num := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 505: if char = 45 then  |
	# |                                             |
	# \*********************************************/
	pushl  $45
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if13
	jmp    _else13
_if13:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 506: mult := -1  |
	# |                                      |
	# \**************************************/
	movl   $-1,   -12(%ebp)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 507: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest75
	pushl  $.stringlit1
	pushl  $507
	movl   $0,    %eax
	call   nullexception
_nulltest75:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	pushl  %eax
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _endif13
_else13:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 509: char := char - 48  |
	# |                                             |
	# \*********************************************/
	pushl  -8(%ebp)           # char
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
_endif13:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 512: loop while char >= 0 and not (char >= 10)  |
	# |                                                                     |
	# \*********************************************************************/
_while10:
	pushl  $0
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $10
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody10
	jmp    _endwhile10
_whilebody10:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 513: num := num * 10 + char  |
	# |                                                  |
	# \**************************************************/
	pushl  -16(%ebp)          # num
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax
	movl   -8(%ebp), %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 514: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest76
	pushl  $.stringlit1
	pushl  $514
	movl   $0,    %eax
	call   nullexception
_nulltest76:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	pushl  %eax
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while10
_endwhile10:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 517: readint := num * mult  |
	# |                                                 |
	# \*************************************************/
	pushl  -16(%ebp)          # num
	movl   -12(%ebp), %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 529: class Integer is  |
	# |                                            |
	# \********************************************/
	#  **
	#  **           **
	#  **           **
	#  **  *******  *****   *****    ******   *****   *****
	#  **  *******  *****  *******  *******  *******  *****
	#  **  *******  **     *******  *******  *******  *****
	#  **  **  ***  **     *******  ***  **  *******  **
	#  **  **   **  ***    *******  ***  **  *******  **
	#  **  **   **  ****** ******   *******  ******   **
	#  **  **   **  ****** ******   *******  ******   **
	#  **  **   **  ******  *****    ******   *****   **
	#                               *******
	#                               *******
	#                               *******
.global Integerinit
	.type  Integerinit, @function
Integerinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 530: _val := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   16(%ecx)
	leave
	ret

.global Integerdestroy
	.type  Integerdestroy, @function
Integerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy307
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy307
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy307:
	leave
	ret

.global Integername
	.type  Integername, @function
Integername:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit7, %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 532: init(newVal: int): Integer is  |
	# |                                                         |
	# \*********************************************************/
.global Integer_init
	.type  Integer_init, @function
Integer_init:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 534: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newVal
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 535: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy308
_destroy309:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy308
	cmpl   $0,    %ebx
	jne    _destroy309
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $535
	movl   $0,    %eax
	call   inheritexception
_destroy308:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy310
	addl   $1,    4(%ecx)
_destroy310:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy311
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy311:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy312
	subl   $1,    4(%eax)
_destroy312:
	leave
	ret


	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 538: toString(): String is  |
	# |                                                 |
	# \*************************************************/
.global Integer_toString
	.type  Integer_toString, @function
Integer_toString:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 540: toString := new String.catInt(_val)  |
	# |                                                               |
	# \***************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Pushing caller
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest77
	pushl  $.stringlit1
	pushl  $540
	movl   $0,    %eax
	call   nullexception
_nulltest77:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy313
_destroy314:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy313
	cmpl   $0,    %ebx
	jne    _destroy314
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $540
	movl   $0,    %eax
	call   inheritexception
_destroy313:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy315
	addl   $1,    4(%ecx)
_destroy315:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy316
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy316:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy317
	subl   $1,    4(%eax)
_destroy317:
	leave
	ret


	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 543: val(): int is  |
	# |                                         |
	# \*****************************************/
.global Integer_val
	.type  Integer_val, @function
Integer_val:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 545: val := _val  |
	# |                                       |
	# \***************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 548: _lt_(other: Oyd): boolean is  |
	# |                                                        |
	# \********************************************************/
.global Integer__lt_
	.type  Integer__lt_, @function
Integer__lt_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 549: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy318
_destroy319:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy318
	cmpl   $0,    %ebx
	jne    _destroy319
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $549
	movl   $0,    %eax
	call   inheritexception
_destroy318:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy320
	addl   $1,    4(%ecx)
_destroy320:
	popl   -8(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 551: _lt_ := _val < tmp.val()  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest78
	pushl  $.stringlit1
	pushl  $551
	movl   $0,    %eax
	call   nullexception
_nulltest78:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	pushl  %eax
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy321
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy321:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy322
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy322:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 554: eq(other: Oyd): boolean is  |
	# |                                                      |
	# \******************************************************/
.global Integer_eq
	.type  Integer_eq, @function
Integer_eq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 555: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy323
_destroy324:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy323
	cmpl   $0,    %ebx
	jne    _destroy324
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $555
	movl   $0,    %eax
	call   inheritexception
_destroy323:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy325
	addl   $1,    4(%ecx)
_destroy325:
	popl   -8(%ebp)

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 557: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest79
	pushl  $.stringlit1
	pushl  $557
	movl   $0,    %eax
	call   nullexception
_nulltest79:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	pushl  %eax
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy326
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy326:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy327
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy327:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 560: _and_(other: Oyd): boolean is  |
	# |                                                         |
	# \*********************************************************/
.global Integer__and_
	.type  Integer__and_, @function
Integer__and_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 561: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy328
_destroy329:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy328
	cmpl   $0,    %ebx
	jne    _destroy329
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $561
	movl   $0,    %eax
	call   inheritexception
_destroy328:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy330
	addl   $1,    4(%ecx)
_destroy330:
	popl   -8(%ebp)

	# Statement list

	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 563: _and_ := _val != 0 and tmp.val() != 0  |
	# |                                                                 |
	# \*****************************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $0

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest80
	pushl  $.stringlit1
	pushl  $563
	movl   $0,    %eax
	call   nullexception
_nulltest80:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy331
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy331:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy332
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy332:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 566: _or_(other: Oyd): boolean is  |
	# |                                                        |
	# \********************************************************/
.global Integer__or_
	.type  Integer__or_, @function
Integer__or_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 567: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy333
_destroy334:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy333
	cmpl   $0,    %ebx
	jne    _destroy334
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $567
	movl   $0,    %eax
	call   inheritexception
_destroy333:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy335
	addl   $1,    4(%ecx)
_destroy335:
	popl   -8(%ebp)

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 569: _or_ := _val != 0 or tmp.val() != 0  |
	# |                                                               |
	# \***************************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $0

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest81
	pushl  $.stringlit1
	pushl  $569
	movl   $0,    %eax
	call   nullexception
_nulltest81:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy336
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy336:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy337
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy337:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 572: _add_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global Integer__add_
	.type  Integer__add_, @function
Integer__add_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 573: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy338
_destroy339:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy338
	cmpl   $0,    %ebx
	jne    _destroy339
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $573
	movl   $0,    %eax
	call   inheritexception
_destroy338:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy340
	addl   $1,    4(%ecx)
_destroy340:
	popl   -8(%ebp)

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 575: _add_ := new Integer.init(_val + tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest82
	pushl  $.stringlit1
	pushl  $575
	movl   $0,    %eax
	call   nullexception
_nulltest82:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	movl   %eax,  %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  $1
	pushl  $Integervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Integerinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest83
	pushl  $.stringlit1
	pushl  $575
	movl   $0,    %eax
	call   nullexception
_nulltest83:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy341
_destroy342:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy341
	cmpl   $0,    %ebx
	jne    _destroy342
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $575
	movl   $0,    %eax
	call   inheritexception
_destroy341:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy343
	addl   $1,    4(%ecx)
_destroy343:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy344
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy344:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy345
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy345:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy346
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy346:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy347
	subl   $1,    4(%eax)
_destroy347:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 578: _sub_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global Integer__sub_
	.type  Integer__sub_, @function
Integer__sub_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 579: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy348
_destroy349:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy348
	cmpl   $0,    %ebx
	jne    _destroy349
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $579
	movl   $0,    %eax
	call   inheritexception
_destroy348:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy350
	addl   $1,    4(%ecx)
_destroy350:
	popl   -8(%ebp)

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 581: _sub_ := new Integer.init(_val - tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest84
	pushl  $.stringlit1
	pushl  $581
	movl   $0,    %eax
	call   nullexception
_nulltest84:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  $1
	pushl  $Integervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Integerinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest85
	pushl  $.stringlit1
	pushl  $581
	movl   $0,    %eax
	call   nullexception
_nulltest85:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy351
_destroy352:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy351
	cmpl   $0,    %ebx
	jne    _destroy352
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $581
	movl   $0,    %eax
	call   inheritexception
_destroy351:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy353
	addl   $1,    4(%ecx)
_destroy353:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy354
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy354:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy355
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy355:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy356
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy356:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy357
	subl   $1,    4(%eax)
_destroy357:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 584: _mul_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global Integer__mul_
	.type  Integer__mul_, @function
Integer__mul_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 585: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy358
_destroy359:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy358
	cmpl   $0,    %ebx
	jne    _destroy359
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $585
	movl   $0,    %eax
	call   inheritexception
_destroy358:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy360
	addl   $1,    4(%ecx)
_destroy360:
	popl   -8(%ebp)

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 587: _mul_ := new Integer.init(_val * tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest86
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest86:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	movl   %eax,  %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  $1
	pushl  $Integervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Integerinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest87
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest87:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy361
_destroy362:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy361
	cmpl   $0,    %ebx
	jne    _destroy362
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   inheritexception
_destroy361:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy363
	addl   $1,    4(%ecx)
_destroy363:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy364
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy364:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy365
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy365:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy366
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy366:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy367
	subl   $1,    4(%eax)
_destroy367:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 590: _div_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global Integer__div_
	.type  Integer__div_, @function
Integer__div_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 591: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy368
_destroy369:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy368
	cmpl   $0,    %ebx
	jne    _destroy369
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   inheritexception
_destroy368:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy370
	addl   $1,    4(%ecx)
_destroy370:
	popl   -8(%ebp)

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 593: _div_ := new Integer.init(_val / tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest88
	pushl  $.stringlit1
	pushl  $593
	movl   $0,    %eax
	call   nullexception
_nulltest88:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	movl   %eax,  %ebx
	movl   $0,    %edx
	idivl  %ebx

	# Pushing caller
	pushl  $1
	pushl  $Integervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Integerinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest89
	pushl  $.stringlit1
	pushl  $593
	movl   $0,    %eax
	call   nullexception
_nulltest89:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy371
_destroy372:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy371
	cmpl   $0,    %ebx
	jne    _destroy372
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $593
	movl   $0,    %eax
	call   inheritexception
_destroy371:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy373
	addl   $1,    4(%ecx)
_destroy373:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy374
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy374:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy375
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy375:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy376
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy376:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy377
	subl   $1,    4(%eax)
_destroy377:
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 603: class Boolean is  |
	# |                                            |
	# \********************************************/
	#  ********                       **
	#  ********                       **
	#  ********                       **
	#  ** *****    ******    ******   **   *****    ******  *******
	#  ********   ********  ********  **  *******   ******  *******
	#  *********  ********  ********  **  *******   ******  *******
	#  **  *****  ***  ***  ***  ***  **  *******  *******  **  ***
	#  **    ***  ***  ***  ***  ***  **  *******  *******  **   **
	#  *********  ********  ********  *** ******   *******  **   **
	#  *********  ********  ********  *** ******   *******  **   **
	#  ********    ******    ******   ***  *****   *******  **   **
.global Booleaninit
	.type  Booleaninit, @function
Booleaninit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 604: _val := false  |
	# |                                         |
	# \*****************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   16(%ecx)
	leave
	ret

.global Booleandestroy
	.type  Booleandestroy, @function
Booleandestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy378
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy378
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy378:
	leave
	ret

.global Booleanname
	.type  Booleanname, @function
Booleanname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit10, %eax
	leave
	ret


	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 606: init(newVal: boolean): Boolean is  |
	# |                                                             |
	# \*************************************************************/
.global Boolean_init
	.type  Boolean_init, @function
Boolean_init:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 608: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newVal
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 609: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy379
_destroy380:
	movl   (%ebx), %ebx
	cmpl   $Booleanvtable, %ebx
	je     _destroy379
	cmpl   $0,    %ebx
	jne    _destroy380
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit10
	pushl  $.stringlit1
	pushl  $609
	movl   $0,    %eax
	call   inheritexception
_destroy379:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy381
	addl   $1,    4(%ecx)
_destroy381:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy382
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy382:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy383
	subl   $1,    4(%eax)
_destroy383:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 612: val(): boolean is  |
	# |                                             |
	# \*********************************************/
.global Boolean_val
	.type  Boolean_val, @function
Boolean_val:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 614: val := _val  |
	# |                                       |
	# \***************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 617: toString(): String is  |
	# |                                                 |
	# \*************************************************/
.global Boolean_toString
	.type  Boolean_toString, @function
Boolean_toString:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 619: if _val then  |
	# |                                        |
	# \****************************************/
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	cmpl   $0,    %eax
	jne    _if14
	jmp    _else14
_if14:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 620: toString := "true"  |
	# |                                              |
	# \**********************************************/
	.section .rodata
.stringlit15:
	.string "true"
.text
	pushl  $Stringvtable
	pushl  $.stringlit15
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy384
_destroy385:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy384
	cmpl   $0,    %ebx
	jne    _destroy385
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $620
	movl   $0,    %eax
	call   inheritexception
_destroy384:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy386
	addl   $1,    4(%ecx)
_destroy386:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy387
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy387:
	addl   $4,    %esp
	popl   -4(%ebp)
	jmp    _endif14
_else14:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 622: toString := "false"  |
	# |                                               |
	# \***********************************************/
	.section .rodata
.stringlit16:
	.string "false"
.text
	pushl  $Stringvtable
	pushl  $.stringlit16
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy388
_destroy389:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy388
	cmpl   $0,    %ebx
	jne    _destroy389
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $622
	movl   $0,    %eax
	call   inheritexception
_destroy388:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy390
	addl   $1,    4(%ecx)
_destroy390:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy391
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy391:
	addl   $4,    %esp
	popl   -4(%ebp)
_endif14:

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy392
	subl   $1,    4(%eax)
_destroy392:
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 626: eq(other: Oyd): boolean is  |
	# |                                                      |
	# \******************************************************/
.global Boolean_eq
	.type  Boolean_eq, @function
Boolean_eq:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 627: tmp: Boolean := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy393
_destroy394:
	movl   (%ebx), %ebx
	cmpl   $Booleanvtable, %ebx
	je     _destroy393
	cmpl   $0,    %ebx
	jne    _destroy394
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit10
	pushl  $.stringlit1
	pushl  $627
	movl   $0,    %eax
	call   inheritexception
_destroy393:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy395
	addl   $1,    4(%ecx)
_destroy395:
	popl   -8(%ebp)

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 629: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest90
	pushl  $.stringlit1
	pushl  $629
	movl   $0,    %eax
	call   nullexception
_nulltest90:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	pushl  %eax
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy396
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy396:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy397
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy397:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 640: class Vector is  |
	# |                                           |
	# \*******************************************/
	# ***     ***
	# ***     ***                  **
	# ****   ****                  **
	#  ***   ***   *****    *****  *****   ******   *****
	#  **** ****  *******  ******  *****  ********  *****
	#   *** ***   *******  ******  **     ********  *****
	#   *******   *******  ***     **     ***  ***  **
	#   *******   *******  ***     ***    ***  ***  **
	#    *****    ******   ******  ****** ********  **
	#    *****    ******   ******  ****** ********  **
	#     ***      *****    *****  ******  ******   **
.global Vectorinit
	.type  Vectorinit, @function
Vectorinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 641: data := new Oyd[4]  |
	# |                                              |
	# \**********************************************/
	movl   $4,    %eax
	pushl  %eax
	pushl  $1
	pushl  $Oydvtable
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy398
_destroy399:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy398
	cmpl   $0,    %ebx
	jne    _destroy399
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $641
	movl   $0,    %eax
	call   inheritexception
_destroy398:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy400
	addl   $1,    4(%ecx)
_destroy400:
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 642: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 643: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushl  $4
	movl   8(%ebp), %ecx
	popl   24(%ecx)
	leave
	ret

.global Vectordestroy
	.type  Vectordestroy, @function
Vectordestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy401
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy401
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy402
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy402:
	call   destroyobject
	addl   $4,    %esp
_destroy401:
	leave
	ret

.global Vectorname
	.type  Vectorname, @function
Vectorname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit11, %eax
	leave
	ret


	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 645: size(): int is  |
	# |                                          |
	# \******************************************/
.global Vector_size
	.type  Vector_size, @function
Vector_size:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 647: size := last  |
	# |                                        |
	# \****************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 650: getData(): Oyd[] is  |
	# |                                               |
	# \***********************************************/
.global Vector_getData
	.type  Vector_getData, @function
Vector_getData:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 652: getData := data  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy403
_destroy404:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy403
	cmpl   $0,    %ebx
	jne    _destroy404
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $652
	movl   $0,    %eax
	call   inheritexception
_destroy403:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy405
	addl   $1,    4(%ecx)
_destroy405:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy406
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy406:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy407
	subl   $1,    4(%eax)
_destroy407:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 655: resize(allocSize: int) is  |
	# |                                                     |
	# \*****************************************************/
.global Vector_resize
	.type  Vector_resize, @function
Vector_resize:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 656: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 657: tmp := new Oyd[allocSize]  |
	# |                                                     |
	# \*****************************************************/
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $Oydvtable
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy408
_destroy409:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy408
	cmpl   $0,    %ebx
	jne    _destroy409
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $657
	movl   $0,    %eax
	call   inheritexception
_destroy408:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy410
	addl   $1,    4(%ecx)
_destroy410:
	popl   -12(%ebp)

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 659: loop while not (idx >= last)  |
	# |                                                        |
	# \********************************************************/
_while11:
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody11
	jmp    _endwhile11
_whilebody11:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 660: tmp[idx] := data[idx]  |
	# |                                                 |
	# \*************************************************/
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	pushl  -12(%ebp)
	pushl  $.stringlit1
	pushl  $660
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $660
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy411
	addl   $1,    4(%ecx)
_destroy411:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy412
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy412:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 661: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while11
_endwhile11:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 664: data := tmp  |
	# |                                       |
	# \***************************************/
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy413
_destroy414:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy413
	cmpl   $0,    %ebx
	jne    _destroy414
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $664
	movl   $0,    %eax
	call   inheritexception
_destroy413:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy415
	addl   $1,    4(%ecx)
_destroy415:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy416
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy416:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# Garbage collection (locals)
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy417
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy417:
	addl   $4,    %esp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 667: push_back(x: Oyd): Vector is  |
	# |                                                        |
	# \********************************************************/
.global Vector_push_back
	.type  Vector_push_back, @function
Vector_push_back:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 669: if last >= alloc then  |
	# |                                                 |
	# \*************************************************/
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # alloc
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if15
	jmp    _else15
_if15:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 670: alloc := alloc * 2  |
	# |                                              |
	# \**********************************************/
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # alloc
	movl   $2,    %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   24(%ecx)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 671: resize(alloc)  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest91
	pushl  $.stringlit1
	pushl  $671
	movl   $0,    %eax
	call   nullexception
_nulltest91:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # resize()
	addl   $8,    %esp
	jmp    _endif15
_else15:
_endif15:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 673: data[last] := x  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $673
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  12(%ebp)           # x
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy418
	addl   $1,    4(%ecx)
_destroy418:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy419
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy419:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 674: last := last + 1  |
	# |                                            |
	# \********************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 675: push_back := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy420
_destroy421:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy420
	cmpl   $0,    %ebx
	jne    _destroy421
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $675
	movl   $0,    %eax
	call   inheritexception
_destroy420:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy422
	addl   $1,    4(%ecx)
_destroy422:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy423
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy423:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)
	pushl  12(%ebp)           # x
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy424
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy424:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy425
	subl   $1,    4(%eax)
_destroy425:
	leave
	ret


	# /*************************************************************************\
	# |                                                                         |
	# |  stdlib.floyd, line 678: init(newData: Oyd[]; newLast: int): Vector is  |
	# |                                                                         |
	# \*************************************************************************/
.global Vector_init
	.type  Vector_init, @function
Vector_init:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 679: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 681: loop while idx < newLast  |
	# |                                                    |
	# \****************************************************/
_while12:
	pushl  16(%ebp)           # newLast
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody12
	jmp    _endwhile12
_whilebody12:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 682: push_back(newData[idx])  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $682
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy426
_destroy427:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy426
	cmpl   $0,    %ebx
	jne    _destroy427
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $682
	movl   $0,    %eax
	call   inheritexception
_destroy426:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy428
	addl   $1,    4(%ecx)
_destroy428:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest92
	pushl  $.stringlit1
	pushl  $682
	movl   $0,    %eax
	call   nullexception
_nulltest92:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy429
	cmpl   $0,    4(%ebx)
	jg     _destroy429
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy429:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 683: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while12
_endwhile12:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 686: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy430
_destroy431:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy430
	cmpl   $0,    %ebx
	jne    _destroy431
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $686
	movl   $0,    %eax
	call   inheritexception
_destroy430:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy432
	addl   $1,    4(%ecx)
_destroy432:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy433
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy433:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy434
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy434:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy435
	subl   $1,    4(%eax)
_destroy435:
	leave
	ret


	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 689: reserve(allocSize: int): Vector is  |
	# |                                                              |
	# \**************************************************************/
.global Vector_reserve
	.type  Vector_reserve, @function
Vector_reserve:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 691: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 692: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushl  12(%ebp)           # allocSize
	movl   8(%ebp), %ecx
	popl   24(%ecx)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 693: data := new Oyd[alloc]  |
	# |                                                  |
	# \**************************************************/
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax
	pushl  $1
	pushl  $Oydvtable
	pushl  $Arrayvtable
	movl   $0,    %eax
	call   addarray
	addl   $16,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy436
_destroy437:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy436
	cmpl   $0,    %ebx
	jne    _destroy437
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $693
	movl   $0,    %eax
	call   inheritexception
_destroy436:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy438
	addl   $1,    4(%ecx)
_destroy438:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy439
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy439:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 695: reserve := me  |
	# |                                         |
	# \*****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy440
_destroy441:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy440
	cmpl   $0,    %ebx
	jne    _destroy441
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $695
	movl   $0,    %eax
	call   inheritexception
_destroy440:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy442
	addl   $1,    4(%ecx)
_destroy442:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy443
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy443:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy444
	subl   $1,    4(%eax)
_destroy444:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 698: copy(): Vector is  |
	# |                                             |
	# \*********************************************/
.global Vector_copy
	.type  Vector_copy, @function
Vector_copy:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 700: copy := new Vector.init(data, last)  |
	# |                                                               |
	# \***************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy445
_destroy446:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy445
	cmpl   $0,    %ebx
	jne    _destroy446
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $700
	movl   $0,    %eax
	call   inheritexception
_destroy445:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy447
	addl   $1,    4(%ecx)
_destroy447:

	# Pushing caller
	pushl  $3
	pushl  $Vectorvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Vectorinit

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest93
	pushl  $.stringlit1
	pushl  $700
	movl   $0,    %eax
	call   nullexception
_nulltest93:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # init()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy448
_destroy449:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy448
	cmpl   $0,    %ebx
	jne    _destroy449
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $700
	movl   $0,    %eax
	call   inheritexception
_destroy448:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy450
	addl   $1,    4(%ecx)
_destroy450:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy451
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy451:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy452
	subl   $1,    4(%eax)
_destroy452:
	leave
	ret


	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 703: at(idx: int): Oyd is  |
	# |                                                |
	# \************************************************/
.global Vector_at
	.type  Vector_at, @function
Vector_at:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 705: at := data[idx]  |
	# |                                           |
	# \*******************************************/
	movl   12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $705
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy453
_destroy454:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy453
	cmpl   $0,    %ebx
	jne    _destroy454
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $705
	movl   $0,    %eax
	call   inheritexception
_destroy453:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy455
	addl   $1,    4(%ecx)
_destroy455:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy456
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy456:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy457
	subl   $1,    4(%eax)
_destroy457:
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 708: insert(x: Vector): Vector is  |
	# |                                                        |
	# \********************************************************/
.global Vector_insert
	.type  Vector_insert, @function
Vector_insert:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 709: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 710: last := x.size()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest94
	pushl  $.stringlit1
	pushl  $710
	movl   $0,    %eax
	call   nullexception
_nulltest94:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 712: loop while idx < last  |
	# |                                                 |
	# \*************************************************/
_while13:
	pushl  -12(%ebp)          # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody13
	jmp    _endwhile13
_whilebody13:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 713: push_back(x.at(idx))  |
	# |                                                |
	# \************************************************/

	# Pushing parameters

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest95
	pushl  $.stringlit1
	pushl  $713
	movl   $0,    %eax
	call   nullexception
_nulltest95:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy458
_destroy459:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy458
	cmpl   $0,    %ebx
	jne    _destroy459
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $713
	movl   $0,    %eax
	call   inheritexception
_destroy458:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy460
	addl   $1,    4(%ecx)
_destroy460:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest96
	pushl  $.stringlit1
	pushl  $713
	movl   $0,    %eax
	call   nullexception
_nulltest96:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy461
	cmpl   $0,    4(%ebx)
	jg     _destroy461
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy461:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 714: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while13
_endwhile13:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 717: insert := me  |
	# |                                        |
	# \****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy462
_destroy463:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy462
	cmpl   $0,    %ebx
	jne    _destroy463
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $717
	movl   $0,    %eax
	call   inheritexception
_destroy462:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy464
	addl   $1,    4(%ecx)
_destroy464:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy465
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy465:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # x
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy466
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy466:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy467
	subl   $1,    4(%eax)
_destroy467:
	leave
	ret


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 720: partition(low: int; high: int): int is  |
	# |                                                                  |
	# \******************************************************************/
.global Vector_partition
	.type  Vector_partition, @function
Vector_partition:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $20,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 721: pivot := data[high]  |
	# |                                               |
	# \***********************************************/
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $721
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy468
_destroy469:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy468
	cmpl   $0,    %ebx
	jne    _destroy469
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $721
	movl   $0,    %eax
	call   inheritexception
_destroy468:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy470
	addl   $1,    4(%ecx)
_destroy470:
	popl   -8(%ebp)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 722: i := low - 1  |
	# |                                        |
	# \****************************************/
	pushl  12(%ebp)           # low
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 723: j := low  |
	# |                                    |
	# \************************************/
	pushl  12(%ebp)           # low
	popl   -16(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 724: tmp: Oyd  |
	# |                                    |
	# \************************************/
	movl   $0,    -20(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 726: loop while not (j > high - 1)  |
	# |                                                         |
	# \*********************************************************/
_while14:
	pushl  16(%ebp)           # high
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -16(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody14
	jmp    _endwhile14
_whilebody14:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 727: if not (data[j] > pivot) then  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # pivot
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy471
_destroy472:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy471
	cmpl   $0,    %ebx
	jne    _destroy472
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $727
	movl   $0,    %eax
	call   inheritexception
_destroy471:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy473
	addl   $1,    4(%ecx)
_destroy473:

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $727
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest97
	pushl  $.stringlit1
	pushl  $727
	movl   $0,    %eax
	call   nullexception
_nulltest97:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   40(%eax), %ebx
	call   *%ebx              # _gt_()
	addl   $8,    %esp
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if16
	jmp    _else16
_if16:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 728: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 729: tmp := data[i]  |
	# |                                          |
	# \******************************************/
	movl   -12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $729
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy474
_destroy475:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy474
	cmpl   $0,    %ebx
	jne    _destroy475
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $729
	movl   $0,    %eax
	call   inheritexception
_destroy474:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy476
	addl   $1,    4(%ecx)
_destroy476:
	pushl  -20(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy477
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy477:
	addl   $4,    %esp
	popl   -20(%ebp)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 730: data[i] := data[j]  |
	# |                                              |
	# \**********************************************/
	movl   -12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $730
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $730
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy478
	addl   $1,    4(%ecx)
_destroy478:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy479
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy479:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 731: data[j] := tmp  |
	# |                                          |
	# \******************************************/
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy480
	addl   $1,    4(%ecx)
_destroy480:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy481
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy481:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)
	jmp    _endif16
_else16:
_endif16:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 733: j := j + 1  |
	# |                                      |
	# \**************************************/
	pushl  -16(%ebp)          # j
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _while14
_endwhile14:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 736: tmp := data[i + 1]  |
	# |                                              |
	# \**********************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $736
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy482
_destroy483:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy482
	cmpl   $0,    %ebx
	jne    _destroy483
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $736
	movl   $0,    %eax
	call   inheritexception
_destroy482:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy484
	addl   $1,    4(%ecx)
_destroy484:
	pushl  -20(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy485
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy485:
	addl   $4,    %esp
	popl   -20(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 737: data[i + 1] := data[high]  |
	# |                                                     |
	# \*****************************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $737
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $737
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy486
	addl   $1,    4(%ecx)
_destroy486:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy487
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy487:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 738: data[high] := tmp  |
	# |                                             |
	# \*********************************************/
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $738
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy488
	addl   $1,    4(%ecx)
_destroy488:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy489
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy489:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 740: partition := i + 1  |
	# |                                              |
	# \**********************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # pivot
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy490
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy490:
	addl   $4,    %esp
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy491
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy491:
	addl   $4,    %esp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 743: quicksort(low: int; high: int): Vector is  |
	# |                                                                     |
	# \*********************************************************************/
.global Vector_quicksort
	.type  Vector_quicksort, @function
Vector_quicksort:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 744: pivot: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 746: if not (low >= high) then  |
	# |                                                     |
	# \*****************************************************/
	pushl  16(%ebp)           # high
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if17
	jmp    _else17
_if17:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 747: pivot := partition(low, high)  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	movl   16(%ebp), %eax
	pushl  %eax
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest98
	pushl  $.stringlit1
	pushl  $747
	movl   $0,    %eax
	call   nullexception
_nulltest98:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # partition()
	addl   $12,   %esp
	movl   %eax,  -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 748: quicksort(low, pivot - 1)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # pivot
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest99
	pushl  $.stringlit1
	pushl  $748
	movl   $0,    %eax
	call   nullexception
_nulltest99:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy492
	cmpl   $0,    4(%ebx)
	jg     _destroy492
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy492:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 749: quicksort(pivot + 1, high)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  -8(%ebp)           # pivot
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest100
	pushl  $.stringlit1
	pushl  $749
	movl   $0,    %eax
	call   nullexception
_nulltest100:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy493
	cmpl   $0,    4(%ebx)
	jg     _destroy493
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy493:
	jmp    _endif17
_else17:
_endif17:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 752: quicksort := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy494
_destroy495:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy494
	cmpl   $0,    %ebx
	jne    _destroy495
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $752
	movl   $0,    %eax
	call   inheritexception
_destroy494:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy496
	addl   $1,    4(%ecx)
_destroy496:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy497
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy497:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy498
	subl   $1,    4(%eax)
_destroy498:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 755: sort(): Vector is  |
	# |                                             |
	# \*********************************************/
.global Vector_sort
	.type  Vector_sort, @function
Vector_sort:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 757: sort := quicksort(0, last - 1)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   $0,    %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest101
	pushl  $.stringlit1
	pushl  $757
	movl   $0,    %eax
	call   nullexception
_nulltest101:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy499
_destroy500:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy499
	cmpl   $0,    %ebx
	jne    _destroy500
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $757
	movl   $0,    %eax
	call   inheritexception
_destroy499:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy501
	addl   $1,    4(%ecx)
_destroy501:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy502
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy502:
	addl   $4,    %esp
	popl   -4(%ebp)

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy503
	subl   $1,    4(%eax)
_destroy503:
	leave
	ret


	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 767: class Map is  |
	# |                                        |
	# \****************************************/
	#  ****     ****
	#  ****     ****
	#  *****   *****
	#  *****   *****   ******  ******
	#  ****** ******   ******  *******
	#  ****** ******   ******  *******
	#  *************  *******  **  ***
	#  *** ***** ***  *******  **  ***
	#  *** ***** ***  *******  *******
	#  ***  ***  ***  *******  *******
	#  ***       ***  *******  ******
	#                          **
	#                          **
	#                          **
.global Mapdestroy
	.type  Mapdestroy, @function
Mapdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy504
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy504
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy505
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy505:
	movl   8(%ebp), %ebx
	movl   20(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy506
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy506:
	movl   8(%ebp), %ebx
	movl   24(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy507
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy507:
	movl   8(%ebp), %ebx
	movl   28(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy508
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy508:
	call   destroyobject
	addl   $4,    %esp
_destroy504:
	leave
	ret

.global Mapname
	.type  Mapname, @function
Mapname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit12, %eax
	leave
	ret


	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 773: insert(newKey: Oyd; newValue: Oyd) is  |
	# |                                                                 |
	# \*****************************************************************/
.global Map_insert
	.type  Map_insert, @function
Map_insert:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 775: if newKey = null then  |
	# |                                                 |
	# \*************************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if18
	jmp    _else18
_if18:
	jmp    _endif18
_else18:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 777: if _key = null then  |
	# |                                               |
	# \***********************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if19
	jmp    _else19
_if19:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 778: _key := newKey  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy509
_destroy510:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy509
	cmpl   $0,    %ebx
	jne    _destroy510
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $778
	movl   $0,    %eax
	call   inheritexception
_destroy509:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy511
	addl   $1,    4(%ecx)
_destroy511:
	movl   8(%ebp), %ecx
	pushl  24(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy512
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy512:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   24(%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 779: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy513
_destroy514:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy513
	cmpl   $0,    %ebx
	jne    _destroy514
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $779
	movl   $0,    %eax
	call   inheritexception
_destroy513:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy515
	addl   $1,    4(%ecx)
_destroy515:
	movl   8(%ebp), %ecx
	pushl  28(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy516
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy516:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   28(%ecx)
	jmp    _endif19
_else19:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 781: if newKey < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy517
_destroy518:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy517
	cmpl   $0,    %ebx
	jne    _destroy518
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $781
	movl   $0,    %eax
	call   inheritexception
_destroy517:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy519
	addl   $1,    4(%ecx)
_destroy519:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest102
	pushl  $.stringlit1
	pushl  $781
	movl   $0,    %eax
	call   nullexception
_nulltest102:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   28(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if20
	jmp    _else20
_if20:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 782: if _left = null then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if21
	jmp    _else21
_if21:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 783: _left := new Map  |
	# |                                            |
	# \********************************************/
	pushl  $4
	pushl  $Mapvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy520
_destroy521:
	movl   (%ebx), %ebx
	cmpl   $Mapvtable, %ebx
	je     _destroy520
	cmpl   $0,    %ebx
	jne    _destroy521
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit12
	pushl  $.stringlit1
	pushl  $783
	movl   $0,    %eax
	call   inheritexception
_destroy520:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy522
	addl   $1,    4(%ecx)
_destroy522:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy523
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy523:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)
	jmp    _endif21
_else21:
_endif21:

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 785: _left.insert(newKey, newValue)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy524
_destroy525:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy524
	cmpl   $0,    %ebx
	jne    _destroy525
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $785
	movl   $0,    %eax
	call   inheritexception
_destroy524:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy526
	addl   $1,    4(%ecx)
_destroy526:
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy527
_destroy528:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy527
	cmpl   $0,    %ebx
	jne    _destroy528
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $785
	movl   $0,    %eax
	call   inheritexception
_destroy527:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy529
	addl   $1,    4(%ecx)
_destroy529:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest103
	pushl  $.stringlit1
	pushl  $785
	movl   $0,    %eax
	call   nullexception
_nulltest103:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # insert()
	addl   $12,   %esp
	jmp    _endif20
_else20:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 787: if newKey > _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy530
_destroy531:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy530
	cmpl   $0,    %ebx
	jne    _destroy531
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $787
	movl   $0,    %eax
	call   inheritexception
_destroy530:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy532
	addl   $1,    4(%ecx)
_destroy532:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest104
	pushl  $.stringlit1
	pushl  $787
	movl   $0,    %eax
	call   nullexception
_nulltest104:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   40(%eax), %ebx
	call   *%ebx              # _gt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if22
	jmp    _else22
_if22:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 788: if _right = null then  |
	# |                                                 |
	# \*************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if23
	jmp    _else23
_if23:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 789: _right := new Map  |
	# |                                             |
	# \*********************************************/
	pushl  $4
	pushl  $Mapvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy533
_destroy534:
	movl   (%ebx), %ebx
	cmpl   $Mapvtable, %ebx
	je     _destroy533
	cmpl   $0,    %ebx
	jne    _destroy534
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit12
	pushl  $.stringlit1
	pushl  $789
	movl   $0,    %eax
	call   inheritexception
_destroy533:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy535
	addl   $1,    4(%ecx)
_destroy535:
	movl   8(%ebp), %ecx
	pushl  20(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy536
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy536:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   20(%ecx)
	jmp    _endif23
_else23:
_endif23:

	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 791: _right.insert(newKey, newValue)  |
	# |                                                           |
	# \***********************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy537
_destroy538:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy537
	cmpl   $0,    %ebx
	jne    _destroy538
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $791
	movl   $0,    %eax
	call   inheritexception
_destroy537:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy539
	addl   $1,    4(%ecx)
_destroy539:
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy540
_destroy541:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy540
	cmpl   $0,    %ebx
	jne    _destroy541
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $791
	movl   $0,    %eax
	call   inheritexception
_destroy540:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy542
	addl   $1,    4(%ecx)
_destroy542:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest105
	pushl  $.stringlit1
	pushl  $791
	movl   $0,    %eax
	call   nullexception
_nulltest105:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   76(%eax), %ebx
	call   *%ebx              # insert()
	addl   $12,   %esp
	jmp    _endif22
_else22:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 793: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy543
_destroy544:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy543
	cmpl   $0,    %ebx
	jne    _destroy544
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $793
	movl   $0,    %eax
	call   inheritexception
_destroy543:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy545
	addl   $1,    4(%ecx)
_destroy545:
	movl   8(%ebp), %ecx
	pushl  28(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy546
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy546:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   28(%ecx)
_endif22:
_endif20:
_endif19:
_endif18:

	# Garbage collection (args)
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy547
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy547:
	addl   $4,    %esp
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy548
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy548:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 800: get(target: Oyd): Oyd is  |
	# |                                                    |
	# \****************************************************/
.global Map_get
	.type  Map_get, @function
Map_get:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 802: if _key = null or target = null then  |
	# |                                                                |
	# \****************************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	cmpl   $0,    %eax
	jne    _if24
	jmp    _else24
_if24:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 803: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy549
_destroy550:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy549
	cmpl   $0,    %ebx
	jne    _destroy550
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $803
	movl   $0,    %eax
	call   inheritexception
_destroy549:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy551
	addl   $1,    4(%ecx)
_destroy551:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy552
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy552:
	addl   $4,    %esp
	popl   -4(%ebp)
	jmp    _endif24
_else24:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 805: if _key.eq(target) then  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy553
_destroy554:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy553
	cmpl   $0,    %ebx
	jne    _destroy554
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $805
	movl   $0,    %eax
	call   inheritexception
_destroy553:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy555
	addl   $1,    4(%ecx)
_destroy555:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest106
	pushl  $.stringlit1
	pushl  $805
	movl   $0,    %eax
	call   nullexception
_nulltest106:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   20(%eax), %ebx
	call   *%ebx              # eq()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if25
	jmp    _else25
_if25:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 806: get := _value  |
	# |                                         |
	# \*****************************************/
	movl   8(%ebp), %ebx
	pushl  28(%ebx)           # _value
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy556
_destroy557:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy556
	cmpl   $0,    %ebx
	jne    _destroy557
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $806
	movl   $0,    %eax
	call   inheritexception
_destroy556:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy558
	addl   $1,    4(%ecx)
_destroy558:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy559
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy559:
	addl   $4,    %esp
	popl   -4(%ebp)
	jmp    _endif25
_else25:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 808: if target < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy560
_destroy561:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy560
	cmpl   $0,    %ebx
	jne    _destroy561
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $808
	movl   $0,    %eax
	call   inheritexception
_destroy560:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy562
	addl   $1,    4(%ecx)
_destroy562:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest107
	pushl  $.stringlit1
	pushl  $808
	movl   $0,    %eax
	call   nullexception
_nulltest107:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   28(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if26
	jmp    _else26
_if26:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 809: if _left = null then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if27
	jmp    _else27
_if27:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 810: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy563
_destroy564:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy563
	cmpl   $0,    %ebx
	jne    _destroy564
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $810
	movl   $0,    %eax
	call   inheritexception
_destroy563:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy565
	addl   $1,    4(%ecx)
_destroy565:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy566
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy566:
	addl   $4,    %esp
	popl   -4(%ebp)
	jmp    _endif27
_else27:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 812: get := _left.get(target)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy567
_destroy568:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy567
	cmpl   $0,    %ebx
	jne    _destroy568
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $812
	movl   $0,    %eax
	call   inheritexception
_destroy567:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy569
	addl   $1,    4(%ecx)
_destroy569:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest108
	pushl  $.stringlit1
	pushl  $812
	movl   $0,    %eax
	call   nullexception
_nulltest108:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # get()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy570
_destroy571:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy570
	cmpl   $0,    %ebx
	jne    _destroy571
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $812
	movl   $0,    %eax
	call   inheritexception
_destroy570:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy572
	addl   $1,    4(%ecx)
_destroy572:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy573
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy573:
	addl   $4,    %esp
	popl   -4(%ebp)
_endif27:
	jmp    _endif26
_else26:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 815: if _right = null then  |
	# |                                                 |
	# \*************************************************/
	pushl  $0
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if28
	jmp    _else28
_if28:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 816: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy574
_destroy575:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy574
	cmpl   $0,    %ebx
	jne    _destroy575
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $816
	movl   $0,    %eax
	call   inheritexception
_destroy574:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy576
	addl   $1,    4(%ecx)
_destroy576:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy577
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy577:
	addl   $4,    %esp
	popl   -4(%ebp)
	jmp    _endif28
_else28:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 818: get := _right.get(target)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy578
_destroy579:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy578
	cmpl   $0,    %ebx
	jne    _destroy579
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $818
	movl   $0,    %eax
	call   inheritexception
_destroy578:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy580
	addl   $1,    4(%ecx)
_destroy580:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest109
	pushl  $.stringlit1
	pushl  $818
	movl   $0,    %eax
	call   nullexception
_nulltest109:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # get()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy581
_destroy582:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy581
	cmpl   $0,    %ebx
	jne    _destroy582
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit9
	pushl  $.stringlit1
	pushl  $818
	movl   $0,    %eax
	call   inheritexception
_destroy581:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy583
	addl   $1,    4(%ecx)
_destroy583:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy584
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy584:
	addl   $4,    %esp
	popl   -4(%ebp)
_endif28:
_endif26:
_endif25:
_endif24:

	# Garbage collection (args)
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy585
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy585:
	addl   $4,    %esp

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy586
	subl   $1,    4(%eax)
_destroy586:
	leave
	ret


	# /*****************************************************************\
	# |                                                                 |
	# |  ../tests/phase4/basic/assign1.floyd, line 4: class Assign1 is  |
	# |                                                                 |
	# \*****************************************************************/
	#    ****                    ****                     ***
	#    *****                   ****                   *****
	#    *****                                          *****
	#   *******   ******  ******  **   ******  *******  *****
	#   *** ***   ******  ******  **  *******  *******     **
	#  **** ****  ******  ******  **  *******  *******     **
	#  **** ****  ******  ******  **  ***  **  **  ***     **
	#  *********  ******  ******  **  ***  **  **   **     **
	# *********** ******  ******  **  *******  **   **     **
	# ***     ********** *******  **  *******  **   **     **
	# ***     ********** *******  **   ******  **   **     **
	#                                 *******
	#                                 *******
	#                                 *******
.global Assign1destroy
	.type  Assign1destroy, @function
Assign1destroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy587
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy587
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy587:
	leave
	ret

.global Assign1name
	.type  Assign1name, @function
Assign1name:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit8, %eax
	leave
	ret


	# /************************************************************\
	# |                                                            |
	# |  ../tests/phase4/basic/assign1.floyd, line 12: start() is  |
	# |                                                            |
	# \************************************************************/
.global Assign1_start
	.type  Assign1_start, @function
Assign1_start:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  ../tests/phase4/basic/assign1.floyd, line 14: x := 5  |
	# |                                                        |
	# \********************************************************/
	pushl  $5
	movl   8(%ebp), %ecx
	popl   16(%ecx)

	# /******************************************************************\
	# |                                                                  |
	# |  ../tests/phase4/basic/assign1.floyd, line 15: y := x * (8 - x)  |
	# |                                                                  |
	# \******************************************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # x
	pushl  $8
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /************************************************************\
	# |                                                            |
	# |  ../tests/phase4/basic/assign1.floyd, line 17: b1 := true  |
	# |                                                            |
	# \************************************************************/
	pushl  $1
	movl   8(%ebp), %ecx
	popl   28(%ecx)

	# /*****************************************************************\
	# |                                                                 |
	# |  ../tests/phase4/basic/assign1.floyd, line 18: b2 := not false  |
	# |                                                                 |
	# \*****************************************************************/
	movl   $0,    %eax
	xorl   $1,    %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   32(%ecx)

	# /**************************************************************************\
	# |                                                                          |
	# |  ../tests/phase4/basic/assign1.floyd, line 19: b2 := not (not b2 or b1)  |
	# |                                                                          |
	# \**************************************************************************/
	movl   8(%ebp), %ebx
	movl   32(%ebx), %eax
	xorl   $1,    %eax
	pushl  %eax
	movl   8(%ebp), %ebx
	movl   28(%ebx), %ebx
	popl   %eax
	orl    %ebx,  %eax
	xorl   $1,    %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   32(%ecx)

	# /***********************************************************************************\
	# |                                                                                   |
	# |  ../tests/phase4/basic/assign1.floyd, line 21: out.writeint(y)              ~ 15  |
	# |                                                                                   |
	# \***********************************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Pushing caller
	movl   _out,  %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest110
	pushl  $.stringlit2
	pushl  $21
	movl   $0,    %eax
	call   nullexception
_nulltest110:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeint()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy588
	cmpl   $0,    4(%ebx)
	jg     _destroy588
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy588:

	# /**********************************************************************************\
	# |                                                                                  |
	# |  ../tests/phase4/basic/assign1.floyd, line 22: out.writeint(x / 2)          ~ 2  |
	# |                                                                                  |
	# \**********************************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # x
	movl   $2,    %ebx
	movl   $0,    %edx
	idivl  %ebx

	# Pushing caller
	movl   _out,  %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest111
	pushl  $.stringlit2
	pushl  $22
	movl   $0,    %eax
	call   nullexception
_nulltest111:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeint()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy589
	cmpl   $0,    4(%ebx)
	jg     _destroy589
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy589:

	# /************************************************************\
	# |                                                            |
	# |  ../tests/phase4/basic/assign1.floyd, line 24: y := y - x  |
	# |                                                            |
	# \************************************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # y
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   20(%ecx)

	# /***********************************************************************************\
	# |                                                                                   |
	# |  ../tests/phase4/basic/assign1.floyd, line 25: out.writeint(y + 4)          ~ 14  |
	# |                                                                                   |
	# \***********************************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # y
	movl   $4,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   _out,  %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest112
	pushl  $.stringlit2
	pushl  $25
	movl   $0,    %eax
	call   nullexception
_nulltest112:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeint()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy590
	cmpl   $0,    4(%ebx)
	jg     _destroy590
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy590:

	# /***********************************************************************************\
	# |                                                                                   |
	# |  ../tests/phase4/basic/assign1.floyd, line 26: out.writeint(-(9 - 5))       ~ -4  |
	# |                                                                                   |
	# \***********************************************************************************/

	# Pushing parameters
	pushl  $9
	movl   $5,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	negl   %eax
	pushl  %eax

	# Pushing caller
	movl   _out,  %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest113
	pushl  $.stringlit2
	pushl  $26
	movl   $0,    %eax
	call   nullexception
_nulltest113:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeint()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy591
	cmpl   $0,    4(%ebx)
	jg     _destroy591
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy591:

	# /**********************************************************************************\
	# |                                                                                  |
	# |  ../tests/phase4/basic/assign1.floyd, line 27: out.writeint(5 - 2 * 3 + 1)  ~ 0  |
	# |                                                                                  |
	# \**********************************************************************************/

	# Pushing parameters
	pushl  $5
	pushl  $2
	movl   $3,    %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   _out,  %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest114
	pushl  $.stringlit2
	pushl  $27
	movl   $0,    %eax
	call   nullexception
_nulltest114:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeint()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy592
	cmpl   $0,    4(%ebx)
	jg     _destroy592
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy592:

	# Garbage collection (caller)
	pushl  8(%ebp)
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp

	# Method close
	movl   -4(%ebp), %eax
	leave
	ret

.global main
	.type  main,  @function
main:
	pushl  %ebp
	movl   %esp,  %ebp
	pushl  $0
	pushl  $Readervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	movl   %eax,  _in         # Initialize in (Reader)
	movl   (_in), %ecx        # Add reference
	addl   $1,    4(%ecx)
	pushl  $0
	pushl  $Writervtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	movl   %eax,  _out        # Initialize out (Writer)
	movl   (_out), %ecx       # Add reference
	addl   $1,    4(%ecx)
	pushl  $5
	pushl  $Assign1vtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)
	call   Assign1_start
	pushl  _in
	call   Readerdestroy
	pushl  _out
	call   Writerdestroy
	addl   $12,   %esp
	call   stats
	leave
	ret

.global calldestroy
	.type  calldestroy, @function
calldestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %eax
	pushl  %eax
	movl   %eax,  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	leave
	ret

	.weak  IntVectorvtable
	.section .gnu.linkonce.r.IntVectorvtable,"a",@progbits
	.align 8
	.type  IntVectorvtable, @object
	.size  IntVectorvtable, 120
IntVectorvtable:
	.long  Oydvtable
	.long  IntVectordestroy
	.long  IntVectorname
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  IntVector_size
	.long  IntVector_getData
	.long  IntVector_resize
	.long  IntVector_push_back
	.long  IntVector_init
	.long  IntVector_reserve
	.long  IntVector_copy
	.long  IntVector_at
	.long  IntVector_insert
	.long  IntVector_partition
	.long  IntVector_quicksort
	.long  IntVector_sort

	.weak  Readervtable
	.section .gnu.linkonce.r.Readervtable,"a",@progbits
	.align 8
	.type  Readervtable, @object
	.size  Readervtable, 92
Readervtable:
	.long  Oydvtable
	.long  Readerdestroy
	.long  Readername
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Reader_io_read
	.long  Reader_skipWS
	.long  Reader_readline
	.long  Reader_read
	.long  Reader_readint

	.weak  Stringvtable
	.section .gnu.linkonce.r.Stringvtable,"a",@progbits
	.align 8
	.type  Stringvtable, @object
	.size  Stringvtable, 124
Stringvtable:
	.long  Oydvtable
	.long  Stringdestroy
	.long  Stringname
	.long  String_toString
	.long  Oyd_val
	.long  String_eq
	.long  Oyd_neq
	.long  String__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  String__cat_
	.long  Oyd__idx_
	.long  String_size
	.long  String_length
	.long  String_getData
	.long  String_init
	.long  String_appendChar
	.long  String_catIntHelper
	.long  String_copy
	.long  String_cat
	.long  String_catChar
	.long  String_catInt
	.long  String_charAt
	.long  String_gt
	.long  String_gteq

	.weak  Arrayvtable
	.section .gnu.linkonce.r.Arrayvtable,"a",@progbits
	.align 8
	.type  Arrayvtable, @object
	.size  Arrayvtable, 72
Arrayvtable:
	.long  Oydvtable
	.long  Arraydestroy
	.long  Arrayname
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_

	.weak  Integervtable
	.section .gnu.linkonce.r.Integervtable,"a",@progbits
	.align 8
	.type  Integervtable, @object
	.size  Integervtable, 80
Integervtable:
	.long  Oydvtable
	.long  Integerdestroy
	.long  Integername
	.long  Integer_toString
	.long  Oyd_val
	.long  Integer_eq
	.long  Oyd_neq
	.long  Integer__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Integer__and_
	.long  Integer__or_
	.long  Integer__add_
	.long  Integer__sub_
	.long  Integer__mul_
	.long  Integer__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Integer_init
	.long  Integer_val

	.weak  Assign1vtable
	.section .gnu.linkonce.r.Assign1vtable,"a",@progbits
	.align 8
	.type  Assign1vtable, @object
	.size  Assign1vtable, 76
Assign1vtable:
	.long  Oydvtable
	.long  Assign1destroy
	.long  Assign1name
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Assign1_start

	.weak  Oydvtable
	.section .gnu.linkonce.r.Oydvtable,"a",@progbits
	.align 8
	.type  Oydvtable, @object
	.size  Oydvtable, 72
Oydvtable:
	.long  0
	.long  Oyddestroy
	.long  Oydname
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_

	.weak  Booleanvtable
	.section .gnu.linkonce.r.Booleanvtable,"a",@progbits
	.align 8
	.type  Booleanvtable, @object
	.size  Booleanvtable, 80
Booleanvtable:
	.long  Oydvtable
	.long  Booleandestroy
	.long  Booleanname
	.long  Boolean_toString
	.long  Oyd_val
	.long  Boolean_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Boolean_init
	.long  Boolean_val

	.weak  Vectorvtable
	.section .gnu.linkonce.r.Vectorvtable,"a",@progbits
	.align 8
	.type  Vectorvtable, @object
	.size  Vectorvtable, 120
Vectorvtable:
	.long  Oydvtable
	.long  Vectordestroy
	.long  Vectorname
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Vector_size
	.long  Vector_getData
	.long  Vector_resize
	.long  Vector_push_back
	.long  Vector_init
	.long  Vector_reserve
	.long  Vector_copy
	.long  Vector_at
	.long  Vector_insert
	.long  Vector_partition
	.long  Vector_quicksort
	.long  Vector_sort

	.weak  Mapvtable
	.section .gnu.linkonce.r.Mapvtable,"a",@progbits
	.align 8
	.type  Mapvtable, @object
	.size  Mapvtable, 80
Mapvtable:
	.long  Oydvtable
	.long  Mapdestroy
	.long  Mapname
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Map_insert
	.long  Map_get

	.weak  Writervtable
	.section .gnu.linkonce.r.Writervtable,"a",@progbits
	.align 8
	.type  Writervtable, @object
	.size  Writervtable, 100
Writervtable:
	.long  Oydvtable
	.long  Writerdestroy
	.long  Writername
	.long  Oyd_toString
	.long  Oyd_val
	.long  Oyd_eq
	.long  Oyd_neq
	.long  Oyd__lt_
	.long  Oyd__lteq_
	.long  Oyd__gteq_
	.long  Oyd__gt_
	.long  Oyd__and_
	.long  Oyd__or_
	.long  Oyd__add_
	.long  Oyd__sub_
	.long  Oyd__mul_
	.long  Oyd__div_
	.long  Oyd__cat_
	.long  Oyd__idx_
	.long  Writer_io_write
	.long  Writer_writechar
	.long  Writer_writeintHelper
	.long  Writer_writeint
	.long  Writer_write
	.long  Writer_writeln
	.long  Writer_writeObject

