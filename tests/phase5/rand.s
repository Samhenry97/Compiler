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
	.string "..\tests\phase5\rand.floyd"
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
	.string "Vehicle"
.stringlit9:
	.string "Mapper"
.stringlit10:
	.string "Car"
.stringlit11:
	.string "Oyd"
.stringlit12:
	.string "Boolean"
.stringlit13:
	.string "Vector"
.stringlit14:
	.string "Map"
.stringlit15:
	.string "Main"
.stringlit16:
	.string "Writer"

.text

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 6: class Oyd is  |
	# |                                      |
	# \**************************************/
	#    ******                   **
	#   ********                  **
	#  **********                 **
	#  ***    *******   **** *******
	#  ***    *** ***   *** ********
	#  **      ** ***   *** ********
	#  **      **  *** ***  ***  ***
	#  ***    ***  *** ***  **    **
	#  ***    ***  *******  ***  ***
	#  **********   *****   ********
	#   ********    *****   ********
	#    ******      ***     *******
	#              *****
	#              *****
	#              ****
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
	movl   $.stringlit11, %eax
	leave
	ret

.global Oyd_type
	.type  Oyd_type, @function
Oyd_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
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
.stringlit17:
	.string "none"
.text
	pushl  $Stringvtable
	pushl  $.stringlit17
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
	popl   -4(%ebp)           # toString

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # val

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
	pushl  $.stringlit11
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
	movl   24(%eax), %ebx
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
	pushl  $.stringlit11
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
	movl   32(%eax), %ebx
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
	pushl  $.stringlit11
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
	movl   24(%eax), %ebx
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
	pushl  $.stringlit11
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
	movl   32(%eax), %ebx
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
	pushl  $.stringlit11
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
	movl   36(%eax), %ebx
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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _add_

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _sub_

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _mul_

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _div_

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _cat_

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
	pushl  $.stringlit11
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
	popl   -4(%ebp)           # _idx_

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
	#    *****
	#    *****
	#    *****
	#   *******   ***** *****  **********   ***
	#   *** ***   ***** ***** ******* ***   ***
	#   *** ***   ***** ***** *** *** ***   ***
	#  ***   ***  ***   ***    ******  *** ***
	#  *********  ***   ***   *******  *** ***
	#  *********  **    **    *******  *******
	# ***     *** **    **    *******   *****
	# ***     *** **    **    ********  *****
	# ***     *** **    **    ********   ***
	#                                  *****
	#                                  *****
	#                                  ****
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

.global Array_type
	.type  Array_type, @function
Array_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 107: class IntVector is  |
	# |                                              |
	# \**********************************************/
	#  **            **  ***     ****                  **
	#  **            **  ***     ***                   **
	#  **            **  ***     ***                   **
	#  **  ******** ***** ***   ***   *****    ****** *****  ******   *****
	#  **  ******** ***** ***   ***  *******  ******* ***** ********  *****
	#  **  ********  **   **** ****  *** ***  *******  **   ********  *****
	#  **  ***  ***  **    *** ***   *******  ***      **   ***  ***  ***
	#  **  **    **  **    *** ***   *******  **       **   **    **  ***
	#  **  **    **  **     *****    ***      ***      **   ***  ***  **
	#  **  **    **  ****   *****    *******  *******  **** ********  **
	#  **  **    **  ****   *****    *******  *******  **** ********  **
	#  **  **    **  ****    ***      *****    *****   ****  ******   **
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
	popl   16(%ecx)           # data

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 109: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)           # last

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 110: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushl  $4
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # alloc
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

.global IntVector_type
	.type  IntVector_type, @function
IntVector_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
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
	popl   -4(%ebp)           # size

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
	popl   -4(%ebp)           # getData

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
	popl   -12(%ebp)          # tmp

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
	popl   16(%ecx)           # data

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
	popl   -4(%ebp)           # resize

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
	popl   24(%ecx)           # alloc

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
	movl   88(%eax), %ebx
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
	popl   20(%ecx)           # last

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
	popl   -4(%ebp)           # push_back

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
	movl   92(%eax), %ebx
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
	popl   -4(%ebp)           # init

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
	popl   20(%ecx)           # last

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 161: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushl  12(%ebp)           # allocSize
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # alloc

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
	popl   16(%ecx)           # data

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
	popl   -4(%ebp)           # reserve

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
	movl   96(%eax), %ebx
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
	popl   -4(%ebp)           # copy

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
	movl   80(%eax), %ebx
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
	movl   108(%eax), %ebx
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
	movl   92(%eax), %ebx
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
	popl   -4(%ebp)           # insert

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
	popl   -16(%ebp)          # j

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
	movl   116(%eax), %ebx
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
	movl   120(%eax), %ebx
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
	movl   120(%eax), %ebx
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
	popl   -4(%ebp)           # quicksort

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
	movl   120(%eax), %ebx
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
	popl   -4(%ebp)           # sort

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
	# |  stdlib.floyd, line 237: class Vector is  |
	# |                                           |
	# \*******************************************/
	# ***     ****                  **
	# ***     ***                   **
	# ***     ***                   **
	#  ***   ***   *****    ****** *****  ******   *****
	#  ***   ***  *******  ******* ***** ********  *****
	#  **** ****  *** ***  *******  **   ********  *****
	#   *** ***   *******  ***      **   ***  ***  ***
	#   *** ***   *******  **       **   **    **  ***
	#    *****    ***      ***      **   ***  ***  **
	#    *****    *******  *******  **** ********  **
	#    *****    *******  *******  **** ********  **
	#     ***      *****    *****   ****  ******   **
.global Vectorinit
	.type  Vectorinit, @function
Vectorinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 238: data := new Oyd[4]  |
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
	je     _destroy131
_destroy132:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy131
	cmpl   $0,    %ebx
	jne    _destroy132
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $238
	movl   $0,    %eax
	call   inheritexception
_destroy131:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy133
	addl   $1,    4(%ecx)
_destroy133:
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # data

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 239: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)           # last

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 240: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushl  $4
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # alloc
	leave
	ret

.global Vectordestroy
	.type  Vectordestroy, @function
Vectordestroy:
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

.global Vectorname
	.type  Vectorname, @function
Vectorname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit13, %eax
	leave
	ret

.global Vector_type
	.type  Vector_type, @function
Vector_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 242: size(): int is  |
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
	# |  stdlib.floyd, line 244: size := last  |
	# |                                        |
	# \****************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	popl   -4(%ebp)           # size

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
	# |  stdlib.floyd, line 247: getData(): Oyd[] is  |
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
	# |  stdlib.floyd, line 249: getData := data  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy136
_destroy137:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy136
	cmpl   $0,    %ebx
	jne    _destroy137
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $249
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
	popl   -4(%ebp)           # getData

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


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 252: resize(allocSize: int) is  |
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
	# |  stdlib.floyd, line 253: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 254: tmp := new Oyd[allocSize]  |
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
	je     _destroy141
_destroy142:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy141
	cmpl   $0,    %ebx
	jne    _destroy142
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $254
	movl   $0,    %eax
	call   inheritexception
_destroy141:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy143
	addl   $1,    4(%ecx)
_destroy143:
	popl   -12(%ebp)          # tmp

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 256: loop while not (idx >= last)  |
	# |                                                        |
	# \********************************************************/
_while4:
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody4
	jmp    _endwhile4
_whilebody4:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 257: tmp[idx] := data[idx]  |
	# |                                                 |
	# \*************************************************/
	movl   -8(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	pushl  -12(%ebp)
	pushl  $.stringlit1
	pushl  $257
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
	pushl  $257
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy144
	addl   $1,    4(%ecx)
_destroy144:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy145
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy145:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 258: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while4
_endwhile4:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 261: data := tmp  |
	# |                                       |
	# \***************************************/
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy146
_destroy147:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy146
	cmpl   $0,    %ebx
	jne    _destroy147
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $261
	movl   $0,    %eax
	call   inheritexception
_destroy146:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy148
	addl   $1,    4(%ecx)
_destroy148:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy149
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy149:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # data

	# Garbage collection (locals)
	pushl  -12(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy150
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy150:
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
	# |  stdlib.floyd, line 264: push_back(x: Oyd): Vector is  |
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
	# |  stdlib.floyd, line 266: if last >= alloc then  |
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
	jne    _if3
	jmp    _else3
_if3:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 267: alloc := alloc * 2  |
	# |                                              |
	# \**********************************************/
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # alloc
	movl   $2,    %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # alloc

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 268: resize(alloc)  |
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
	jne    _nulltest15
	pushl  $.stringlit1
	pushl  $268
	movl   $0,    %eax
	call   nullexception
_nulltest15:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # resize()
	addl   $8,    %esp
	jmp    _endif3
_else3:
_endif3:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 270: data[last] := x  |
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
	pushl  $270
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  12(%ebp)           # x
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy151
	addl   $1,    4(%ecx)
_destroy151:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy152
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy152:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 271: last := last + 1  |
	# |                                            |
	# \********************************************/
	movl   8(%ebp), %ebx
	pushl  20(%ebx)           # last
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	movl   8(%ebp), %ecx
	popl   20(%ecx)           # last

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 272: push_back := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy153
_destroy154:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy153
	cmpl   $0,    %ebx
	jne    _destroy154
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $272
	movl   $0,    %eax
	call   inheritexception
_destroy153:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy155
	addl   $1,    4(%ecx)
_destroy155:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy156
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy156:
	addl   $4,    %esp
	popl   -4(%ebp)           # push_back

	# Garbage collection (args)
	pushl  12(%ebp)           # x
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy157
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy157:
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
	je     _destroy158
	subl   $1,    4(%eax)
_destroy158:
	leave
	ret


	# /*************************************************************************\
	# |                                                                         |
	# |  stdlib.floyd, line 275: init(newData: Oyd[]; newLast: int): Vector is  |
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
	# |  stdlib.floyd, line 276: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 278: loop while idx < newLast  |
	# |                                                    |
	# \****************************************************/
_while5:
	pushl  16(%ebp)           # newLast
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody5
	jmp    _endwhile5
_whilebody5:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 279: push_back(newData[idx])  |
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
	pushl  $279
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy159
_destroy160:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy159
	cmpl   $0,    %ebx
	jne    _destroy160
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $279
	movl   $0,    %eax
	call   inheritexception
_destroy159:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy161
	addl   $1,    4(%ecx)
_destroy161:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest16
	pushl  $.stringlit1
	pushl  $279
	movl   $0,    %eax
	call   nullexception
_nulltest16:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy162
	cmpl   $0,    4(%ebx)
	jg     _destroy162
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy162:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 280: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while5
_endwhile5:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 283: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy163
_destroy164:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy163
	cmpl   $0,    %ebx
	jne    _destroy164
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $283
	movl   $0,    %eax
	call   inheritexception
_destroy163:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy165
	addl   $1,    4(%ecx)
_destroy165:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy166
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy166:
	addl   $4,    %esp
	popl   -4(%ebp)           # init

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy167
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy167:
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
	je     _destroy168
	subl   $1,    4(%eax)
_destroy168:
	leave
	ret


	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 286: reserve(allocSize: int): Vector is  |
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
	# |  stdlib.floyd, line 288: last := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   20(%ecx)           # last

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 289: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushl  12(%ebp)           # allocSize
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # alloc

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 290: data := new Oyd[alloc]  |
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
	je     _destroy169
_destroy170:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy169
	cmpl   $0,    %ebx
	jne    _destroy170
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $290
	movl   $0,    %eax
	call   inheritexception
_destroy169:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy171
	addl   $1,    4(%ecx)
_destroy171:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy172
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy172:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # data

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 292: reserve := me  |
	# |                                         |
	# \*****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy173
_destroy174:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy173
	cmpl   $0,    %ebx
	jne    _destroy174
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $292
	movl   $0,    %eax
	call   inheritexception
_destroy173:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy175
	addl   $1,    4(%ecx)
_destroy175:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy176
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy176:
	addl   $4,    %esp
	popl   -4(%ebp)           # reserve

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
	je     _destroy177
	subl   $1,    4(%eax)
_destroy177:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 295: copy(): Vector is  |
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
	# |  stdlib.floyd, line 297: copy := new Vector.init(data, last)  |
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
	je     _destroy178
_destroy179:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy178
	cmpl   $0,    %ebx
	jne    _destroy179
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $297
	movl   $0,    %eax
	call   inheritexception
_destroy178:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy180
	addl   $1,    4(%ecx)
_destroy180:

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
	jne    _nulltest17
	pushl  $.stringlit1
	pushl  $297
	movl   $0,    %eax
	call   nullexception
_nulltest17:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # init()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy181
_destroy182:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy181
	cmpl   $0,    %ebx
	jne    _destroy182
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $297
	movl   $0,    %eax
	call   inheritexception
_destroy181:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy183
	addl   $1,    4(%ecx)
_destroy183:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy184
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy184:
	addl   $4,    %esp
	popl   -4(%ebp)           # copy

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
	je     _destroy185
	subl   $1,    4(%eax)
_destroy185:
	leave
	ret


	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 300: at(idx: int): Oyd is  |
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
	# |  stdlib.floyd, line 302: at := data[idx]  |
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
	pushl  $302
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy186
_destroy187:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy186
	cmpl   $0,    %ebx
	jne    _destroy187
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $302
	movl   $0,    %eax
	call   inheritexception
_destroy186:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy188
	addl   $1,    4(%ecx)
_destroy188:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy189
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy189:
	addl   $4,    %esp
	popl   -4(%ebp)           # at

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
	je     _destroy190
	subl   $1,    4(%eax)
_destroy190:
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 305: insert(x: Vector): Vector is  |
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
	# |  stdlib.floyd, line 306: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 307: last := x.size()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest18
	pushl  $.stringlit1
	pushl  $307
	movl   $0,    %eax
	call   nullexception
_nulltest18:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 309: loop while idx < last  |
	# |                                                 |
	# \*************************************************/
_while6:
	pushl  -12(%ebp)          # last
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody6
	jmp    _endwhile6
_whilebody6:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 310: push_back(x.at(idx))  |
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
	jne    _nulltest19
	pushl  $.stringlit1
	pushl  $310
	movl   $0,    %eax
	call   nullexception
_nulltest19:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy191
_destroy192:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy191
	cmpl   $0,    %ebx
	jne    _destroy192
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $310
	movl   $0,    %eax
	call   inheritexception
_destroy191:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy193
	addl   $1,    4(%ecx)
_destroy193:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest20
	pushl  $.stringlit1
	pushl  $310
	movl   $0,    %eax
	call   nullexception
_nulltest20:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy194
	cmpl   $0,    4(%ebx)
	jg     _destroy194
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy194:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 311: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while6
_endwhile6:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 314: insert := me  |
	# |                                        |
	# \****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy195
_destroy196:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy195
	cmpl   $0,    %ebx
	jne    _destroy196
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $314
	movl   $0,    %eax
	call   inheritexception
_destroy195:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy197
	addl   $1,    4(%ecx)
_destroy197:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy198
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy198:
	addl   $4,    %esp
	popl   -4(%ebp)           # insert

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # x
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy199
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy199:
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
	je     _destroy200
	subl   $1,    4(%eax)
_destroy200:
	leave
	ret


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 317: partition(low: int; high: int): int is  |
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
	# |  stdlib.floyd, line 318: pivot := data[high]  |
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
	pushl  $318
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy201
_destroy202:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy201
	cmpl   $0,    %ebx
	jne    _destroy202
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $318
	movl   $0,    %eax
	call   inheritexception
_destroy201:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy203
	addl   $1,    4(%ecx)
_destroy203:
	popl   -8(%ebp)           # pivot

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 319: i := low - 1  |
	# |                                        |
	# \****************************************/
	pushl  12(%ebp)           # low
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 320: j := low  |
	# |                                    |
	# \************************************/
	pushl  12(%ebp)           # low
	popl   -16(%ebp)          # j

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 321: tmp: Oyd  |
	# |                                    |
	# \************************************/
	movl   $0,    -20(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 323: loop while not (j > high - 1)  |
	# |                                                         |
	# \*********************************************************/
_while7:
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
	jne    _whilebody7
	jmp    _endwhile7
_whilebody7:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 324: if not (data[j] > pivot) then  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # pivot
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy204
_destroy205:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy204
	cmpl   $0,    %ebx
	jne    _destroy205
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $324
	movl   $0,    %eax
	call   inheritexception
_destroy204:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy206
	addl   $1,    4(%ecx)
_destroy206:

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $0
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax
	pushl  $.stringlit1
	pushl  $324
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest21
	pushl  $.stringlit1
	pushl  $324
	movl   $0,    %eax
	call   nullexception
_nulltest21:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   44(%eax), %ebx
	call   *%ebx              # _gt_()
	addl   $8,    %esp
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _if4
	jmp    _else4
_if4:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 325: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 326: tmp := data[i]  |
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
	pushl  $326
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy207
_destroy208:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy207
	cmpl   $0,    %ebx
	jne    _destroy208
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $326
	movl   $0,    %eax
	call   inheritexception
_destroy207:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy209
	addl   $1,    4(%ecx)
_destroy209:
	pushl  -20(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy210
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy210:
	addl   $4,    %esp
	popl   -20(%ebp)          # tmp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 327: data[i] := data[j]  |
	# |                                              |
	# \**********************************************/
	movl   -12(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $327
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
	pushl  $327
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy211
	addl   $1,    4(%ecx)
_destroy211:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy212
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy212:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 328: data[j] := tmp  |
	# |                                          |
	# \******************************************/
	movl   -16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $328
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy213
	addl   $1,    4(%ecx)
_destroy213:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy214
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy214:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)
	jmp    _endif4
_else4:
_endif4:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 330: j := j + 1  |
	# |                                      |
	# \**************************************/
	pushl  -16(%ebp)          # j
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _while7
_endwhile7:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 333: tmp := data[i + 1]  |
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
	pushl  $333
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy215
_destroy216:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy215
	cmpl   $0,    %ebx
	jne    _destroy216
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $333
	movl   $0,    %eax
	call   inheritexception
_destroy215:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy217
	addl   $1,    4(%ecx)
_destroy217:
	pushl  -20(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy218
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy218:
	addl   $4,    %esp
	popl   -20(%ebp)          # tmp

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 334: data[i + 1] := data[high]  |
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
	pushl  $334
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
	pushl  $334
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy219
	addl   $1,    4(%ecx)
_destroy219:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy220
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy220:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 335: data[high] := tmp  |
	# |                                             |
	# \*********************************************/
	movl   16(%ebp), %eax
	pushl  %eax
	pushl  $1
	pushl  $1
	movl   8(%ebp), %eax
	pushl  16(%eax)
	pushl  $.stringlit1
	pushl  $335
	movl   $0,    %eax
	call   indexarray
	addl   $24,   %esp
	pushl  %eax
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy221
	addl   $1,    4(%ecx)
_destroy221:
	movl   4(%esp), %eax
	pushl  (%eax)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy222
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy222:
	addl   $4,    %esp
	popl   %eax
	popl   %ecx
	movl   %eax,  (%ecx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 337: partition := i + 1  |
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
	je     _destroy223
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy223:
	addl   $4,    %esp
	pushl  -20(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy224
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy224:
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
	# |  stdlib.floyd, line 340: quicksort(low: int; high: int): Vector is  |
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
	# |  stdlib.floyd, line 341: pivot: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 343: if not (low >= high) then  |
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
	jne    _if5
	jmp    _else5
_if5:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 344: pivot := partition(low, high)  |
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
	jne    _nulltest22
	pushl  $.stringlit1
	pushl  $344
	movl   $0,    %eax
	call   nullexception
_nulltest22:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # partition()
	addl   $12,   %esp
	movl   %eax,  -8(%ebp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 345: quicksort(low, pivot - 1)  |
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
	jne    _nulltest23
	pushl  $.stringlit1
	pushl  $345
	movl   $0,    %eax
	call   nullexception
_nulltest23:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy225
	cmpl   $0,    4(%ebx)
	jg     _destroy225
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy225:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 346: quicksort(pivot + 1, high)  |
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
	jne    _nulltest24
	pushl  $.stringlit1
	pushl  $346
	movl   $0,    %eax
	call   nullexception
_nulltest24:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy226
	cmpl   $0,    4(%ebx)
	jg     _destroy226
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy226:
	jmp    _endif5
_else5:
_endif5:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 349: quicksort := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy227
_destroy228:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy227
	cmpl   $0,    %ebx
	jne    _destroy228
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $349
	movl   $0,    %eax
	call   inheritexception
_destroy227:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy229
	addl   $1,    4(%ecx)
_destroy229:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy230
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy230:
	addl   $4,    %esp
	popl   -4(%ebp)           # quicksort

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
	je     _destroy231
	subl   $1,    4(%eax)
_destroy231:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 352: sort(): Vector is  |
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
	# |  stdlib.floyd, line 354: sort := quicksort(0, last - 1)  |
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
	jne    _nulltest25
	pushl  $.stringlit1
	pushl  $354
	movl   $0,    %eax
	call   nullexception
_nulltest25:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # quicksort()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy232
_destroy233:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy232
	cmpl   $0,    %ebx
	jne    _destroy233
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $354
	movl   $0,    %eax
	call   inheritexception
_destroy232:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy234
	addl   $1,    4(%ecx)
_destroy234:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy235
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy235:
	addl   $4,    %esp
	popl   -4(%ebp)           # sort

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
	je     _destroy236
	subl   $1,    4(%eax)
_destroy236:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 363: class String is  |
	# |                                           |
	# \*******************************************/
	#   *******   **         **
	#  *********  **         **
	#  **** ****  **
	#  ***   *** ***** ***** **  ********   *******
	#  ******    ***** ***** **  ********  ********
	#  ********   **   ***** **  ********  ********
	#    *******  **   ***   **  ***  ***  ***  ***
	#      *****  **   ***   **  **    **  **    **
	#  ***   ***  **   **    **  **    **  ***  ***
	#  **** ****  **** **    **  **    **  ********
	#  *********  **** **    **  **    **  ********
	#   *******   **** **    **  **    **   *******
	#                                      *** ****
	#                                      ********
	#                                      *******
.global Stringinit
	.type  Stringinit, @function
Stringinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 364: data := new IntVector  |
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
	je     _destroy237
_destroy238:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy237
	cmpl   $0,    %ebx
	jne    _destroy238
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $364
	movl   $0,    %eax
	call   inheritexception
_destroy237:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy239
	addl   $1,    4(%ecx)
_destroy239:
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # data
	leave
	ret

.global Stringdestroy
	.type  Stringdestroy, @function
Stringdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy240
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy240
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy241
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy241:
	call   destroyobject
	addl   $4,    %esp
_destroy240:
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

.global String_type
	.type  String_type, @function
String_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 366: size(): int is  |
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
	# |  stdlib.floyd, line 368: size := data.size()  |
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
	jne    _nulltest26
	pushl  $.stringlit1
	pushl  $368
	movl   $0,    %eax
	call   nullexception
_nulltest26:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
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
	# |  stdlib.floyd, line 371: length(): int is  |
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
	# |  stdlib.floyd, line 373: length := data.size()  |
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
	jne    _nulltest27
	pushl  $.stringlit1
	pushl  $373
	movl   $0,    %eax
	call   nullexception
_nulltest27:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
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
	# |  stdlib.floyd, line 376: getData(): IntVector is  |
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
	# |  stdlib.floyd, line 378: getData := data  |
	# |                                           |
	# \*******************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy242
_destroy243:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy242
	cmpl   $0,    %ebx
	jne    _destroy243
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $378
	movl   $0,    %eax
	call   inheritexception
_destroy242:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy244
	addl   $1,    4(%ecx)
_destroy244:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy245
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy245:
	addl   $4,    %esp
	popl   -4(%ebp)           # getData

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
	je     _destroy246
	subl   $1,    4(%eax)
_destroy246:
	leave
	ret


	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 381: init(newData: IntVector): String is  |
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
	# |  stdlib.floyd, line 383: data := newData  |
	# |                                           |
	# \*******************************************/
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy247
_destroy248:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy247
	cmpl   $0,    %ebx
	jne    _destroy248
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $383
	movl   $0,    %eax
	call   inheritexception
_destroy247:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy249
	addl   $1,    4(%ecx)
_destroy249:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy250
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy250:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # data

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 384: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy251
_destroy252:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy251
	cmpl   $0,    %ebx
	jne    _destroy252
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $384
	movl   $0,    %eax
	call   inheritexception
_destroy251:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy253
	addl   $1,    4(%ecx)
_destroy253:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy254
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy254:
	addl   $4,    %esp
	popl   -4(%ebp)           # init

	# Garbage collection (args)
	pushl  12(%ebp)           # newData
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy255
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy255:
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
	je     _destroy256
	subl   $1,    4(%eax)
_destroy256:
	leave
	ret


	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 387: appendChar(ch: int): String is  |
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
	# |  stdlib.floyd, line 389: data.push_back(ch)  |
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
	jne    _nulltest28
	pushl  $.stringlit1
	pushl  $389
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
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy257
	cmpl   $0,    4(%ebx)
	jg     _destroy257
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy257:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 390: appendChar := me  |
	# |                                            |
	# \********************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy258
_destroy259:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy258
	cmpl   $0,    %ebx
	jne    _destroy259
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $390
	movl   $0,    %eax
	call   inheritexception
_destroy258:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy260
	addl   $1,    4(%ecx)
_destroy260:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy261
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy261:
	addl   $4,    %esp
	popl   -4(%ebp)           # appendChar

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
	je     _destroy262
	subl   $1,    4(%eax)
_destroy262:
	leave
	ret


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 393: catIntHelper(num: int; str: String) is  |
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
	# |  stdlib.floyd, line 394: digit: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 396: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushl  12(%ebp)           # num
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	pushl  %eax
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 397: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if6
	jmp    _else6
_if6:

	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 398: catIntHelper(num / 10, str)  |
	# |                                                       |
	# \*******************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy263
_destroy264:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy263
	cmpl   $0,    %ebx
	jne    _destroy264
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $398
	movl   $0,    %eax
	call   inheritexception
_destroy263:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy265
	addl   $1,    4(%ecx)
_destroy265:
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest29
	pushl  $.stringlit1
	pushl  $398
	movl   $0,    %eax
	call   nullexception
_nulltest29:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # catIntHelper()
	addl   $12,   %esp
	jmp    _endif6
_else6:
_endif6:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 400: str.appendChar(digit + 48)  |
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
	jne    _nulltest30
	pushl  $.stringlit1
	pushl  $400
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
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy266
	cmpl   $0,    4(%ebx)
	jg     _destroy266
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy266:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  16(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy267
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy267:
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
	# |  stdlib.floyd, line 403: copy(): String is  |
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
	# |  stdlib.floyd, line 405: copy := new String.init(data.copy())  |
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
	jne    _nulltest31
	pushl  $.stringlit1
	pushl  $405
	movl   $0,    %eax
	call   nullexception
_nulltest31:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy268
_destroy269:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy268
	cmpl   $0,    %ebx
	jne    _destroy269
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $405
	movl   $0,    %eax
	call   inheritexception
_destroy268:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy270
	addl   $1,    4(%ecx)
_destroy270:

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
	jne    _nulltest32
	pushl  $.stringlit1
	pushl  $405
	movl   $0,    %eax
	call   nullexception
_nulltest32:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
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
	pushl  $405
	movl   $0,    %eax
	call   inheritexception
_destroy271:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy273
	addl   $1,    4(%ecx)
_destroy273:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy274
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy274:
	addl   $4,    %esp
	popl   -4(%ebp)           # copy

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
	je     _destroy275
	subl   $1,    4(%eax)
_destroy275:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 408: cat(str: String): String is  |
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
	# |  stdlib.floyd, line 409: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest33
	pushl  $.stringlit1
	pushl  $409
	movl   $0,    %eax
	call   nullexception
_nulltest33:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy276
_destroy277:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy276
	cmpl   $0,    %ebx
	jne    _destroy277
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $409
	movl   $0,    %eax
	call   inheritexception
_destroy276:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy278
	addl   $1,    4(%ecx)
_destroy278:
	popl   -8(%ebp)           # newStr

	# Statement list

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 411: newStr.getData().insert(str.getData())  |
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
	jne    _nulltest34
	pushl  $.stringlit1
	pushl  $411
	movl   $0,    %eax
	call   nullexception
_nulltest34:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy279
_destroy280:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy279
	cmpl   $0,    %ebx
	jne    _destroy280
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $411
	movl   $0,    %eax
	call   inheritexception
_destroy279:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy281
	addl   $1,    4(%ecx)
_destroy281:

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest35
	pushl  $.stringlit1
	pushl  $411
	movl   $0,    %eax
	call   nullexception
_nulltest35:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest36
	pushl  $.stringlit1
	pushl  $411
	movl   $0,    %eax
	call   nullexception
_nulltest36:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # insert()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy282
	cmpl   $0,    4(%ebx)
	jg     _destroy282
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy282:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 412: cat := newStr  |
	# |                                         |
	# \*****************************************/
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy283
_destroy284:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy283
	cmpl   $0,    %ebx
	jne    _destroy284
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $412
	movl   $0,    %eax
	call   inheritexception
_destroy283:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy285
	addl   $1,    4(%ecx)
_destroy285:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy286
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy286:
	addl   $4,    %esp
	popl   -4(%ebp)           # cat

	# Garbage collection (locals)
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy287
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy287:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy288
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy288:
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
	je     _destroy289
	subl   $1,    4(%eax)
_destroy289:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 415: _cat_(other: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 416: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy290
_destroy291:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy290
	cmpl   $0,    %ebx
	jne    _destroy291
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $416
	movl   $0,    %eax
	call   inheritexception
_destroy290:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy292
	addl   $1,    4(%ecx)
_destroy292:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 418: _cat_ := cat(tmp)  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy293
_destroy294:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy293
	cmpl   $0,    %ebx
	jne    _destroy294
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $418
	movl   $0,    %eax
	call   inheritexception
_destroy293:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy295
	addl   $1,    4(%ecx)
_destroy295:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest37
	pushl  $.stringlit1
	pushl  $418
	movl   $0,    %eax
	call   nullexception
_nulltest37:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # cat()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy296
_destroy297:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy296
	cmpl   $0,    %ebx
	jne    _destroy297
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $418
	movl   $0,    %eax
	call   inheritexception
_destroy296:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy298
	addl   $1,    4(%ecx)
_destroy298:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy299
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy299:
	addl   $4,    %esp
	popl   -4(%ebp)           # _cat_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy300
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy300:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy301
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy301:
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
	je     _destroy302
	subl   $1,    4(%eax)
_destroy302:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 421: catChar(ch: int): String is  |
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
	# |  stdlib.floyd, line 422: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest38
	pushl  $.stringlit1
	pushl  $422
	movl   $0,    %eax
	call   nullexception
_nulltest38:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy303
_destroy304:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy303
	cmpl   $0,    %ebx
	jne    _destroy304
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $422
	movl   $0,    %eax
	call   inheritexception
_destroy303:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy305
	addl   $1,    4(%ecx)
_destroy305:
	popl   -8(%ebp)           # newStr

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 424: newStr.appendChar(ch)  |
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
	jne    _nulltest39
	pushl  $.stringlit1
	pushl  $424
	movl   $0,    %eax
	call   nullexception
_nulltest39:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy306
	cmpl   $0,    4(%ebx)
	jg     _destroy306
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy306:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 425: catChar := newStr  |
	# |                                             |
	# \*********************************************/
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy307
_destroy308:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy307
	cmpl   $0,    %ebx
	jne    _destroy308
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $425
	movl   $0,    %eax
	call   inheritexception
_destroy307:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy309
	addl   $1,    4(%ecx)
_destroy309:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy310
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy310:
	addl   $4,    %esp
	popl   -4(%ebp)           # catChar

	# Garbage collection (locals)
	pushl  -8(%ebp)           # newStr
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy311
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy311:
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
	je     _destroy312
	subl   $1,    4(%eax)
_destroy312:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 428: catInt(num: int): String is  |
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
	# |  stdlib.floyd, line 429: result: String  |
	# |                                          |
	# \******************************************/
	movl   $0,    -8(%ebp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 430: i: int  |
	# |                                  |
	# \**********************************/
	movl   $0,    -12(%ebp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 432: if not (num = 0) then  |
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
	jne    _if7
	jmp    _else7
_if7:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 433: result := new String  |
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
	pushl  $433
	movl   $0,    %eax
	call   inheritexception
_destroy313:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy315
	addl   $1,    4(%ecx)
_destroy315:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy316
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy316:
	addl   $4,    %esp
	popl   -8(%ebp)           # result

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 435: if (0 > num) then  |
	# |                                             |
	# \*********************************************/
	pushl  12(%ebp)           # num
	movl   $0,    %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if8
	jmp    _else8
_if8:

	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 436: result.appendChar(45) ~ minus sign  |
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
	jne    _nulltest40
	pushl  $.stringlit1
	pushl  $436
	movl   $0,    %eax
	call   nullexception
_nulltest40:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy317
	cmpl   $0,    4(%ebx)
	jg     _destroy317
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy317:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 437: num := -num  |
	# |                                       |
	# \***************************************/
	movl   12(%ebp), %eax
	negl   %eax
	movl   %eax,  12(%ebp)
	jmp    _endif8
_else8:
_endif8:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 441: catIntHelper(num, result)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy318
_destroy319:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy318
	cmpl   $0,    %ebx
	jne    _destroy319
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $441
	movl   $0,    %eax
	call   inheritexception
_destroy318:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy320
	addl   $1,    4(%ecx)
_destroy320:
	movl   12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest41
	pushl  $.stringlit1
	pushl  $441
	movl   $0,    %eax
	call   nullexception
_nulltest41:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # catIntHelper()
	addl   $12,   %esp
	jmp    _endif7
_else7:

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 443: result := (new String).catChar(48) ~ 0  |
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
	jne    _nulltest42
	pushl  $.stringlit1
	pushl  $443
	movl   $0,    %eax
	call   nullexception
_nulltest42:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # catChar()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy321
_destroy322:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy321
	cmpl   $0,    %ebx
	jne    _destroy322
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $443
	movl   $0,    %eax
	call   inheritexception
_destroy321:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy323
	addl   $1,    4(%ecx)
_destroy323:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy324
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy324:
	addl   $4,    %esp
	popl   -8(%ebp)           # result
_endif7:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 446: catInt := cat(result)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy325
_destroy326:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy325
	cmpl   $0,    %ebx
	jne    _destroy326
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $446
	movl   $0,    %eax
	call   inheritexception
_destroy325:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy327
	addl   $1,    4(%ecx)
_destroy327:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest43
	pushl  $.stringlit1
	pushl  $446
	movl   $0,    %eax
	call   nullexception
_nulltest43:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # cat()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy328
_destroy329:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy328
	cmpl   $0,    %ebx
	jne    _destroy329
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $446
	movl   $0,    %eax
	call   inheritexception
_destroy328:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy330
	addl   $1,    4(%ecx)
_destroy330:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy331
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy331:
	addl   $4,    %esp
	popl   -4(%ebp)           # catInt

	# Garbage collection (locals)
	pushl  -8(%ebp)           # result
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy332
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy332:
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
	je     _destroy333
	subl   $1,    4(%eax)
_destroy333:
	leave
	ret


	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 449: charAt(idx: int): int is  |
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
	# |  stdlib.floyd, line 451: if 0 > idx or idx >= size() then  |
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
	jne    _nulltest44
	pushl  $.stringlit1
	pushl  $451
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
	jne    _if9
	jmp    _else9
_if9:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 452: charAt := -1  |
	# |                                        |
	# \****************************************/
	movl   $-1,   -4(%ebp)
	jmp    _endif9
_else9:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 454: charAt := data.at(idx)  |
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
	jne    _nulltest45
	pushl  $.stringlit1
	pushl  $454
	movl   $0,    %eax
	call   nullexception
_nulltest45:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	movl   %eax,  -4(%ebp)
_endif9:

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
	# |  stdlib.floyd, line 459: eq(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 460: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy334
_destroy335:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy334
	cmpl   $0,    %ebx
	jne    _destroy335
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $460
	movl   $0,    %eax
	call   inheritexception
_destroy334:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy336
	addl   $1,    4(%ecx)
_destroy336:
	popl   -8(%ebp)           # tmp

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 461: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -12(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 462: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest46
	pushl  $.stringlit1
	pushl  $462
	movl   $0,    %eax
	call   nullexception
_nulltest46:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -16(%ebp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 464: if not (len = tmp.length()) then  |
	# |                                                            |
	# \************************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest47
	pushl  $.stringlit1
	pushl  $464
	movl   $0,    %eax
	call   nullexception
_nulltest47:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	jne    _if10
	jmp    _else10
_if10:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 465: eq := false  |
	# |                                       |
	# \***************************************/
	movl   $0,    -4(%ebp)
	jmp    _endif10
_else10:

	# /*************************************************************************************\
	# |                                                                                     |
	# |  stdlib.floyd, line 467: loop while not (i >= len) and (charAt(i) = tmp.charAt(i))  |
	# |                                                                                     |
	# \*************************************************************************************/
_while8:
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
	jne    _nulltest48
	pushl  $.stringlit1
	pushl  $467
	movl   $0,    %eax
	call   nullexception
_nulltest48:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _nulltest49
	pushl  $.stringlit1
	pushl  $467
	movl   $0,    %eax
	call   nullexception
_nulltest49:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _whilebody8
	jmp    _endwhile8
_whilebody8:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 468: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -12(%ebp)          # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while8
_endwhile8:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 470: eq := (i = len)  |
	# |                                           |
	# \*******************************************/
	pushl  -16(%ebp)          # len
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
_endif10:

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy337
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy337:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy338
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy338:
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
	# |  stdlib.floyd, line 474: gt(str: String): boolean is  |
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
	# |  stdlib.floyd, line 475: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 476: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest50
	pushl  $.stringlit1
	pushl  $476
	movl   $0,    %eax
	call   nullexception
_nulltest50:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*****************************************************************************************************************\
	# |                                                                                                                 |
	# |  stdlib.floyd, line 478: loop while not (i >= len) and not (i >= str.length()) and (charAt(i) = str.charAt(i))  |
	# |                                                                                                                 |
	# \*****************************************************************************************************************/
_while9:
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
	jne    _nulltest51
	pushl  $.stringlit1
	pushl  $478
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
	jne    _nulltest52
	pushl  $.stringlit1
	pushl  $478
	movl   $0,    %eax
	call   nullexception
_nulltest52:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _nulltest53
	pushl  $.stringlit1
	pushl  $478
	movl   $0,    %eax
	call   nullexception
_nulltest53:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _whilebody9
	jmp    _endwhile9
_whilebody9:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 479: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -8(%ebp)           # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while9
_endwhile9:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 481: if (i >= len) or (i >= str.length()) then  |
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
	jne    _nulltest54
	pushl  $.stringlit1
	pushl  $481
	movl   $0,    %eax
	call   nullexception
_nulltest54:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	jne    _if11
	jmp    _else11
_if11:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 482: gt := len > str.length()  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest55
	pushl  $.stringlit1
	pushl  $482
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
	call   *%ebx              # length()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
	jmp    _endif11
_else11:

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 484: gt := (charAt(i) > str.charAt(i))  |
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
	jne    _nulltest56
	pushl  $.stringlit1
	pushl  $484
	movl   $0,    %eax
	call   nullexception
_nulltest56:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _nulltest57
	pushl  $.stringlit1
	pushl  $484
	movl   $0,    %eax
	call   nullexception
_nulltest57:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	movl   %eax,  -4(%ebp)
_endif11:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy339
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy339:
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
	# |  stdlib.floyd, line 488: gteq(str: String): boolean is  |
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
	# |  stdlib.floyd, line 490: gteq := gt(str) or eq(str)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy340
_destroy341:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy340
	cmpl   $0,    %ebx
	jne    _destroy341
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
_destroy340:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy342
	addl   $1,    4(%ecx)
_destroy342:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest58
	pushl  $.stringlit1
	pushl  $490
	movl   $0,    %eax
	call   nullexception
_nulltest58:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   124(%eax), %ebx
	call   *%ebx              # gt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy343
_destroy344:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy343
	cmpl   $0,    %ebx
	jne    _destroy344
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $490
	movl   $0,    %eax
	call   inheritexception
_destroy343:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy345
	addl   $1,    4(%ecx)
_destroy345:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest59
	pushl  $.stringlit1
	pushl  $490
	movl   $0,    %eax
	call   nullexception
_nulltest59:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   24(%eax), %ebx
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
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 493: _lt_(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 494: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy347
_destroy348:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy347
	cmpl   $0,    %ebx
	jne    _destroy348
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $494
	movl   $0,    %eax
	call   inheritexception
_destroy347:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy349
	addl   $1,    4(%ecx)
_destroy349:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 496: _lt_ := not gteq(tmp)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy350
_destroy351:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy350
	cmpl   $0,    %ebx
	jne    _destroy351
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $496
	movl   $0,    %eax
	call   inheritexception
_destroy350:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy352
	addl   $1,    4(%ecx)
_destroy352:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest60
	pushl  $.stringlit1
	pushl  $496
	movl   $0,    %eax
	call   nullexception
_nulltest60:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   128(%eax), %ebx
	call   *%ebx              # gteq()
	addl   $8,    %esp
	xorl   $1,    %eax
	movl   %eax,  -4(%ebp)

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy353
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy353:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy354
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy354:
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
	# |  stdlib.floyd, line 499: toString(): String is  |
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
	# |  stdlib.floyd, line 501: toString := me  |
	# |                                          |
	# \******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy355
_destroy356:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy355
	cmpl   $0,    %ebx
	jne    _destroy356
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $501
	movl   $0,    %eax
	call   inheritexception
_destroy355:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy357
	addl   $1,    4(%ecx)
_destroy357:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy358
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy358:
	addl   $4,    %esp
	popl   -4(%ebp)           # toString

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
	je     _destroy359
	subl   $1,    4(%eax)
_destroy359:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 504: toInt(): int is  |
	# |                                           |
	# \*******************************************/
.global String_toInt
	.type  String_toInt, @function
String_toInt:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 505: num := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 506: mult := 1  |
	# |                                     |
	# \*************************************/
	movl   $1,    -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 507: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /***************************************************************************\
	# |                                                                           |
	# |  stdlib.floyd, line 509: if idx < data.size() and data.at(idx) = 45 then  |
	# |                                                                           |
	# \***************************************************************************/

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest61
	pushl  $.stringlit1
	pushl  $509
	movl   $0,    %eax
	call   nullexception
_nulltest61:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -16(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $45

	# Pushing parameters
	movl   -16(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest62
	pushl  $.stringlit1
	pushl  $509
	movl   $0,    %eax
	call   nullexception
_nulltest62:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _if12
	jmp    _else12
_if12:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 510: mult := -1  |
	# |                                      |
	# \**************************************/
	movl   $-1,   -12(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 511: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -16(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _endif12
_else12:
_endif12:

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 514: loop while idx < data.size()  |
	# |                                                        |
	# \********************************************************/
_while10:

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest63
	pushl  $.stringlit1
	pushl  $514
	movl   $0,    %eax
	call   nullexception
_nulltest63:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -16(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody10
	jmp    _endwhile10
_whilebody10:

	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 515: num := num * 10 + (data.at(idx) - 48)  |
	# |                                                                 |
	# \*****************************************************************/
	pushl  -8(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax

	# Pushing parameters
	movl   -16(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest64
	pushl  $.stringlit1
	pushl  $515
	movl   $0,    %eax
	call   nullexception
_nulltest64:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 516: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -16(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _while10
_endwhile10:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 519: toInt := num * mult  |
	# |                                               |
	# \***********************************************/
	pushl  -8(%ebp)           # num
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


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 522: find(other: String): int is  |
	# |                                                       |
	# \*******************************************************/
.global String_find
	.type  String_find, @function
String_find:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 523: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 524: search := 0  |
	# |                                       |
	# \***************************************/
	movl   $0,    -12(%ebp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 525: found := false  |
	# |                                          |
	# \******************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /********************************************************************************\
	# |                                                                                |
	# |  stdlib.floyd, line 527: loop while not found and idx < size() - other.size()  |
	# |                                                                                |
	# \********************************************************************************/
_while11:
	movl   -16(%ebp), %eax
	xorl   $1,    %eax
	pushl  %eax

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest65
	pushl  $.stringlit1
	pushl  $527
	movl   $0,    %eax
	call   nullexception
_nulltest65:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest66
	pushl  $.stringlit1
	pushl  $527
	movl   $0,    %eax
	call   nullexception
_nulltest66:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody11
	jmp    _endwhile11
_whilebody11:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 528: search := 0  |
	# |                                       |
	# \***************************************/
	movl   $0,    -12(%ebp)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 529: found := true  |
	# |                                         |
	# \*****************************************/
	movl   $1,    -16(%ebp)

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 530: loop while found and search < other.size()  |
	# |                                                                      |
	# \**********************************************************************/
_while12:
	pushl  -16(%ebp)          # found

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest67
	pushl  $.stringlit1
	pushl  $530
	movl   $0,    %eax
	call   nullexception
_nulltest67:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody12
	jmp    _endwhile12
_whilebody12:

	# /********************************************************************************\
	# |                                                                                |
	# |  stdlib.floyd, line 531: if charAt(idx + search) != other.charAt(search) then  |
	# |                                                                                |
	# \********************************************************************************/

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest68
	pushl  $.stringlit1
	pushl  $531
	movl   $0,    %eax
	call   nullexception
_nulltest68:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing parameters
	pushl  -8(%ebp)           # idx
	movl   -12(%ebp), %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest69
	pushl  $.stringlit1
	pushl  $531
	movl   $0,    %eax
	call   nullexception
_nulltest69:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if13
	jmp    _else13
_if13:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 532: found := false  |
	# |                                          |
	# \******************************************/
	movl   $0,    -16(%ebp)
	jmp    _endif13
_else13:
_endif13:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 534: search := search + 1  |
	# |                                                |
	# \************************************************/
	pushl  -12(%ebp)          # search
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while12
_endwhile12:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 536: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while11
_endwhile11:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 539: if found then  |
	# |                                         |
	# \*****************************************/
	movl   -16(%ebp), %eax
	cmpl   $0,    %eax
	jne    _if14
	jmp    _else14
_if14:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 540: find := idx - 1  |
	# |                                           |
	# \*******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -4(%ebp)
	jmp    _endif14
_else14:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 542: find := -1  |
	# |                                      |
	# \**************************************/
	movl   $-1,   -4(%ebp)
_endif14:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy360
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy360:
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


	# /********************************************************************\
	# |                                                                    |
	# |  stdlib.floyd, line 546: substring(pos: int; len: int): String is  |
	# |                                                                    |
	# \********************************************************************/
.global String_substring
	.type  String_substring, @function
String_substring:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 547: res := new String  |
	# |                                             |
	# \*********************************************/
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy361
_destroy362:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy361
	cmpl   $0,    %ebx
	jne    _destroy362
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $547
	movl   $0,    %eax
	call   inheritexception
_destroy361:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy363
	addl   $1,    4(%ecx)
_destroy363:
	popl   -8(%ebp)           # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 548: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -12(%ebp)

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 550: res.getData().reserve(len)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movl   16(%ebp), %eax
	pushl  %eax

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest70
	pushl  $.stringlit1
	pushl  $550
	movl   $0,    %eax
	call   nullexception
_nulltest70:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest71
	pushl  $.stringlit1
	pushl  $550
	movl   $0,    %eax
	call   nullexception
_nulltest71:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # reserve()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy364
	cmpl   $0,    4(%ebx)
	jg     _destroy364
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy364:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 551: loop while idx < len  |
	# |                                                |
	# \************************************************/
_while13:
	pushl  16(%ebp)           # len
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody13
	jmp    _endwhile13
_whilebody13:

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 552: res.appendChar(charAt(pos + idx))  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters

	# Pushing parameters
	pushl  12(%ebp)           # pos
	movl   -12(%ebp), %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest72
	pushl  $.stringlit1
	pushl  $552
	movl   $0,    %eax
	call   nullexception
_nulltest72:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest73
	pushl  $.stringlit1
	pushl  $552
	movl   $0,    %eax
	call   nullexception
_nulltest73:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy365
	cmpl   $0,    4(%ebx)
	jg     _destroy365
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy365:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 553: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while13
_endwhile13:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 556: substring := res  |
	# |                                            |
	# \********************************************/
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy366
_destroy367:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy366
	cmpl   $0,    %ebx
	jne    _destroy367
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $556
	movl   $0,    %eax
	call   inheritexception
_destroy366:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy368
	addl   $1,    4(%ecx)
_destroy368:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy369
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy369:
	addl   $4,    %esp
	popl   -4(%ebp)           # substring

	# Garbage collection (locals)
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy370
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy370:
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
	je     _destroy371
	subl   $1,    4(%eax)
_destroy371:
	leave
	ret


	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 559: split(): Vector is  |
	# |                                              |
	# \**********************************************/
.global String_split
	.type  String_split, @function
String_split:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 560: res := new Vector  |
	# |                                             |
	# \*********************************************/
	pushl  $3
	pushl  $Vectorvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Vectorinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy372
_destroy373:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy372
	cmpl   $0,    %ebx
	jne    _destroy373
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $560
	movl   $0,    %eax
	call   inheritexception
_destroy372:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy374
	addl   $1,    4(%ecx)
_destroy374:
	popl   -8(%ebp)           # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 561: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -12(%ebp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 562: last := 0  |
	# |                                     |
	# \*************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 564: loop while idx < size()  |
	# |                                                   |
	# \***************************************************/
_while14:

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest74
	pushl  $.stringlit1
	pushl  $564
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
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody14
	jmp    _endwhile14
_whilebody14:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 565: if charAt(idx) = 32 then  |
	# |                                                    |
	# \****************************************************/
	pushl  $32

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest75
	pushl  $.stringlit1
	pushl  $565
	movl   $0,    %eax
	call   nullexception
_nulltest75:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if15
	jmp    _else15
_if15:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 566: if idx - last > 1 then  |
	# |                                                  |
	# \**************************************************/
	pushl  $1
	pushl  -12(%ebp)          # idx
	movl   -16(%ebp), %ebx
	popl   %eax
	subl   %ebx,  %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if16
	jmp    _else16
_if16:

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 567: res.push_back(substring(last, idx - last))  |
	# |                                                                      |
	# \**********************************************************************/

	# Pushing parameters

	# Pushing parameters
	pushl  -12(%ebp)          # idx
	movl   -16(%ebp), %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -16(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest76
	pushl  $.stringlit1
	pushl  $567
	movl   $0,    %eax
	call   nullexception
_nulltest76:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   140(%eax), %ebx
	call   *%ebx              # substring()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy375
_destroy376:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy375
	cmpl   $0,    %ebx
	jne    _destroy376
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $567
	movl   $0,    %eax
	call   inheritexception
_destroy375:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy377
	addl   $1,    4(%ecx)
_destroy377:

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest77
	pushl  $.stringlit1
	pushl  $567
	movl   $0,    %eax
	call   nullexception
_nulltest77:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy378
	cmpl   $0,    4(%ebx)
	jg     _destroy378
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy378:
	jmp    _endif16
_else16:
_endif16:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 570: last := idx + 1  |
	# |                                           |
	# \*******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -16(%ebp)
	jmp    _endif15
_else15:
_endif15:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 573: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while14
_endwhile14:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 575: if idx - last > 1 then  |
	# |                                                  |
	# \**************************************************/
	pushl  $1
	pushl  -12(%ebp)          # idx
	movl   -16(%ebp), %ebx
	popl   %eax
	subl   %ebx,  %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if17
	jmp    _else17
_if17:

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 576: res.push_back(substring(last, idx - last))  |
	# |                                                                      |
	# \**********************************************************************/

	# Pushing parameters

	# Pushing parameters
	pushl  -12(%ebp)          # idx
	movl   -16(%ebp), %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -16(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest78
	pushl  $.stringlit1
	pushl  $576
	movl   $0,    %eax
	call   nullexception
_nulltest78:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   140(%eax), %ebx
	call   *%ebx              # substring()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy379
_destroy380:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy379
	cmpl   $0,    %ebx
	jne    _destroy380
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $576
	movl   $0,    %eax
	call   inheritexception
_destroy379:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy381
	addl   $1,    4(%ecx)
_destroy381:

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest79
	pushl  $.stringlit1
	pushl  $576
	movl   $0,    %eax
	call   nullexception
_nulltest79:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy382
	cmpl   $0,    4(%ebx)
	jg     _destroy382
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy382:
	jmp    _endif17
_else17:
_endif17:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 579: split := res  |
	# |                                        |
	# \****************************************/
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy383
_destroy384:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy383
	cmpl   $0,    %ebx
	jne    _destroy384
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $579
	movl   $0,    %eax
	call   inheritexception
_destroy383:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy385
	addl   $1,    4(%ecx)
_destroy385:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy386
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy386:
	addl   $4,    %esp
	popl   -4(%ebp)           # split

	# Garbage collection (locals)
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy387
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy387:
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
	je     _destroy388
	subl   $1,    4(%eax)
_destroy388:
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 582: join(data: Vector): String is  |
	# |                                                         |
	# \*********************************************************/
.global String_join
	.type  String_join, @function
String_join:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 583: res := new String  |
	# |                                             |
	# \*********************************************/
	pushl  $1
	pushl  $Stringvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	call   Stringinit
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy389
_destroy390:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy389
	cmpl   $0,    %ebx
	jne    _destroy390
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $583
	movl   $0,    %eax
	call   inheritexception
_destroy389:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy391
	addl   $1,    4(%ecx)
_destroy391:
	popl   -8(%ebp)           # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 584: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -12(%ebp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 586: loop while idx < data.size() - 1  |
	# |                                                            |
	# \************************************************************/
_while15:

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest80
	pushl  $.stringlit1
	pushl  $586
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
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody15
	jmp    _endwhile15
_whilebody15:

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 587: res := res & data.at(idx).toString() & " "  |
	# |                                                                      |
	# \**********************************************************************/

	# Pushing parameters
	.section .rodata
.stringlit18:
	.string " "
.text
	pushl  $Stringvtable
	pushl  $.stringlit18
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy392
_destroy393:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy392
	cmpl   $0,    %ebx
	jne    _destroy393
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   inheritexception
_destroy392:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy394
	addl   $1,    4(%ecx)
_destroy394:

	# Pushing caller

	# Pushing parameters

	# Pushing parameters

	# Pushing caller

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest81
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest81:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest82
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest82:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   16(%eax), %ebx
	call   *%ebx              # toString()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy395
_destroy396:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy395
	cmpl   $0,    %ebx
	jne    _destroy396
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   inheritexception
_destroy395:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy397
	addl   $1,    4(%ecx)
_destroy397:

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest83
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest83:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   72(%eax), %ebx
	call   *%ebx              # _cat_()
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest84
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   nullexception
_nulltest84:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   72(%eax), %ebx
	call   *%ebx              # _cat_()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy398
_destroy399:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy398
	cmpl   $0,    %ebx
	jne    _destroy399
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $587
	movl   $0,    %eax
	call   inheritexception
_destroy398:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy400
	addl   $1,    4(%ecx)
_destroy400:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy401
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy401:
	addl   $4,    %esp
	popl   -8(%ebp)           # res

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 588: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while15
_endwhile15:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 590: if data.size() > 0 then  |
	# |                                                   |
	# \***************************************************/
	pushl  $0

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest85
	pushl  $.stringlit1
	pushl  $590
	movl   $0,    %eax
	call   nullexception
_nulltest85:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if18
	jmp    _else18
_if18:

	# /****************************************************************************\
	# |                                                                            |
	# |  stdlib.floyd, line 591: res := res & data.at(data.size() - 1).toString()  |
	# |                                                                            |
	# \****************************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest86
	pushl  $.stringlit1
	pushl  $591
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
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest87
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   nullexception
_nulltest87:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest88
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   nullexception
_nulltest88:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   16(%eax), %ebx
	call   *%ebx              # toString()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy402
_destroy403:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy402
	cmpl   $0,    %ebx
	jne    _destroy403
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   inheritexception
_destroy402:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy404
	addl   $1,    4(%ecx)
_destroy404:

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest89
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   nullexception
_nulltest89:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   72(%eax), %ebx
	call   *%ebx              # _cat_()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy405
_destroy406:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy405
	cmpl   $0,    %ebx
	jne    _destroy406
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $591
	movl   $0,    %eax
	call   inheritexception
_destroy405:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy407
	addl   $1,    4(%ecx)
_destroy407:
	pushl  -8(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy408
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy408:
	addl   $4,    %esp
	popl   -8(%ebp)           # res
	jmp    _endif18
_else18:
_endif18:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 594: join := res  |
	# |                                       |
	# \***************************************/
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy409
_destroy410:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy409
	cmpl   $0,    %ebx
	jne    _destroy410
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $594
	movl   $0,    %eax
	call   inheritexception
_destroy409:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy411
	addl   $1,    4(%ecx)
_destroy411:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy412
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy412:
	addl   $4,    %esp
	popl   -4(%ebp)           # join

	# Garbage collection (locals)
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy413
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy413:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # data
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy414
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy414:
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
	je     _destroy415
	subl   $1,    4(%eax)
_destroy415:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 597: trim(): String is  |
	# |                                             |
	# \*********************************************/
.global String_trim
	.type  String_trim, @function
String_trim:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $12,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 598: start := 0  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 599: stop := size() - 1  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest90
	pushl  $.stringlit1
	pushl  $599
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
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -12(%ebp)

	# Statement list

	# /****************************************************************************\
	# |                                                                            |
	# |  stdlib.floyd, line 601: loop while start < size() and charAt(start) = 32  |
	# |                                                                            |
	# \****************************************************************************/
_while16:

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest91
	pushl  $.stringlit1
	pushl  $601
	movl   $0,    %eax
	call   nullexception
_nulltest91:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $32

	# Pushing parameters
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest92
	pushl  $.stringlit1
	pushl  $601
	movl   $0,    %eax
	call   nullexception
_nulltest92:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _whilebody16
	jmp    _endwhile16
_whilebody16:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 602: start := start + 1  |
	# |                                              |
	# \**********************************************/
	pushl  -8(%ebp)           # start
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while16
_endwhile16:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 605: loop while stop > 0 and charAt(stop) = 32  |
	# |                                                                     |
	# \*********************************************************************/
_while17:
	pushl  $0
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	pushl  %eax
	pushl  $32

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest93
	pushl  $.stringlit1
	pushl  $605
	movl   $0,    %eax
	call   nullexception
_nulltest93:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
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
	jne    _whilebody17
	jmp    _endwhile17
_whilebody17:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 606: stop := stop - 1  |
	# |                                            |
	# \********************************************/
	pushl  -12(%ebp)          # stop
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while17
_endwhile17:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 609: if start = size() then  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest94
	pushl  $.stringlit1
	pushl  $609
	movl   $0,    %eax
	call   nullexception
_nulltest94:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if19
	jmp    _else19
_if19:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 610: trim := ""  |
	# |                                      |
	# \**************************************/
	.section .rodata
.stringlit19:
	.string ""
.text
	pushl  $Stringvtable
	pushl  $.stringlit19
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy416
_destroy417:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy416
	cmpl   $0,    %ebx
	jne    _destroy417
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $610
	movl   $0,    %eax
	call   inheritexception
_destroy416:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy418
	addl   $1,    4(%ecx)
_destroy418:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy419
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy419:
	addl   $4,    %esp
	popl   -4(%ebp)           # trim
	jmp    _endif19
_else19:

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 612: trim := substring(start, stop - start + 1)  |
	# |                                                                      |
	# \**********************************************************************/

	# Pushing parameters
	pushl  -12(%ebp)          # stop
	movl   -8(%ebp), %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	pushl  %eax
	movl   -8(%ebp), %eax
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest95
	pushl  $.stringlit1
	pushl  $612
	movl   $0,    %eax
	call   nullexception
_nulltest95:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   140(%eax), %ebx
	call   *%ebx              # substring()
	addl   $12,   %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy420
_destroy421:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy420
	cmpl   $0,    %ebx
	jne    _destroy421
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $612
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
	popl   -4(%ebp)           # trim
_endif19:

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

	# Garbage collection (return value)
	movl   -4(%ebp), %eax
	cmpl   $0,    %eax
	je     _destroy424
	subl   $1,    4(%eax)
_destroy424:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 616: _mul_(other: Oyd): Oyd is  |
	# |                                                     |
	# \*****************************************************/
.global String__mul_
	.type  String__mul_, @function
String__mul_:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $20,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 617: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy425
_destroy426:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy425
	cmpl   $0,    %ebx
	jne    _destroy426
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $617
	movl   $0,    %eax
	call   inheritexception
_destroy425:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy427
	addl   $1,    4(%ecx)
_destroy427:
	popl   -8(%ebp)           # tmp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 618: amt := tmp.toInt()  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest96
	pushl  $.stringlit1
	pushl  $618
	movl   $0,    %eax
	call   nullexception
_nulltest96:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   132(%eax), %ebx
	call   *%ebx              # toInt()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 619: res := copy()  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest97
	pushl  $.stringlit1
	pushl  $619
	movl   $0,    %eax
	call   nullexception
_nulltest97:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # copy()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy428
_destroy429:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy428
	cmpl   $0,    %ebx
	jne    _destroy429
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $619
	movl   $0,    %eax
	call   inheritexception
_destroy428:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy430
	addl   $1,    4(%ecx)
_destroy430:
	popl   -16(%ebp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 620: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -20(%ebp)

	# Statement list

	# /********************************************************************\
	# |                                                                    |
	# |  stdlib.floyd, line 622: res.getData().reserve(data.size() * amt)  |
	# |                                                                    |
	# \********************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest98
	pushl  $.stringlit1
	pushl  $622
	movl   $0,    %eax
	call   nullexception
_nulltest98:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %ebx
	popl   %eax
	imull  %ebx,  %eax
	pushl  %eax

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest99
	pushl  $.stringlit1
	pushl  $622
	movl   $0,    %eax
	call   nullexception
_nulltest99:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest100
	pushl  $.stringlit1
	pushl  $622
	movl   $0,    %eax
	call   nullexception
_nulltest100:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # reserve()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy431
	cmpl   $0,    4(%ebx)
	jg     _destroy431
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy431:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 623: loop while idx < amt  |
	# |                                                |
	# \************************************************/
_while18:
	pushl  -12(%ebp)          # amt
	movl   -20(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody18
	jmp    _endwhile18
_whilebody18:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 624: res.getData().insert(data)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # data
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy432
_destroy433:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy432
	cmpl   $0,    %ebx
	jne    _destroy433
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $624
	movl   $0,    %eax
	call   inheritexception
_destroy432:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy434
	addl   $1,    4(%ecx)
_destroy434:

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest101
	pushl  $.stringlit1
	pushl  $624
	movl   $0,    %eax
	call   nullexception
_nulltest101:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # getData()
	addl   $4,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest102
	pushl  $.stringlit1
	pushl  $624
	movl   $0,    %eax
	call   nullexception
_nulltest102:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   112(%eax), %ebx
	call   *%ebx              # insert()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy435
	cmpl   $0,    4(%ebx)
	jg     _destroy435
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy435:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 625: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -20(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -20(%ebp)
	jmp    _while18
_endwhile18:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 628: _mul_ := res  |
	# |                                        |
	# \****************************************/
	pushl  -16(%ebp)          # res
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
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $628
	movl   $0,    %eax
	call   inheritexception
_destroy436:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy438
	addl   $1,    4(%ecx)
_destroy438:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy439
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy439:
	addl   $4,    %esp
	popl   -4(%ebp)           # _mul_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy440
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy440:
	addl   $4,    %esp
	pushl  -16(%ebp)          # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy441
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy441:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy442
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy442:
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
	je     _destroy443
	subl   $1,    4(%eax)
_destroy443:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 641: class Writer is  |
	# |                                           |
	# \*******************************************/
	# ***   ***   ***       **  **
	# ***  *****  ***       **  **
	# ***  *****  ***           **
	# **** ***** **** ***** ** *****  *****   *****
	#  *** ***** ***  ***** ** ***** *******  *****
	#  *** ***** ***  ***** **  **   *** ***  *****
	#  ****** ******  ***   **  **   *******  ***
	#   ***** *****   ***   **  **   *******  ***
	#   ***** *****   **    **  **   ***      **
	#   ***** *****   **    **  **** *******  **
	#    **** ****    **    **  **** *******  **
	#    ***   ***    **    **  ****  *****   **
.global Writerdestroy
	.type  Writerdestroy, @function
Writerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy444
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy444
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy444:
	leave
	ret

.global Writername
	.type  Writername, @function
Writername:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit16, %eax
	leave
	ret

.global Writer_type
	.type  Writer_type, @function
Writer_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 644: writechar(char: int): Writer is  |
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
	# |  stdlib.floyd, line 646: io_write(char)  |
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
	jne    _nulltest103
	pushl  $.stringlit1
	pushl  $646
	movl   $0,    %eax
	call   nullexception
_nulltest103:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 647: writechar := me  |
	# |                                           |
	# \*******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy445
_destroy446:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy445
	cmpl   $0,    %ebx
	jne    _destroy446
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit16
	pushl  $.stringlit1
	pushl  $647
	movl   $0,    %eax
	call   inheritexception
_destroy445:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy447
	addl   $1,    4(%ecx)
_destroy447:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy448
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy448:
	addl   $4,    %esp
	popl   -4(%ebp)           # writechar

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
	je     _destroy449
	subl   $1,    4(%eax)
_destroy449:
	leave
	ret


	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 652: writeintHelper(num: int) is  |
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
	# |  stdlib.floyd, line 653: digit: int  |
	# |                                      |
	# \**************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 655: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushl  12(%ebp)           # num
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	pushl  %eax
	movl   $10,   %ebx
	popl   %eax
	imull  %ebx,  %eax
	movl   %eax,  %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 656: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if20
	jmp    _else20
_if20:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 657: writeintHelper(num / 10)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # num
	movl   $10,   %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest104
	pushl  $.stringlit1
	pushl  $657
	movl   $0,    %eax
	call   nullexception
_nulltest104:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeintHelper()
	addl   $8,    %esp
	jmp    _endif20
_else20:
_endif20:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 659: io_write(digit + 48)  |
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
	jne    _nulltest105
	pushl  $.stringlit1
	pushl  $659
	movl   $0,    %eax
	call   nullexception
_nulltest105:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
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
	# |  stdlib.floyd, line 663: writeint(num: int): Writer is  |
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
	# |  stdlib.floyd, line 665: if (num = 0) then  |
	# |                                             |
	# \*********************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if21
	jmp    _else21
_if21:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 666: io_write(48)  |
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
	jne    _nulltest106
	pushl  $.stringlit1
	pushl  $666
	movl   $0,    %eax
	call   nullexception
_nulltest106:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp
	jmp    _endif21
_else21:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 668: if not (num >= 0) then  |
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
	jne    _if22
	jmp    _else22
_if22:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 669: io_write(45) ~ - symbol  |
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
	jne    _nulltest107
	pushl  $.stringlit1
	pushl  $669
	movl   $0,    %eax
	call   nullexception
_nulltest107:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 670: num := -num  |
	# |                                       |
	# \***************************************/
	movl   12(%ebp), %eax
	negl   %eax
	movl   %eax,  12(%ebp)
	jmp    _endif22
_else22:
_endif22:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 672: writeintHelper(num)  |
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
	jne    _nulltest108
	pushl  $.stringlit1
	pushl  $672
	movl   $0,    %eax
	call   nullexception
_nulltest108:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   88(%eax), %ebx
	call   *%ebx              # writeintHelper()
	addl   $8,    %esp
_endif21:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 675: io_write(13)  |
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
	jne    _nulltest109
	pushl  $.stringlit1
	pushl  $675
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
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 676: io_write(10)  |
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
	jne    _nulltest110
	pushl  $.stringlit1
	pushl  $676
	movl   $0,    %eax
	call   nullexception
_nulltest110:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 678: writeint := me  |
	# |                                          |
	# \******************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy450
_destroy451:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy450
	cmpl   $0,    %ebx
	jne    _destroy451
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit16
	pushl  $.stringlit1
	pushl  $678
	movl   $0,    %eax
	call   inheritexception
_destroy450:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy452
	addl   $1,    4(%ecx)
_destroy452:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy453
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy453:
	addl   $4,    %esp
	popl   -4(%ebp)           # writeint

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
	je     _destroy454
	subl   $1,    4(%eax)
_destroy454:
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 682: write(str: String): Writer is  |
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
	# |  stdlib.floyd, line 683: i := 0  |
	# |                                  |
	# \**********************************/
	movl   $0,    -8(%ebp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 684: len := str.length()  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest111
	pushl  $.stringlit1
	pushl  $684
	movl   $0,    %eax
	call   nullexception
_nulltest111:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # length()
	addl   $4,    %esp
	movl   %eax,  -12(%ebp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 686: loop while not (i >= len)  |
	# |                                                     |
	# \*****************************************************/
_while19:
	pushl  -12(%ebp)          # len
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setge  %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody19
	jmp    _endwhile19
_whilebody19:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 687: io_write(str.charAt(i))  |
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
	jne    _nulltest112
	pushl  $.stringlit1
	pushl  $687
	movl   $0,    %eax
	call   nullexception
_nulltest112:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   120(%eax), %ebx
	call   *%ebx              # charAt()
	addl   $8,    %esp
	pushl  %eax

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest113
	pushl  $.stringlit1
	pushl  $687
	movl   $0,    %eax
	call   nullexception
_nulltest113:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 688: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushl  -8(%ebp)           # i
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while19
_endwhile19:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 691: write := me  |
	# |                                       |
	# \***************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy455
_destroy456:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy455
	cmpl   $0,    %ebx
	jne    _destroy456
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit16
	pushl  $.stringlit1
	pushl  $691
	movl   $0,    %eax
	call   inheritexception
_destroy455:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy457
	addl   $1,    4(%ecx)
_destroy457:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy458
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy458:
	addl   $4,    %esp
	popl   -4(%ebp)           # write

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy459
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy459:
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
	je     _destroy460
	subl   $1,    4(%eax)
_destroy460:
	leave
	ret


	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 695: writeln(str: String): Writer is  |
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
	# |  stdlib.floyd, line 697: write(str)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy461
_destroy462:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy461
	cmpl   $0,    %ebx
	jne    _destroy462
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $697
	movl   $0,    %eax
	call   inheritexception
_destroy461:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy463
	addl   $1,    4(%ecx)
_destroy463:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest114
	pushl  $.stringlit1
	pushl  $697
	movl   $0,    %eax
	call   nullexception
_nulltest114:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy464
	cmpl   $0,    4(%ebx)
	jg     _destroy464
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy464:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 698: io_write(13)  |
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
	jne    _nulltest115
	pushl  $.stringlit1
	pushl  $698
	movl   $0,    %eax
	call   nullexception
_nulltest115:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 699: io_write(10)  |
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
	jne    _nulltest116
	pushl  $.stringlit1
	pushl  $699
	movl   $0,    %eax
	call   nullexception
_nulltest116:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_write()
	addl   $8,    %esp

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 700: writeln := me  |
	# |                                         |
	# \*****************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy465
_destroy466:
	movl   (%ebx), %ebx
	cmpl   $Writervtable, %ebx
	je     _destroy465
	cmpl   $0,    %ebx
	jne    _destroy466
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit16
	pushl  $.stringlit1
	pushl  $700
	movl   $0,    %eax
	call   inheritexception
_destroy465:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy467
	addl   $1,    4(%ecx)
_destroy467:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy468
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy468:
	addl   $4,    %esp
	popl   -4(%ebp)           # writeln

	# Garbage collection (args)
	pushl  12(%ebp)           # str
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy469
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy469:
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
	je     _destroy470
	subl   $1,    4(%eax)
_destroy470:
	leave
	ret


	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 703: writeObject(o: Oyd) is  |
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

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 705: write(o.toString())  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest117
	pushl  $.stringlit1
	pushl  $705
	movl   $0,    %eax
	call   nullexception
_nulltest117:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   16(%eax), %ebx
	call   *%ebx              # toString()
	addl   $4,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy471
_destroy472:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy471
	cmpl   $0,    %ebx
	jne    _destroy472
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $705
	movl   $0,    %eax
	call   inheritexception
_destroy471:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy473
	addl   $1,    4(%ecx)
_destroy473:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest118
	pushl  $.stringlit1
	pushl  $705
	movl   $0,    %eax
	call   nullexception
_nulltest118:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy474
	cmpl   $0,    4(%ebx)
	jg     _destroy474
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy474:

	# Garbage collection (args)
	pushl  12(%ebp)           # o
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy475
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy475:
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


	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 708: writeVector(v: Vector; sep: String) is  |
	# |                                                                  |
	# \******************************************************************/
.global Writer_writeVector
	.type  Writer_writeVector, @function
Writer_writeVector:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 709: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 711: loop while idx < v.size() - 1  |
	# |                                                         |
	# \*********************************************************/
_while20:

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest119
	pushl  $.stringlit1
	pushl  $711
	movl   $0,    %eax
	call   nullexception
_nulltest119:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody20
	jmp    _endwhile20
_whilebody20:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 712: writeObject(v.at(idx))  |
	# |                                                  |
	# \**************************************************/

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
	jne    _nulltest120
	pushl  $.stringlit1
	pushl  $712
	movl   $0,    %eax
	call   nullexception
_nulltest120:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy476
_destroy477:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy476
	cmpl   $0,    %ebx
	jne    _destroy477
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $712
	movl   $0,    %eax
	call   inheritexception
_destroy476:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy478
	addl   $1,    4(%ecx)
_destroy478:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest121
	pushl  $.stringlit1
	pushl  $712
	movl   $0,    %eax
	call   nullexception
_nulltest121:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # writeObject()
	addl   $8,    %esp

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 713: write(sep)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushl  16(%ebp)           # sep
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy479
_destroy480:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy479
	cmpl   $0,    %ebx
	jne    _destroy480
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $713
	movl   $0,    %eax
	call   inheritexception
_destroy479:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy481
	addl   $1,    4(%ecx)
_destroy481:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest122
	pushl  $.stringlit1
	pushl  $713
	movl   $0,    %eax
	call   nullexception
_nulltest122:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy482
	cmpl   $0,    4(%ebx)
	jg     _destroy482
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy482:

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
	jmp    _while20
_endwhile20:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 716: if v.size() > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest123
	pushl  $.stringlit1
	pushl  $716
	movl   $0,    %eax
	call   nullexception
_nulltest123:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if23
	jmp    _else23
_if23:

	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 717: writeObject(v.at(v.size() - 1))  |
	# |                                                           |
	# \***********************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest124
	pushl  $.stringlit1
	pushl  $717
	movl   $0,    %eax
	call   nullexception
_nulltest124:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest125
	pushl  $.stringlit1
	pushl  $717
	movl   $0,    %eax
	call   nullexception
_nulltest125:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy483
_destroy484:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy483
	cmpl   $0,    %ebx
	jne    _destroy484
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
_destroy483:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy485
	addl   $1,    4(%ecx)
_destroy485:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest126
	pushl  $.stringlit1
	pushl  $717
	movl   $0,    %eax
	call   nullexception
_nulltest126:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   104(%eax), %ebx
	call   *%ebx              # writeObject()
	addl   $8,    %esp

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 718: write("\n")  |
	# |                                       |
	# \***************************************/

	# Pushing parameters
	.section .rodata
.stringlit20:
	.string "\n"
.text
	pushl  $Stringvtable
	pushl  $.stringlit20
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy486
_destroy487:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy486
	cmpl   $0,    %ebx
	jne    _destroy487
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $718
	movl   $0,    %eax
	call   inheritexception
_destroy486:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy488
	addl   $1,    4(%ecx)
_destroy488:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest127
	pushl  $.stringlit1
	pushl  $718
	movl   $0,    %eax
	call   nullexception
_nulltest127:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy489
	cmpl   $0,    4(%ebx)
	jg     _destroy489
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy489:
	jmp    _endif23
_else23:
_endif23:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # v
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy490
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy490:
	addl   $4,    %esp
	pushl  16(%ebp)           # sep
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy491
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy491:
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


	# /************************************************************************\
	# |                                                                        |
	# |  stdlib.floyd, line 722: writeIntVector(v: IntVector; sep: String) is  |
	# |                                                                        |
	# \************************************************************************/
.global Writer_writeIntVector
	.type  Writer_writeIntVector, @function
Writer_writeIntVector:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $8,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 723: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -8(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 725: loop while idx < v.size() - 1  |
	# |                                                         |
	# \*********************************************************/
_while21:

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest128
	pushl  $.stringlit1
	pushl  $725
	movl   $0,    %eax
	call   nullexception
_nulltest128:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody21
	jmp    _endwhile21
_whilebody21:

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 726: write(new String.catInt(v.at(idx)))  |
	# |                                                               |
	# \***************************************************************/

	# Pushing parameters

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
	jne    _nulltest129
	pushl  $.stringlit1
	pushl  $726
	movl   $0,    %eax
	call   nullexception
_nulltest129:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
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
	jne    _nulltest130
	pushl  $.stringlit1
	pushl  $726
	movl   $0,    %eax
	call   nullexception
_nulltest130:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy492
_destroy493:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy492
	cmpl   $0,    %ebx
	jne    _destroy493
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $726
	movl   $0,    %eax
	call   inheritexception
_destroy492:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy494
	addl   $1,    4(%ecx)
_destroy494:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest131
	pushl  $.stringlit1
	pushl  $726
	movl   $0,    %eax
	call   nullexception
_nulltest131:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy495
	cmpl   $0,    4(%ebx)
	jg     _destroy495
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy495:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 727: write(sep)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushl  16(%ebp)           # sep
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy496
_destroy497:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy496
	cmpl   $0,    %ebx
	jne    _destroy497
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $727
	movl   $0,    %eax
	call   inheritexception
_destroy496:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy498
	addl   $1,    4(%ecx)
_destroy498:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest132
	pushl  $.stringlit1
	pushl  $727
	movl   $0,    %eax
	call   nullexception
_nulltest132:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # write()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy499
	cmpl   $0,    4(%ebx)
	jg     _destroy499
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy499:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 728: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while21
_endwhile21:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 730: if v.size() > 0 then  |
	# |                                                |
	# \************************************************/
	pushl  $0

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest133
	pushl  $.stringlit1
	pushl  $730
	movl   $0,    %eax
	call   nullexception
_nulltest133:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	popl   %ebx
	cmpl   %ebx,  %eax
	setg   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if24
	jmp    _else24
_if24:

	# /**************************************************************************\
	# |                                                                          |
	# |  stdlib.floyd, line 731: writeln(new String.catInt(v.at(v.size() - 1)))  |
	# |                                                                          |
	# \**************************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest134
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   nullexception
_nulltest134:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   $1,    %ebx
	popl   %eax
	subl   %ebx,  %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest135
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   nullexception
_nulltest135:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
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
	jne    _nulltest136
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   nullexception
_nulltest136:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy500
_destroy501:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy500
	cmpl   $0,    %ebx
	jne    _destroy501
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   inheritexception
_destroy500:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy502
	addl   $1,    4(%ecx)
_destroy502:

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest137
	pushl  $.stringlit1
	pushl  $731
	movl   $0,    %eax
	call   nullexception
_nulltest137:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # writeln()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy503
	cmpl   $0,    4(%ebx)
	jg     _destroy503
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy503:
	jmp    _endif24
_else24:
_endif24:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushl  12(%ebp)           # v
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy504
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy504:
	addl   $4,    %esp
	pushl  16(%ebp)           # sep
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy505
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy505:
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
	# |  stdlib.floyd, line 745: class Reader is  |
	# |                                           |
	# \*******************************************/
	#  *********                           **
	#  **********                          **
	#  **    ****                          **
	#  **      **   *****    ******   *******   *****   *****
	#  **    ****  *******  *******  ********  *******  *****
	#  **********  *** ***  *** ***  ********  *** ***  *****
	#  *********   *******   ******  ***  ***  *******  ***
	#  ** ******   *******  *******  **    **  *******  ***
	#  **   ****   ***      *******  ***  ***  ***      **
	#  **    ****  *******  *******  ********  *******  **
	#  **     **** *******  ******** ********  *******  **
	#  **     ****  *****   ********  *******   *****   **
.global Readerdestroy
	.type  Readerdestroy, @function
Readerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy506
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy506
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy506:
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

.global Reader_type
	.type  Reader_type, @function
Reader_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 747: skipWS(): int is  |
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
	# |  stdlib.floyd, line 748: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest138
	pushl  $.stringlit1
	pushl  $748
	movl   $0,    %eax
	call   nullexception
_nulltest138:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# Statement list

	# /**************************************************************************************\
	# |                                                                                      |
	# |  stdlib.floyd, line 750: loop while char = 10 or char = 13 or char = 32 or char = 8  |
	# |                                                                                      |
	# \**************************************************************************************/
_while22:
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
	pushl  %eax
	pushl  $8
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	orl    %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody22
	jmp    _endwhile22
_whilebody22:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 751: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest139
	pushl  $.stringlit1
	pushl  $751
	movl   $0,    %eax
	call   nullexception
_nulltest139:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while22
_endwhile22:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 753: skipWS := char  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # char
	popl   -4(%ebp)           # skipWS

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
	# |  stdlib.floyd, line 756: readline(): String is  |
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
	# |  stdlib.floyd, line 757: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest140
	pushl  $.stringlit1
	pushl  $757
	movl   $0,    %eax
	call   nullexception
_nulltest140:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 758: s := new String  |
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
	je     _destroy507
_destroy508:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy507
	cmpl   $0,    %ebx
	jne    _destroy508
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $758
	movl   $0,    %eax
	call   inheritexception
_destroy507:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy509
	addl   $1,    4(%ecx)
_destroy509:
	popl   -12(%ebp)          # s

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 760: loop while not (char = 10)  |
	# |                                                      |
	# \******************************************************/
_while23:
	pushl  $10
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	xorl   $1,    %eax
	cmpl   $0,    %eax
	jne    _whilebody23
	jmp    _endwhile23
_whilebody23:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 761: if not (char = 13) then  |
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
	jne    _if25
	jmp    _else25
_if25:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 762: s.appendChar(char)  |
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
	jne    _nulltest141
	pushl  $.stringlit1
	pushl  $762
	movl   $0,    %eax
	call   nullexception
_nulltest141:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy510
	cmpl   $0,    4(%ebx)
	jg     _destroy510
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy510:
	jmp    _endif25
_else25:
_endif25:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 764: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest142
	pushl  $.stringlit1
	pushl  $764
	movl   $0,    %eax
	call   nullexception
_nulltest142:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while23
_endwhile23:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 767: readline := s  |
	# |                                         |
	# \*****************************************/
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy511
_destroy512:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy511
	cmpl   $0,    %ebx
	jne    _destroy512
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $767
	movl   $0,    %eax
	call   inheritexception
_destroy511:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy513
	addl   $1,    4(%ecx)
_destroy513:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy514
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy514:
	addl   $4,    %esp
	popl   -4(%ebp)           # readline

	# Garbage collection (locals)
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy515
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy515:
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
	je     _destroy516
	subl   $1,    4(%eax)
_destroy516:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 770: read(): String is  |
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
	# |  stdlib.floyd, line 771: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest143
	pushl  $.stringlit1
	pushl  $771
	movl   $0,    %eax
	call   nullexception
_nulltest143:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # skipWS()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 772: s := new String  |
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
	je     _destroy517
_destroy518:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy517
	cmpl   $0,    %ebx
	jne    _destroy518
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $772
	movl   $0,    %eax
	call   inheritexception
_destroy517:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy519
	addl   $1,    4(%ecx)
_destroy519:
	popl   -12(%ebp)          # s

	# Statement list

	# /*********************************************************************************************\
	# |                                                                                             |
	# |  stdlib.floyd, line 774: loop while char != 10 and char != 13 and char != 32 and char != 8  |
	# |                                                                                             |
	# \*********************************************************************************************/
_while24:
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
	pushl  %eax
	pushl  $8
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setne  %al
	movzbl %al,   %eax
	movl   %eax,  %ebx
	popl   %eax
	andl   %ebx,  %eax
	cmpl   $0,    %eax
	jne    _whilebody24
	jmp    _endwhile24
_whilebody24:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 775: s.appendChar(char)  |
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
	jne    _nulltest144
	pushl  $.stringlit1
	pushl  $775
	movl   $0,    %eax
	call   nullexception
_nulltest144:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   96(%eax), %ebx
	call   *%ebx              # appendChar()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy520
	cmpl   $0,    4(%ebx)
	jg     _destroy520
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy520:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 776: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest145
	pushl  $.stringlit1
	pushl  $776
	movl   $0,    %eax
	call   nullexception
_nulltest145:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)
	jmp    _while24
_endwhile24:

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 779: read := s  |
	# |                                     |
	# \*************************************/
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy521
_destroy522:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy521
	cmpl   $0,    %ebx
	jne    _destroy522
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $779
	movl   $0,    %eax
	call   inheritexception
_destroy521:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy523
	addl   $1,    4(%ecx)
_destroy523:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy524
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy524:
	addl   $4,    %esp
	popl   -4(%ebp)           # read

	# Garbage collection (locals)
	pushl  -12(%ebp)          # s
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy525
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy525:
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
	je     _destroy526
	subl   $1,    4(%eax)
_destroy526:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 782: readint(): int is  |
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
	# |  stdlib.floyd, line 783: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest146
	pushl  $.stringlit1
	pushl  $783
	movl   $0,    %eax
	call   nullexception
_nulltest146:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # skipWS()
	addl   $4,    %esp
	movl   %eax,  -8(%ebp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 784: mult := 1  |
	# |                                     |
	# \*************************************/
	movl   $1,    -12(%ebp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 785: num := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 787: if char = 45 then  |
	# |                                             |
	# \*********************************************/
	pushl  $45
	movl   -8(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if26
	jmp    _else26
_if26:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 788: mult := -1  |
	# |                                      |
	# \**************************************/
	movl   $-1,   -12(%ebp)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 789: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest147
	pushl  $.stringlit1
	pushl  $789
	movl   $0,    %eax
	call   nullexception
_nulltest147:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	pushl  %eax
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _endif26
_else26:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 791: char := char - 48  |
	# |                                             |
	# \*********************************************/
	pushl  -8(%ebp)           # char
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
_endif26:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 794: loop while char >= 0 and not (char >= 10)  |
	# |                                                                     |
	# \*********************************************************************/
_while25:
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
	jne    _whilebody25
	jmp    _endwhile25
_whilebody25:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 795: num := num * 10 + char  |
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
	# |  stdlib.floyd, line 796: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest148
	pushl  $.stringlit1
	pushl  $796
	movl   $0,    %eax
	call   nullexception
_nulltest148:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # io_read()
	addl   $4,    %esp
	pushl  %eax
	movl   $48,   %ebx
	popl   %eax
	subl   %ebx,  %eax
	movl   %eax,  -8(%ebp)
	jmp    _while25
_endwhile25:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 799: readint := num * mult  |
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
	# |  stdlib.floyd, line 811: class Integer is  |
	# |                                            |
	# \********************************************/
	#  **            **
	#  **            **
	#  **            **
	#  **  ******** *****  *****    *******   *****   *****
	#  **  ******** ***** *******  ********  *******  *****
	#  **  ********  **   *** ***  ********  *** ***  *****
	#  **  ***  ***  **   *******  ***  ***  *******  ***
	#  **  **    **  **   *******  **    **  *******  ***
	#  **  **    **  **   ***      ***  ***  ***      **
	#  **  **    **  **** *******  ********  *******  **
	#  **  **    **  **** *******  ********  *******  **
	#  **  **    **  ****  *****    *******   *****   **
	#                              *** ****
	#                              ********
	#                              *******
.global Integerinit
	.type  Integerinit, @function
Integerinit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 812: _val := 0  |
	# |                                     |
	# \*************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # _val
	leave
	ret

.global Integerdestroy
	.type  Integerdestroy, @function
Integerdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy527
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy527
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy527:
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

.global Integer_type
	.type  Integer_type, @function
Integer_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 814: init(newVal: int): Integer is  |
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
	# |  stdlib.floyd, line 816: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newVal
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # _val

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 817: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy528
_destroy529:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy528
	cmpl   $0,    %ebx
	jne    _destroy529
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $817
	movl   $0,    %eax
	call   inheritexception
_destroy528:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy530
	addl   $1,    4(%ecx)
_destroy530:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy531
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy531:
	addl   $4,    %esp
	popl   -4(%ebp)           # init

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
	je     _destroy532
	subl   $1,    4(%eax)
_destroy532:
	leave
	ret


	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 820: toString(): String is  |
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
	# |  stdlib.floyd, line 822: toString := new String.catInt(_val)  |
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
	jne    _nulltest149
	pushl  $.stringlit1
	pushl  $822
	movl   $0,    %eax
	call   nullexception
_nulltest149:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy533
_destroy534:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy533
	cmpl   $0,    %ebx
	jne    _destroy534
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $822
	movl   $0,    %eax
	call   inheritexception
_destroy533:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy535
	addl   $1,    4(%ecx)
_destroy535:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy536
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy536:
	addl   $4,    %esp
	popl   -4(%ebp)           # toString

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
	je     _destroy537
	subl   $1,    4(%eax)
_destroy537:
	leave
	ret


	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 825: val(): int is  |
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
	# |  stdlib.floyd, line 827: val := _val  |
	# |                                       |
	# \***************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val
	popl   -4(%ebp)           # val

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
	# |  stdlib.floyd, line 830: _lt_(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 831: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy538
_destroy539:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy538
	cmpl   $0,    %ebx
	jne    _destroy539
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $831
	movl   $0,    %eax
	call   inheritexception
_destroy538:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy540
	addl   $1,    4(%ecx)
_destroy540:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 833: _lt_ := _val < tmp.val()  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest150
	pushl  $.stringlit1
	pushl  $833
	movl   $0,    %eax
	call   nullexception
_nulltest150:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	je     _destroy541
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy541:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy542
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy542:
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
	# |  stdlib.floyd, line 836: eq(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 837: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy543
_destroy544:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy543
	cmpl   $0,    %ebx
	jne    _destroy544
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $837
	movl   $0,    %eax
	call   inheritexception
_destroy543:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy545
	addl   $1,    4(%ecx)
_destroy545:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 839: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest151
	pushl  $.stringlit1
	pushl  $839
	movl   $0,    %eax
	call   nullexception
_nulltest151:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	je     _destroy546
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy546:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy547
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy547:
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
	# |  stdlib.floyd, line 842: _and_(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 843: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy548
_destroy549:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy548
	cmpl   $0,    %ebx
	jne    _destroy549
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $843
	movl   $0,    %eax
	call   inheritexception
_destroy548:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy550
	addl   $1,    4(%ecx)
_destroy550:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 845: _and_ := _val != 0 and tmp.val() != 0  |
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
	jne    _nulltest152
	pushl  $.stringlit1
	pushl  $845
	movl   $0,    %eax
	call   nullexception
_nulltest152:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	je     _destroy551
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy551:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy552
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy552:
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
	# |  stdlib.floyd, line 848: _or_(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 849: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy553
_destroy554:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy553
	cmpl   $0,    %ebx
	jne    _destroy554
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $849
	movl   $0,    %eax
	call   inheritexception
_destroy553:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy555
	addl   $1,    4(%ecx)
_destroy555:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 851: _or_ := _val != 0 or tmp.val() != 0  |
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
	jne    _nulltest153
	pushl  $.stringlit1
	pushl  $851
	movl   $0,    %eax
	call   nullexception
_nulltest153:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	je     _destroy556
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy556:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy557
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy557:
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
	# |  stdlib.floyd, line 854: _add_(other: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 855: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy558
_destroy559:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy558
	cmpl   $0,    %ebx
	jne    _destroy559
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $855
	movl   $0,    %eax
	call   inheritexception
_destroy558:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy560
	addl   $1,    4(%ecx)
_destroy560:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 857: _add_ := new Integer.init(_val + tmp.val())  |
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
	jne    _nulltest154
	pushl  $.stringlit1
	pushl  $857
	movl   $0,    %eax
	call   nullexception
_nulltest154:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	jne    _nulltest155
	pushl  $.stringlit1
	pushl  $857
	movl   $0,    %eax
	call   nullexception
_nulltest155:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy561
_destroy562:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy561
	cmpl   $0,    %ebx
	jne    _destroy562
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $857
	movl   $0,    %eax
	call   inheritexception
_destroy561:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy563
	addl   $1,    4(%ecx)
_destroy563:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy564
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy564:
	addl   $4,    %esp
	popl   -4(%ebp)           # _add_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy565
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy565:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy566
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy566:
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
	je     _destroy567
	subl   $1,    4(%eax)
_destroy567:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 860: _sub_(other: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 861: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy568
_destroy569:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy568
	cmpl   $0,    %ebx
	jne    _destroy569
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $861
	movl   $0,    %eax
	call   inheritexception
_destroy568:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy570
	addl   $1,    4(%ecx)
_destroy570:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 863: _sub_ := new Integer.init(_val - tmp.val())  |
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
	jne    _nulltest156
	pushl  $.stringlit1
	pushl  $863
	movl   $0,    %eax
	call   nullexception
_nulltest156:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	jne    _nulltest157
	pushl  $.stringlit1
	pushl  $863
	movl   $0,    %eax
	call   nullexception
_nulltest157:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy571
_destroy572:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy571
	cmpl   $0,    %ebx
	jne    _destroy572
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $863
	movl   $0,    %eax
	call   inheritexception
_destroy571:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy573
	addl   $1,    4(%ecx)
_destroy573:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy574
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy574:
	addl   $4,    %esp
	popl   -4(%ebp)           # _sub_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy575
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy575:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy576
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy576:
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
	je     _destroy577
	subl   $1,    4(%eax)
_destroy577:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 866: _mul_(other: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 867: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy578
_destroy579:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy578
	cmpl   $0,    %ebx
	jne    _destroy579
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $867
	movl   $0,    %eax
	call   inheritexception
_destroy578:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy580
	addl   $1,    4(%ecx)
_destroy580:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 869: _mul_ := new Integer.init(_val * tmp.val())  |
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
	jne    _nulltest158
	pushl  $.stringlit1
	pushl  $869
	movl   $0,    %eax
	call   nullexception
_nulltest158:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	jne    _nulltest159
	pushl  $.stringlit1
	pushl  $869
	movl   $0,    %eax
	call   nullexception
_nulltest159:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # init()
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
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $869
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
	popl   -4(%ebp)           # _mul_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy585
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy585:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy586
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy586:
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
	je     _destroy587
	subl   $1,    4(%eax)
_destroy587:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 872: _div_(other: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 873: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy588
_destroy589:
	movl   (%ebx), %ebx
	cmpl   $Integervtable, %ebx
	je     _destroy588
	cmpl   $0,    %ebx
	jne    _destroy589
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit7
	pushl  $.stringlit1
	pushl  $873
	movl   $0,    %eax
	call   inheritexception
_destroy588:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy590
	addl   $1,    4(%ecx)
_destroy590:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 875: _div_ := new Integer.init(_val / tmp.val())  |
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
	jne    _nulltest160
	pushl  $.stringlit1
	pushl  $875
	movl   $0,    %eax
	call   nullexception
_nulltest160:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # val()
	addl   $4,    %esp
	movl   %eax,  %ebx
	popl   %eax
	pushl  %edx
	movl   $0,    %edx
	idivl  %ebx
	popl   %edx
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
	jne    _nulltest161
	pushl  $.stringlit1
	pushl  $875
	movl   $0,    %eax
	call   nullexception
_nulltest161:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy591
_destroy592:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy591
	cmpl   $0,    %ebx
	jne    _destroy592
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $875
	movl   $0,    %eax
	call   inheritexception
_destroy591:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy593
	addl   $1,    4(%ecx)
_destroy593:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy594
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy594:
	addl   $4,    %esp
	popl   -4(%ebp)           # _div_

	# Garbage collection (locals)
	pushl  -8(%ebp)           # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy595
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy595:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy596
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy596:
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
	je     _destroy597
	subl   $1,    4(%eax)
_destroy597:
	leave
	ret


	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 885: class Boolean is  |
	# |                                            |
	# \********************************************/
	#  ********                        **
	#  *********                       **
	#  **   ****                       **
	#  **     **    ******    ******   **   *****    ******  ********
	#  **   ****   ********  ********  **  *******  *******  ********
	#  *********   ********  ********  **  *** ***  *** ***  ********
	#  **********  ***  ***  ***  ***  **  *******   ******  ***  ***
	#  **   *****  **    **  **    **  **  *******  *******  **    **
	#  **      **  ***  ***  ***  ***  **  ***      *******  **    **
	#  **    ****  ********  ********  **  *******  *******  **    **
	#  **********  ********  ********  **  *******  ******** **    **
	#  *********    ******    ******   **   *****   ******** **    **
.global Booleaninit
	.type  Booleaninit, @function
Booleaninit:
	pushl  %ebp
	movl   %esp,  %ebp

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 886: _val := false  |
	# |                                         |
	# \*****************************************/
	pushl  $0
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # _val
	leave
	ret

.global Booleandestroy
	.type  Booleandestroy, @function
Booleandestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy598
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy598
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy598:
	leave
	ret

.global Booleanname
	.type  Booleanname, @function
Booleanname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit12, %eax
	leave
	ret

.global Boolean_type
	.type  Boolean_type, @function
Boolean_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 888: init(newVal: boolean): Boolean is  |
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
	# |  stdlib.floyd, line 890: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newVal
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # _val

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 891: init := me  |
	# |                                      |
	# \**************************************/
	pushl  8(%ebp)
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy599
_destroy600:
	movl   (%ebx), %ebx
	cmpl   $Booleanvtable, %ebx
	je     _destroy599
	cmpl   $0,    %ebx
	jne    _destroy600
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit12
	pushl  $.stringlit1
	pushl  $891
	movl   $0,    %eax
	call   inheritexception
_destroy599:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy601
	addl   $1,    4(%ecx)
_destroy601:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy602
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy602:
	addl   $4,    %esp
	popl   -4(%ebp)           # init

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
	je     _destroy603
	subl   $1,    4(%eax)
_destroy603:
	leave
	ret


	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 894: val(): boolean is  |
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
	# |  stdlib.floyd, line 896: val := _val  |
	# |                                       |
	# \***************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # _val
	popl   -4(%ebp)           # val

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
	# |  stdlib.floyd, line 899: toString(): String is  |
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
	# |  stdlib.floyd, line 901: if _val then  |
	# |                                        |
	# \****************************************/
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	cmpl   $0,    %eax
	jne    _if27
	jmp    _else27
_if27:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 902: toString := "true"  |
	# |                                              |
	# \**********************************************/
	.section .rodata
.stringlit21:
	.string "true"
.text
	pushl  $Stringvtable
	pushl  $.stringlit21
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy604
_destroy605:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy604
	cmpl   $0,    %ebx
	jne    _destroy605
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $902
	movl   $0,    %eax
	call   inheritexception
_destroy604:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy606
	addl   $1,    4(%ecx)
_destroy606:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy607
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy607:
	addl   $4,    %esp
	popl   -4(%ebp)           # toString
	jmp    _endif27
_else27:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 904: toString := "false"  |
	# |                                               |
	# \***********************************************/
	.section .rodata
.stringlit22:
	.string "false"
.text
	pushl  $Stringvtable
	pushl  $.stringlit22
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy608
_destroy609:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy608
	cmpl   $0,    %ebx
	jne    _destroy609
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $904
	movl   $0,    %eax
	call   inheritexception
_destroy608:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy610
	addl   $1,    4(%ecx)
_destroy610:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy611
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy611:
	addl   $4,    %esp
	popl   -4(%ebp)           # toString
_endif27:

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
	je     _destroy612
	subl   $1,    4(%eax)
_destroy612:
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 908: eq(other: Oyd): boolean is  |
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
	# |  stdlib.floyd, line 909: tmp: Boolean := other  |
	# |                                                 |
	# \*************************************************/
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy613
_destroy614:
	movl   (%ebx), %ebx
	cmpl   $Booleanvtable, %ebx
	je     _destroy613
	cmpl   $0,    %ebx
	jne    _destroy614
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit12
	pushl  $.stringlit1
	pushl  $909
	movl   $0,    %eax
	call   inheritexception
_destroy613:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy615
	addl   $1,    4(%ecx)
_destroy615:
	popl   -8(%ebp)           # tmp

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 911: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest162
	pushl  $.stringlit1
	pushl  $911
	movl   $0,    %eax
	call   nullexception
_nulltest162:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
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
	je     _destroy616
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy616:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # other
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy617
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy617:
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


	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 921: class Map is  |
	# |                                        |
	# \****************************************/
	#  ****   ****
	#  ****   ****
	#  ****   ****
	#  ***** *****   ******  *******
	#  ***** *****  *******  ********
	#  ***** *****  *** ***  ********
	#  ** ***** **   ******  ***  ***
	#  ** ***** **  *******  **    **
	#  ** ***** **  *******  ***  ***
	#  ** ***** **  *******  ********
	#  **  ***  **  ******** ********
	#  **  ***  **  ******** *******
	#                        **
	#                        **
	#                        **
.global Mapdestroy
	.type  Mapdestroy, @function
Mapdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy618
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy618
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   16(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy619
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy619:
	movl   8(%ebp), %ebx
	movl   20(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy620
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy620:
	movl   8(%ebp), %ebx
	movl   24(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy621
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy621:
	movl   8(%ebp), %ebx
	movl   28(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy622
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy622:
	call   destroyobject
	addl   $4,    %esp
_destroy618:
	leave
	ret

.global Mapname
	.type  Mapname, @function
Mapname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit14, %eax
	leave
	ret

.global Map_type
	.type  Map_type, @function
Map_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 927: insert(newKey: Oyd; newValue: Oyd) is  |
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
	# |  stdlib.floyd, line 929: if newKey = null then  |
	# |                                                 |
	# \*************************************************/
	pushl  $0
	movl   12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	sete   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _if28
	jmp    _else28
_if28:
	jmp    _endif28
_else28:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 931: if _key = null then  |
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
	jne    _if29
	jmp    _else29
_if29:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 932: _key := newKey  |
	# |                                          |
	# \******************************************/
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy623
_destroy624:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy623
	cmpl   $0,    %ebx
	jne    _destroy624
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $932
	movl   $0,    %eax
	call   inheritexception
_destroy623:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy625
	addl   $1,    4(%ecx)
_destroy625:
	movl   8(%ebp), %ecx
	pushl  24(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy626
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy626:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   24(%ecx)           # _key

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 933: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy627
_destroy628:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy627
	cmpl   $0,    %ebx
	jne    _destroy628
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $933
	movl   $0,    %eax
	call   inheritexception
_destroy627:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy629
	addl   $1,    4(%ecx)
_destroy629:
	movl   8(%ebp), %ecx
	pushl  28(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy630
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy630:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   28(%ecx)           # _value
	jmp    _endif29
_else29:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 935: if newKey < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy631
_destroy632:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy631
	cmpl   $0,    %ebx
	jne    _destroy632
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $935
	movl   $0,    %eax
	call   inheritexception
_destroy631:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy633
	addl   $1,    4(%ecx)
_destroy633:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest163
	pushl  $.stringlit1
	pushl  $935
	movl   $0,    %eax
	call   nullexception
_nulltest163:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   32(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if30
	jmp    _else30
_if30:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 936: if _left = null then  |
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
	jne    _if31
	jmp    _else31
_if31:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 937: _left := new Map  |
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
	je     _destroy634
_destroy635:
	movl   (%ebx), %ebx
	cmpl   $Mapvtable, %ebx
	je     _destroy634
	cmpl   $0,    %ebx
	jne    _destroy635
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit14
	pushl  $.stringlit1
	pushl  $937
	movl   $0,    %eax
	call   inheritexception
_destroy634:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy636
	addl   $1,    4(%ecx)
_destroy636:
	movl   8(%ebp), %ecx
	pushl  16(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy637
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy637:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   16(%ecx)           # _left
	jmp    _endif31
_else31:
_endif31:

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 939: _left.insert(newKey, newValue)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy638
_destroy639:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy638
	cmpl   $0,    %ebx
	jne    _destroy639
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $939
	movl   $0,    %eax
	call   inheritexception
_destroy638:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy640
	addl   $1,    4(%ecx)
_destroy640:
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy641
_destroy642:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy641
	cmpl   $0,    %ebx
	jne    _destroy642
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $939
	movl   $0,    %eax
	call   inheritexception
_destroy641:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy643
	addl   $1,    4(%ecx)
_destroy643:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest164
	pushl  $.stringlit1
	pushl  $939
	movl   $0,    %eax
	call   nullexception
_nulltest164:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # insert()
	addl   $12,   %esp
	jmp    _endif30
_else30:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 941: if newKey > _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy644
_destroy645:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy644
	cmpl   $0,    %ebx
	jne    _destroy645
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $941
	movl   $0,    %eax
	call   inheritexception
_destroy644:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy646
	addl   $1,    4(%ecx)
_destroy646:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest165
	pushl  $.stringlit1
	pushl  $941
	movl   $0,    %eax
	call   nullexception
_nulltest165:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   44(%eax), %ebx
	call   *%ebx              # _gt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if32
	jmp    _else32
_if32:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 942: if _right = null then  |
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
	jne    _if33
	jmp    _else33
_if33:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 943: _right := new Map  |
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
	je     _destroy647
_destroy648:
	movl   (%ebx), %ebx
	cmpl   $Mapvtable, %ebx
	je     _destroy647
	cmpl   $0,    %ebx
	jne    _destroy648
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit14
	pushl  $.stringlit1
	pushl  $943
	movl   $0,    %eax
	call   inheritexception
_destroy647:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy649
	addl   $1,    4(%ecx)
_destroy649:
	movl   8(%ebp), %ecx
	pushl  20(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy650
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy650:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   20(%ecx)           # _right
	jmp    _endif33
_else33:
_endif33:

	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 945: _right.insert(newKey, newValue)  |
	# |                                                           |
	# \***********************************************************/

	# Pushing parameters
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy651
_destroy652:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy651
	cmpl   $0,    %ebx
	jne    _destroy652
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $945
	movl   $0,    %eax
	call   inheritexception
_destroy651:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy653
	addl   $1,    4(%ecx)
_destroy653:
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy654
_destroy655:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy654
	cmpl   $0,    %ebx
	jne    _destroy655
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $945
	movl   $0,    %eax
	call   inheritexception
_destroy654:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy656
	addl   $1,    4(%ecx)
_destroy656:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest166
	pushl  $.stringlit1
	pushl  $945
	movl   $0,    %eax
	call   nullexception
_nulltest166:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # insert()
	addl   $12,   %esp
	jmp    _endif32
_else32:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 947: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy657
_destroy658:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy657
	cmpl   $0,    %ebx
	jne    _destroy658
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $947
	movl   $0,    %eax
	call   inheritexception
_destroy657:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy659
	addl   $1,    4(%ecx)
_destroy659:
	movl   8(%ebp), %ecx
	pushl  28(%ecx)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy660
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy660:
	addl   $4,    %esp
	movl   8(%ebp), %ecx
	popl   28(%ecx)           # _value
_endif32:
_endif30:
_endif29:
_endif28:

	# Garbage collection (args)
	pushl  12(%ebp)           # newKey
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy661
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy661:
	addl   $4,    %esp
	pushl  16(%ebp)           # newValue
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy662
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy662:
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
	# |  stdlib.floyd, line 954: get(target: Oyd): Oyd is  |
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
	# |  stdlib.floyd, line 956: if _key = null or target = null then  |
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
	jne    _if34
	jmp    _else34
_if34:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 957: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy663
_destroy664:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy663
	cmpl   $0,    %ebx
	jne    _destroy664
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $957
	movl   $0,    %eax
	call   inheritexception
_destroy663:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy665
	addl   $1,    4(%ecx)
_destroy665:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy666
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy666:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
	jmp    _endif34
_else34:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 959: if _key.eq(target) then  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy667
_destroy668:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy667
	cmpl   $0,    %ebx
	jne    _destroy668
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $959
	movl   $0,    %eax
	call   inheritexception
_destroy667:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy669
	addl   $1,    4(%ecx)
_destroy669:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   24(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest167
	pushl  $.stringlit1
	pushl  $959
	movl   $0,    %eax
	call   nullexception
_nulltest167:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   24(%eax), %ebx
	call   *%ebx              # eq()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if35
	jmp    _else35
_if35:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 960: get := _value  |
	# |                                         |
	# \*****************************************/
	movl   8(%ebp), %ebx
	pushl  28(%ebx)           # _value
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy670
_destroy671:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy670
	cmpl   $0,    %ebx
	jne    _destroy671
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $960
	movl   $0,    %eax
	call   inheritexception
_destroy670:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy672
	addl   $1,    4(%ecx)
_destroy672:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy673
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy673:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
	jmp    _endif35
_else35:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 962: if target < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	pushl  24(%ebx)           # _key
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy674
_destroy675:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy674
	cmpl   $0,    %ebx
	jne    _destroy675
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $962
	movl   $0,    %eax
	call   inheritexception
_destroy674:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy676
	addl   $1,    4(%ecx)
_destroy676:

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest168
	pushl  $.stringlit1
	pushl  $962
	movl   $0,    %eax
	call   nullexception
_nulltest168:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   32(%eax), %ebx
	call   *%ebx              # _lt_()
	addl   $8,    %esp
	cmpl   $0,    %eax
	jne    _if36
	jmp    _else36
_if36:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 963: if _left = null then  |
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
	jne    _if37
	jmp    _else37
_if37:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 964: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy677
_destroy678:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy677
	cmpl   $0,    %ebx
	jne    _destroy678
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $964
	movl   $0,    %eax
	call   inheritexception
_destroy677:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy679
	addl   $1,    4(%ecx)
_destroy679:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy680
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy680:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
	jmp    _endif37
_else37:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 966: get := _left.get(target)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy681
_destroy682:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy681
	cmpl   $0,    %ebx
	jne    _destroy682
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $966
	movl   $0,    %eax
	call   inheritexception
_destroy681:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy683
	addl   $1,    4(%ecx)
_destroy683:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest169
	pushl  $.stringlit1
	pushl  $966
	movl   $0,    %eax
	call   nullexception
_nulltest169:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # get()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy684
_destroy685:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy684
	cmpl   $0,    %ebx
	jne    _destroy685
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $966
	movl   $0,    %eax
	call   inheritexception
_destroy684:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy686
	addl   $1,    4(%ecx)
_destroy686:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy687
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy687:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
_endif37:
	jmp    _endif36
_else36:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 969: if _right = null then  |
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
	jne    _if38
	jmp    _else38
_if38:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 970: get := null  |
	# |                                       |
	# \***************************************/
	pushl  $0
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy688
_destroy689:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy688
	cmpl   $0,    %ebx
	jne    _destroy689
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $970
	movl   $0,    %eax
	call   inheritexception
_destroy688:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy690
	addl   $1,    4(%ecx)
_destroy690:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy691
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy691:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
	jmp    _endif38
_else38:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 972: get := _right.get(target)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy692
_destroy693:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy692
	cmpl   $0,    %ebx
	jne    _destroy693
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $972
	movl   $0,    %eax
	call   inheritexception
_destroy692:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy694
	addl   $1,    4(%ecx)
_destroy694:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest170
	pushl  $.stringlit1
	pushl  $972
	movl   $0,    %eax
	call   nullexception
_nulltest170:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   84(%eax), %ebx
	call   *%ebx              # get()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy695
_destroy696:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy695
	cmpl   $0,    %ebx
	jne    _destroy696
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $972
	movl   $0,    %eax
	call   inheritexception
_destroy695:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy697
	addl   $1,    4(%ecx)
_destroy697:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy698
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy698:
	addl   $4,    %esp
	popl   -4(%ebp)           # get
_endif38:
_endif36:
_endif35:
_endif34:

	# Garbage collection (args)
	pushl  12(%ebp)           # target
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy699
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy699:
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
	je     _destroy700
	subl   $1,    4(%eax)
_destroy700:
	leave
	ret


	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 988: class Mapper is  |
	# |                                           |
	# \*******************************************/
	#  ****   ****
	#  ****   ****
	#  ****   ****
	#  ***** *****   ******  *******   *******    *****   *****
	#  ***** *****  *******  ********  ********  *******  *****
	#  ***** *****  *** ***  ********  ********  *** ***  *****
	#  ** ***** **   ******  ***  ***  ***  ***  *******  ***
	#  ** ***** **  *******  **    **  **    **  *******  ***
	#  ** ***** **  *******  ***  ***  ***  ***  ***      **
	#  ** ***** **  *******  ********  ********  *******  **
	#  **  ***  **  ******** ********  ********  *******  **
	#  **  ***  **  ******** *******   *******    *****   **
	#                        **        **
	#                        **        **
	#                        **        **
.global Mapperdestroy
	.type  Mapperdestroy, @function
Mapperdestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy701
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy701
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy701:
	leave
	ret

.global Mappername
	.type  Mappername, @function
Mappername:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit9, %eax
	leave
	ret

.global Mapper_type
	.type  Mapper_type, @function
Mapper_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 991: mapInt(data: Vector): IntVector is  |
	# |                                                              |
	# \**************************************************************/
.global Mapper_mapInt
	.type  Mapper_mapInt, @function
Mapper_mapInt:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 992: res := new IntVector.reserve(data.size())  |
	# |                                                                     |
	# \*********************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest171
	pushl  $.stringlit1
	pushl  $992
	movl   $0,    %eax
	call   nullexception
_nulltest171:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax

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
	jne    _nulltest172
	pushl  $.stringlit1
	pushl  $992
	movl   $0,    %eax
	call   nullexception
_nulltest172:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # reserve()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy702
_destroy703:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy702
	cmpl   $0,    %ebx
	jne    _destroy703
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $992
	movl   $0,    %eax
	call   inheritexception
_destroy702:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy704
	addl   $1,    4(%ecx)
_destroy704:
	popl   -8(%ebp)           # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 993: idx := 0  |
	# |                                    |
	# \************************************/
	movl   $0,    -12(%ebp)

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 994: tmp: String  |
	# |                                       |
	# \***************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 996: loop while idx < data.size()  |
	# |                                                        |
	# \********************************************************/
_while26:

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest173
	pushl  $.stringlit1
	pushl  $996
	movl   $0,    %eax
	call   nullexception
_nulltest173:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody26
	jmp    _endwhile26
_whilebody26:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 997: tmp := data.at(idx)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest174
	pushl  $.stringlit1
	pushl  $997
	movl   $0,    %eax
	call   nullexception
_nulltest174:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy705
_destroy706:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy705
	cmpl   $0,    %ebx
	jne    _destroy706
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $997
	movl   $0,    %eax
	call   inheritexception
_destroy705:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy707
	addl   $1,    4(%ecx)
_destroy707:
	pushl  -16(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy708
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy708:
	addl   $4,    %esp
	popl   -16(%ebp)          # tmp

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 998: res.push_back(tmp.toInt())  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest175
	pushl  $.stringlit1
	pushl  $998
	movl   $0,    %eax
	call   nullexception
_nulltest175:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   132(%eax), %ebx
	call   *%ebx              # toInt()
	addl   $4,    %esp
	pushl  %eax

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest176
	pushl  $.stringlit1
	pushl  $998
	movl   $0,    %eax
	call   nullexception
_nulltest176:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy709
	cmpl   $0,    4(%ebx)
	jg     _destroy709
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy709:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 999: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while26
_endwhile26:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 1002: mapInt := res  |
	# |                                          |
	# \******************************************/
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy710
_destroy711:
	movl   (%ebx), %ebx
	cmpl   $IntVectorvtable, %ebx
	je     _destroy710
	cmpl   $0,    %ebx
	jne    _destroy711
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit3
	pushl  $.stringlit1
	pushl  $1002
	movl   $0,    %eax
	call   inheritexception
_destroy710:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy712
	addl   $1,    4(%ecx)
_destroy712:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy713
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy713:
	addl   $4,    %esp
	popl   -4(%ebp)           # mapInt

	# Garbage collection (locals)
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy714
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy714:
	addl   $4,    %esp
	pushl  -16(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy715
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy715:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # data
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy716
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy716:
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
	je     _destroy717
	subl   $1,    4(%eax)
_destroy717:
	leave
	ret


	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 1005: mapInteger(data: Vector): Vector is  |
	# |                                                                |
	# \****************************************************************/
.global Mapper_mapInteger
	.type  Mapper_mapInteger, @function
Mapper_mapInteger:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $16,   %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# /*******************************************************************\
	# |                                                                   |
	# |  stdlib.floyd, line 1006: res := new Vector.reserve(data.size())  |
	# |                                                                   |
	# \*******************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest177
	pushl  $.stringlit1
	pushl  $1006
	movl   $0,    %eax
	call   nullexception
_nulltest177:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax

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
	jne    _nulltest178
	pushl  $.stringlit1
	pushl  $1006
	movl   $0,    %eax
	call   nullexception
_nulltest178:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   100(%eax), %ebx
	call   *%ebx              # reserve()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy718
_destroy719:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy718
	cmpl   $0,    %ebx
	jne    _destroy719
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $1006
	movl   $0,    %eax
	call   inheritexception
_destroy718:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy720
	addl   $1,    4(%ecx)
_destroy720:
	popl   -8(%ebp)           # res

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 1007: idx := 0  |
	# |                                     |
	# \*************************************/
	movl   $0,    -12(%ebp)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 1008: tmp: String  |
	# |                                        |
	# \****************************************/
	movl   $0,    -16(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 1010: loop while idx < data.size()  |
	# |                                                         |
	# \*********************************************************/
_while27:

	# Pushing parameters

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest179
	pushl  $.stringlit1
	pushl  $1010
	movl   $0,    %eax
	call   nullexception
_nulltest179:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # size()
	addl   $4,    %esp
	pushl  %eax
	movl   -12(%ebp), %eax
	popl   %ebx
	cmpl   %ebx,  %eax
	setl   %al
	movzbl %al,   %eax
	cmpl   $0,    %eax
	jne    _whilebody27
	jmp    _endwhile27
_whilebody27:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 1011: tmp := data.at(idx)  |
	# |                                                |
	# \************************************************/

	# Pushing parameters
	movl   -12(%ebp), %eax
	pushl  %eax

	# Pushing caller
	movl   12(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest180
	pushl  $.stringlit1
	pushl  $1011
	movl   $0,    %eax
	call   nullexception
_nulltest180:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # at()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy721
_destroy722:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy721
	cmpl   $0,    %ebx
	jne    _destroy722
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit1
	pushl  $1011
	movl   $0,    %eax
	call   inheritexception
_destroy721:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy723
	addl   $1,    4(%ecx)
_destroy723:
	pushl  -16(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy724
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy724:
	addl   $4,    %esp
	popl   -16(%ebp)          # tmp

	# /*************************************************************************\
	# |                                                                         |
	# |  stdlib.floyd, line 1012: res.push_back(new Integer.init(tmp.toInt()))  |
	# |                                                                         |
	# \*************************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movl   -16(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest181
	pushl  $.stringlit1
	pushl  $1012
	movl   $0,    %eax
	call   nullexception
_nulltest181:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   132(%eax), %ebx
	call   *%ebx              # toInt()
	addl   $4,    %esp
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
	jne    _nulltest182
	pushl  $.stringlit1
	pushl  $1012
	movl   $0,    %eax
	call   nullexception
_nulltest182:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # init()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy725
_destroy726:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy725
	cmpl   $0,    %ebx
	jne    _destroy726
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit1
	pushl  $1012
	movl   $0,    %eax
	call   inheritexception
_destroy725:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy727
	addl   $1,    4(%ecx)
_destroy727:

	# Pushing caller
	movl   -8(%ebp), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest183
	pushl  $.stringlit1
	pushl  $1012
	movl   $0,    %eax
	call   nullexception
_nulltest183:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   92(%eax), %ebx
	call   *%ebx              # push_back()
	addl   $8,    %esp
	pushl  %eax               # Test for variable destruction
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	je     _destroy728
	cmpl   $0,    4(%ebx)
	jg     _destroy728
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy728:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 1013: idx := idx + 1  |
	# |                                           |
	# \*******************************************/
	pushl  -12(%ebp)          # idx
	movl   $1,    %ebx
	popl   %eax
	addl   %ebx,  %eax
	movl   %eax,  -12(%ebp)
	jmp    _while27
_endwhile27:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 1016: mapInteger := res  |
	# |                                              |
	# \**********************************************/
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy729
_destroy730:
	movl   (%ebx), %ebx
	cmpl   $Vectorvtable, %ebx
	je     _destroy729
	cmpl   $0,    %ebx
	jne    _destroy730
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit13
	pushl  $.stringlit1
	pushl  $1016
	movl   $0,    %eax
	call   inheritexception
_destroy729:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy731
	addl   $1,    4(%ecx)
_destroy731:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy732
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy732:
	addl   $4,    %esp
	popl   -4(%ebp)           # mapInteger

	# Garbage collection (locals)
	pushl  -8(%ebp)           # res
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy733
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy733:
	addl   $4,    %esp
	pushl  -16(%ebp)          # tmp
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy734
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy734:
	addl   $4,    %esp

	# Garbage collection (args)
	pushl  12(%ebp)           # data
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy735
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy735:
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
	je     _destroy736
	subl   $1,    4(%eax)
_destroy736:
	leave
	ret


	# /********************************************************\
	# |                                                        |
	# |  ..\tests\phase5\rand.floyd, line 1: class Vehicle is  |
	# |                                                        |
	# \********************************************************/
	# ***     ****         **        **           **
	# ***     ***          **        **           **
	# ***     ***          **                     **
	#  ***   ***   *****   ********  **   ******  **   *****
	#  ***   ***  *******  ********  **  *******  **  *******
	#  **** ****  *** ***  **** ***  **  *******  **  *** ***
	#   *** ***   *******  ***  ***  **  ***      **  *******
	#   *** ***   *******  **    **  **  **       **  *******
	#    *****    ***      **    **  **  ***      **  ***
	#    *****    *******  **    **  **  *******  **  *******
	#    *****    *******  **    **  **  *******  **  *******
	#     ***      *****   **    **  **   *****   **   *****
.global Vehicledestroy
	.type  Vehicledestroy, @function
Vehicledestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy737
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy737
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy737:
	leave
	ret

.global Vehiclename
	.type  Vehiclename, @function
Vehiclename:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit8, %eax
	leave
	ret

.global Vehicle_type
	.type  Vehicle_type, @function
Vehicle_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /**********************************************************\
	# |                                                          |
	# |  ..\tests\phase5\rand.floyd, line 4: getMiles(): int is  |
	# |                                                          |
	# \**********************************************************/
.global Vehicle_getMiles
	.type  Vehicle_getMiles, @function
Vehicle_getMiles:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  ..\tests\phase5\rand.floyd, line 6: getMiles := miles  |
	# |                                                         |
	# \*********************************************************/
	movl   8(%ebp), %ebx
	pushl  16(%ebx)           # miles
	popl   -4(%ebp)           # getMiles

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


	# /************************************************************\
	# |                                                            |
	# |  ..\tests\phase5\rand.floyd, line 9: getDesc(): String is  |
	# |                                                            |
	# \************************************************************/
.global Vehicle_getDesc
	.type  Vehicle_getDesc, @function
Vehicle_getDesc:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /********************************************************************************\
	# |                                                                                |
	# |  ..\tests\phase5\rand.floyd, line 11: getDesc := "(Mileage) = ".catInt(miles)  |
	# |                                                                                |
	# \********************************************************************************/

	# Pushing parameters
	movl   8(%ebp), %ebx
	movl   16(%ebx), %eax
	pushl  %eax

	# Pushing caller
	.section .rodata
.stringlit23:
	.string "(Mileage) = "
.text
	pushl  $Stringvtable
	pushl  $.stringlit23
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest184
	pushl  $.stringlit2
	pushl  $11
	movl   $0,    %eax
	call   nullexception
_nulltest184:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy738
_destroy739:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy738
	cmpl   $0,    %ebx
	jne    _destroy739
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit2
	pushl  $11
	movl   $0,    %eax
	call   inheritexception
_destroy738:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy740
	addl   $1,    4(%ecx)
_destroy740:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy741
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy741:
	addl   $4,    %esp
	popl   -4(%ebp)           # getDesc

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
	je     _destroy742
	subl   $1,    4(%eax)
_destroy742:
	leave
	ret


	# /***************************************************************************\
	# |                                                                           |
	# |  ..\tests\phase5\rand.floyd, line 15: class Car inherits from Vehicle is  |
	# |                                                                           |
	# \***************************************************************************/
	#    *******
	#   *********
	#  ***** ****
	#  ***    ***   ******  *****
	#  ***         *******  *****
	#  **          *** ***  *****
	#  **           ******  ***
	#  ***         *******  ***
	#  ***    ***  *******  **
	#  **********  *******  **
	#   *********  ******** **
	#    *******   ******** **
.global Cardestroy
	.type  Cardestroy, @function
Cardestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy743
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy743
	pushl  %ebx
	movl   8(%ebp), %ebx
	movl   20(%ebx), %ebx
	cmpl   $0,    %ebx
	je     _destroy744
	pushl  %ebx
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
	addl   $4,    %esp
_destroy744:
	call   destroyobject
	addl   $4,    %esp
_destroy743:
	leave
	ret

.global Carname
	.type  Carname, @function
Carname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit10, %eax
	leave
	ret

.global Car_type
	.type  Car_type, @function
Car_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /*************************************************************\
	# |                                                             |
	# |  ..\tests\phase5\rand.floyd, line 18: getDesc(): String is  |
	# |                                                             |
	# \*************************************************************/
.global Car_getDesc
	.type  Car_getDesc, @function
Car_getDesc:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

	# Statement list

	# /**************************************************************************************************************\
	# |                                                                                                              |
	# |  ..\tests\phase5\rand.floyd, line 20: getDesc := "(Model, Mileage) = ".cat(model & ", ").catInt(getMiles())  |
	# |                                                                                                              |
	# \**************************************************************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	pushl  8(%ebp)

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest185
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   nullexception
_nulltest185:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   80(%eax), %ebx
	call   *%ebx              # getMiles()
	addl   $4,    %esp
	pushl  %eax

	# Pushing caller

	# Pushing parameters

	# Pushing parameters
	.section .rodata
.stringlit24:
	.string ", "
.text
	pushl  $Stringvtable
	pushl  $.stringlit24
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy745
_destroy746:
	movl   (%ebx), %ebx
	cmpl   $Oydvtable, %ebx
	je     _destroy745
	cmpl   $0,    %ebx
	jne    _destroy746
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit11
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   inheritexception
_destroy745:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy747
	addl   $1,    4(%ecx)
_destroy747:

	# Pushing caller
	movl   8(%ebp), %ebx
	movl   20(%ebx), %eax
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest186
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   nullexception
_nulltest186:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   72(%eax), %ebx
	call   *%ebx              # _cat_()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy748
_destroy749:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy748
	cmpl   $0,    %ebx
	jne    _destroy749
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   inheritexception
_destroy748:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy750
	addl   $1,    4(%ecx)
_destroy750:

	# Pushing caller
	.section .rodata
.stringlit25:
	.string "(Model, Mileage) = "
.text
	pushl  $Stringvtable
	pushl  $.stringlit25
	movl   $0,    %eax
	call   createstring
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest187
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   nullexception
_nulltest187:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   108(%eax), %ebx
	call   *%ebx              # cat()
	addl   $8,    %esp
	pushl  %eax

	# Performing null checks
	movl   (%esp), %ebx
	cmpl   $0,    %ebx
	jne    _nulltest188
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   nullexception
_nulltest188:

	# Garbage collection (caller)
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)

	# Call method
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   116(%eax), %ebx
	call   *%ebx              # catInt()
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ebx       # Perform inheritance checks
	cmpl   $0,    %ebx
	je     _destroy751
_destroy752:
	movl   (%ebx), %ebx
	cmpl   $Stringvtable, %ebx
	je     _destroy751
	cmpl   $0,    %ebx
	jne    _destroy752
	movl   (%esp), %ebx
	movl   (%ebx), %eax
	movl   8(%eax), %ebx
	call   *%ebx
	pushl  %eax
	pushl  $.stringlit5
	pushl  $.stringlit2
	pushl  $20
	movl   $0,    %eax
	call   inheritexception
_destroy751:
	movl   (%esp), %ecx       # Add reference
	cmpl   $0,    %ecx
	je     _destroy753
	addl   $1,    4(%ecx)
_destroy753:
	pushl  -4(%ebp)
	movl   (%esp), %ebx       # Remove reference
	cmpl   $0,    %ebx
	je     _destroy754
	movl   (%ebx), %eax
	movl   4(%eax), %ebx
	call   *%ebx
_destroy754:
	addl   $4,    %esp
	popl   -4(%ebp)           # getDesc

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
	je     _destroy755
	subl   $1,    4(%eax)
_destroy755:
	leave
	ret


	# /******************************************************\
	# |                                                      |
	# |  ..\tests\phase5\rand.floyd, line 24: class Main is  |
	# |                                                      |
	# \******************************************************/
	#  ****   ****           **
	#  ****   ****           **
	#  ****   ****
	#  ***** *****   ******  **  ********
	#  ***** *****  *******  **  ********
	#  ***** *****  *** ***  **  ********
	#  ** ***** **   ******  **  ***  ***
	#  ** ***** **  *******  **  **    **
	#  ** ***** **  *******  **  **    **
	#  ** ***** **  *******  **  **    **
	#  **  ***  **  ******** **  **    **
	#  **  ***  **  ******** **  **    **
.global Maindestroy
	.type  Maindestroy, @function
Maindestroy:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	cmpl   $0,    %ebx
	je     _destroy756
	subl   $1,    4(%ebx)
	cmpl   $0,    4(%ebx)
	jg     _destroy756
	movl   %ebx,  %eax
	pushl  %eax
	call   destroyobject
	addl   $4,    %esp
_destroy756:
	leave
	ret

.global Mainname
	.type  Mainname, @function
Mainname:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   $.stringlit15, %eax
	leave
	ret

.global Main_type
	.type  Main_type, @function
Main_type:
	pushl  %ebp
	movl   %esp,  %ebp
	movl   8(%ebp), %ebx
	movl   (%ebx), %eax
	leave
	ret


	# /***************************************************\
	# |                                                   |
	# |  ..\tests\phase5\rand.floyd, line 25: start() is  |
	# |                                                   |
	# \***************************************************/
.global Main_start
	.type  Main_start, @function
Main_start:
	pushl  %ebp
	movl   %esp,  %ebp
	subl   $4,    %esp

	# Initializing locals
	movl   $0,    -4(%ebp)

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
	pushl  $0
	pushl  $Mainvtable
	movl   $0,    %eax
	call   addobject
	addl   $8,    %esp
	pushl  %eax
	movl   (%esp), %ecx       # Add reference
	addl   $1,    4(%ecx)
	call   Main_start
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
	.size  IntVectorvtable, 124
IntVectorvtable:
	.long  Oydvtable
	.long  IntVectordestroy
	.long  IntVectorname
	.long  IntVector_type
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
	.size  Readervtable, 96
Readervtable:
	.long  Oydvtable
	.long  Readerdestroy
	.long  Readername
	.long  Reader_type
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
	.size  Stringvtable, 152
Stringvtable:
	.long  Oydvtable
	.long  Stringdestroy
	.long  Stringname
	.long  String_type
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
	.long  String__mul_
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
	.long  String_toInt
	.long  String_find
	.long  String_substring
	.long  String_split
	.long  String_join
	.long  String_trim

	.weak  Arrayvtable
	.section .gnu.linkonce.r.Arrayvtable,"a",@progbits
	.align 8
	.type  Arrayvtable, @object
	.size  Arrayvtable, 76
Arrayvtable:
	.long  Oydvtable
	.long  Arraydestroy
	.long  Arrayname
	.long  Array_type
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
	.size  Integervtable, 84
Integervtable:
	.long  Oydvtable
	.long  Integerdestroy
	.long  Integername
	.long  Integer_type
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

	.weak  Vehiclevtable
	.section .gnu.linkonce.r.Vehiclevtable,"a",@progbits
	.align 8
	.type  Vehiclevtable, @object
	.size  Vehiclevtable, 84
Vehiclevtable:
	.long  Oydvtable
	.long  Vehicledestroy
	.long  Vehiclename
	.long  Vehicle_type
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
	.long  Vehicle_getMiles
	.long  Vehicle_getDesc

	.weak  Mappervtable
	.section .gnu.linkonce.r.Mappervtable,"a",@progbits
	.align 8
	.type  Mappervtable, @object
	.size  Mappervtable, 84
Mappervtable:
	.long  Oydvtable
	.long  Mapperdestroy
	.long  Mappername
	.long  Mapper_type
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
	.long  Mapper_mapInt
	.long  Mapper_mapInteger

	.weak  Carvtable
	.section .gnu.linkonce.r.Carvtable,"a",@progbits
	.align 8
	.type  Carvtable, @object
	.size  Carvtable, 84
Carvtable:
	.long  Vehiclevtable
	.long  Cardestroy
	.long  Carname
	.long  Car_type
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
	.long  Vehicle_getMiles
	.long  Car_getDesc

	.weak  Oydvtable
	.section .gnu.linkonce.r.Oydvtable,"a",@progbits
	.align 8
	.type  Oydvtable, @object
	.size  Oydvtable, 76
Oydvtable:
	.long  0
	.long  Oyddestroy
	.long  Oydname
	.long  Oyd_type
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
	.size  Booleanvtable, 84
Booleanvtable:
	.long  Oydvtable
	.long  Booleandestroy
	.long  Booleanname
	.long  Boolean_type
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
	.size  Vectorvtable, 124
Vectorvtable:
	.long  Oydvtable
	.long  Vectordestroy
	.long  Vectorname
	.long  Vector_type
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
	.size  Mapvtable, 84
Mapvtable:
	.long  Oydvtable
	.long  Mapdestroy
	.long  Mapname
	.long  Map_type
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

	.weak  Mainvtable
	.section .gnu.linkonce.r.Mainvtable,"a",@progbits
	.align 8
	.type  Mainvtable, @object
	.size  Mainvtable, 80
Mainvtable:
	.long  Oydvtable
	.long  Maindestroy
	.long  Mainname
	.long  Main_type
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
	.long  Main_start

	.weak  Writervtable
	.section .gnu.linkonce.r.Writervtable,"a",@progbits
	.align 8
	.type  Writervtable, @object
	.size  Writervtable, 112
Writervtable:
	.long  Oydvtable
	.long  Writerdestroy
	.long  Writername
	.long  Writer_type
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
	.long  Writer_writeVector
	.long  Writer_writeIntVector

