	# Global variables
.data
	.comm  _in,   8,8
	.comm  _out,  8,8

	.section .rodata
.stringlit0:
	.string "unknown"
.stringlit1:
	.string "stdlib.floyd"
.stringlit2:
	.string "..\tests\phase5\comp.floyd"
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
	.string "Mapper"
.stringlit9:
	.string "Oyd"
.stringlit10:
	.string "Boolean"
.stringlit11:
	.string "Vector"
.stringlit12:
	.string "Map"
.stringlit13:
	.string "Main"
.stringlit14:
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy0
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy0
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy0:
	leave
	ret

.global Oydname
	.type  Oydname, @function
Oydname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit9, %rax
	leave
	ret

.global Oyd_type
	.type  Oyd_type, @function
Oyd_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 9: toString := "none"  |
	# |                                            |
	# \********************************************/
	.section .rodata
.stringlit15:
	.string "none"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit15, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy1
_destroy2:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy1
	cmpq   $0,    %rbx
	jne    _destroy2
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $9,    %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy1:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy3
	addq   $1,    8(%rcx)
_destroy3:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy4
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy4:
	addq   $8,    %rsp
	popq   -8(%rbp)           # toString

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy5
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 14: val := null  |
	# |                                      |
	# \**************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy6
_destroy7:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy6
	cmpq   $0,    %rbx
	jne    _destroy7
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $14,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy6:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy8
	addq   $1,    8(%rcx)
_destroy8:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy9
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy9:
	addq   $8,    %rsp
	popq   -8(%rbp)           # val

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy10
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 19: eq := true  |
	# |                                     |
	# \*************************************/
	movq   $1,    -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy11
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy11:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 24: neq := not eq(other)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy12
_destroy13:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy12
	cmpq   $0,    %rbx
	jne    _destroy13
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $24,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy12:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy14
	addq   $1,    8(%rcx)
_destroy14:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest0
	movq   $.stringlit1, %rsi
	movq   $24,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest0:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   48(%rax), %rbx
	call   *%rbx              # eq()
	addq   $16,   %rsp
	xorq   $1,    %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy15
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy15:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 29: _lt_ := true  |
	# |                                       |
	# \***************************************/
	movq   $1,    -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy16
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy16:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 34: _lteq_ := _lt_(other) or eq(other)  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy17
_destroy18:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy17
	cmpq   $0,    %rbx
	jne    _destroy18
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $34,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy17:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy19
	addq   $1,    8(%rcx)
_destroy19:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest1
	movq   $.stringlit1, %rsi
	movq   $34,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest1:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   64(%rax), %rbx
	call   *%rbx              # _lt_()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy20
_destroy21:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy20
	cmpq   $0,    %rbx
	jne    _destroy21
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $34,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy20:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy22
	addq   $1,    8(%rcx)
_destroy22:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest2
	movq   $.stringlit1, %rsi
	movq   $34,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest2:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   48(%rax), %rbx
	call   *%rbx              # eq()
	addq   $16,   %rsp
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy23
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy23:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 39: _gteq_ := not _lt_(other)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy24
_destroy25:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy24
	cmpq   $0,    %rbx
	jne    _destroy25
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $39,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy24:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy26
	addq   $1,    8(%rcx)
_destroy26:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest3
	movq   $.stringlit1, %rsi
	movq   $39,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest3:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   64(%rax), %rbx
	call   *%rbx              # _lt_()
	addq   $16,   %rsp
	xorq   $1,    %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy27
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy27:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 44: _gt_ := not _lteq_(other)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy28
_destroy29:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy28
	cmpq   $0,    %rbx
	jne    _destroy29
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $44,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy28:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy30
	addq   $1,    8(%rcx)
_destroy30:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest4
	movq   $.stringlit1, %rsi
	movq   $44,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest4:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   72(%rax), %rbx
	call   *%rbx              # _lteq_()
	addq   $16,   %rsp
	xorq   $1,    %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy31
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy31:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 49: _and_ := false  |
	# |                                         |
	# \*****************************************/
	movq   $0,    -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy32
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy32:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 54: _or_ := false  |
	# |                                        |
	# \****************************************/
	movq   $0,    -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy33
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy33:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 59: _add_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy34
_destroy35:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy34
	cmpq   $0,    %rbx
	jne    _destroy35
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $59,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy34:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy36
	addq   $1,    8(%rcx)
_destroy36:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy37
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy37:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _add_

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy38
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy38:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy39
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 64: _sub_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy40
_destroy41:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy40
	cmpq   $0,    %rbx
	jne    _destroy41
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $64,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy40:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy42
	addq   $1,    8(%rcx)
_destroy42:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy43
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy43:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _sub_

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy44
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy44:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy45
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 69: _mul_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy46
_destroy47:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy46
	cmpq   $0,    %rbx
	jne    _destroy47
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $69,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy46:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy48
	addq   $1,    8(%rcx)
_destroy48:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy49
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy49:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _mul_

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy50
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy50:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy51
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 74: _div_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy52
_destroy53:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy52
	cmpq   $0,    %rbx
	jne    _destroy53
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $74,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy52:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy54
	addq   $1,    8(%rcx)
_destroy54:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy55
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy55:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _div_

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy56
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy56:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy57
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 79: _cat_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy58
_destroy59:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy58
	cmpq   $0,    %rbx
	jne    _destroy59
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $79,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy58:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy60
	addq   $1,    8(%rcx)
_destroy60:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy61
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy61:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _cat_

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy62
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy62:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy63
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 84: _idx_ := null  |
	# |                                        |
	# \****************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy64
_destroy65:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy64
	cmpq   $0,    %rbx
	jne    _destroy65
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $84,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy64:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy66
	addq   $1,    8(%rcx)
_destroy66:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy67
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy67:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _idx_

	# Garbage collection (args)
	pushq  24(%rbp)           # val
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy68
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy68:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy69
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy70
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy70
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy70:
	leave
	ret

.global Arrayname
	.type  Arrayname, @function
Arrayname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit6, %rax
	leave
	ret

.global Array_type
	.type  Array_type, @function
Array_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 108: data := new int[4]  |
	# |                                              |
	# \**********************************************/
	movq   $4,    %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $0,    %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy71
	addq   $1,    8(%rcx)
_destroy71:
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 109: last := 0  |
	# |                                     |
	# \*************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 110: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushq  $4
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc
	leave
	ret

.global IntVectordestroy
	.type  IntVectordestroy, @function
IntVectordestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy72
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy72
	pushq  %rbx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy73
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy73:
	popq   %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy72:
	leave
	ret

.global IntVectorname
	.type  IntVectorname, @function
IntVectorname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit3, %rax
	leave
	ret

.global IntVector_type
	.type  IntVector_type, @function
IntVector_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 114: size := last  |
	# |                                        |
	# \****************************************/
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	popq   -8(%rbp)           # size

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 119: getData := data  |
	# |                                           |
	# \*******************************************/
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy74
	addq   $1,    8(%rcx)
_destroy74:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy75
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy75:
	addq   $8,    %rsp
	popq   -8(%rbp)           # getData

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy76
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 123: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 124: tmp := new int[allocSize]  |
	# |                                                     |
	# \*****************************************************/
	movq   24(%rbp), %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $0,    %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy77
	addq   $1,    8(%rcx)
_destroy77:
	popq   -24(%rbp)          # tmp

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 126: loop while not (idx >= last)  |
	# |                                                        |
	# \********************************************************/
_while0:
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _whilebody0
	jmp    _endwhile0
_whilebody0:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 127: tmp[idx] := data[idx]  |
	# |                                                 |
	# \*************************************************/
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   -24(%rbp), %rdx
	movq   $.stringlit1, %rsi
	movq   $127,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $127,  %rdi
	movq   $0,    %rax
	call   indexarray
	popq   %rcx
	movq   %rax,  (%rcx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 128: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while0
_endwhile0:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 131: data := tmp  |
	# |                                       |
	# \***************************************/
	pushq  -24(%rbp)          # tmp
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy78
	addq   $1,    8(%rcx)
_destroy78:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy79
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy79:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 133: resize := me  |
	# |                                        |
	# \****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy80
_destroy81:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy80
	cmpq   $0,    %rbx
	jne    _destroy81
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $133,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy80:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy82
	addq   $1,    8(%rcx)
_destroy82:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy83
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy83:
	addq   $8,    %rsp
	popq   -8(%rbp)           # resize

	# Garbage collection (locals)
	pushq  -24(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy84
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy84:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy85
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 138: if last >= alloc then  |
	# |                                                 |
	# \*************************************************/
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # alloc
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if0
	jmp    _else0
_if0:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 139: alloc := alloc * 2  |
	# |                                              |
	# \**********************************************/
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # alloc
	movq   $2,    %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 140: resize(alloc)  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest5
	movq   $.stringlit1, %rsi
	movq   $140,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest5:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # resize()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy86
	cmpq   $0,    8(%rbx)
	jg     _destroy86
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy86:
	jmp    _endif0
_else0:
_endif0:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 142: data[last] := x  |
	# |                                           |
	# \*******************************************/
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $142,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   24(%rbp), %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 143: last := last + 1  |
	# |                                            |
	# \********************************************/
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 144: push_back := me  |
	# |                                           |
	# \*******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy87
_destroy88:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy87
	cmpq   $0,    %rbx
	jne    _destroy88
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $144,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy87:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy89
	addq   $1,    8(%rcx)
_destroy89:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy90
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy90:
	addq   $8,    %rsp
	popq   -8(%rbp)           # push_back

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy91
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 148: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 150: loop while idx < newLast  |
	# |                                                    |
	# \****************************************************/
_while1:
	pushq  32(%rbp)           # newLast
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody1
	jmp    _endwhile1
_whilebody1:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 151: push_back(newData[idx])  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   24(%rbp), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $151,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest6
	movq   $.stringlit1, %rsi
	movq   $151,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest6:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy92
	cmpq   $0,    8(%rbx)
	jg     _destroy92
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy92:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 152: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while1
_endwhile1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 155: init := me  |
	# |                                      |
	# \**************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy93
_destroy94:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy93
	cmpq   $0,    %rbx
	jne    _destroy94
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $155,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy93:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy95
	addq   $1,    8(%rcx)
_destroy95:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy96
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy96:
	addq   $8,    %rsp
	popq   -8(%rbp)           # init

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # newData
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy97
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy97:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy98
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 160: last := 0  |
	# |                                     |
	# \*************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 161: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushq  24(%rbp)           # allocSize
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 162: data := new int[alloc]  |
	# |                                                  |
	# \**************************************************/
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $0,    %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy99
	addq   $1,    8(%rcx)
_destroy99:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy100
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy100:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 164: reserve := me  |
	# |                                         |
	# \*****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy101
_destroy102:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy101
	cmpq   $0,    %rbx
	jne    _destroy102
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $164,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy101:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy103
	addq   $1,    8(%rcx)
_destroy103:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy104
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy104:
	addq   $8,    %rsp
	popq   -8(%rbp)           # reserve

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy105
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 169: copy := new IntVector.init(data, last)  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	pushq  %rax
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy106
	addq   $1,    8(%rcx)
_destroy106:

	# Pushing caller
	movq   $3,    %rsi
	movq   $IntVectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   IntVectorinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest7
	movq   $.stringlit1, %rsi
	movq   $169,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest7:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # init()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy107
_destroy108:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy107
	cmpq   $0,    %rbx
	jne    _destroy108
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $169,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy107:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy109
	addq   $1,    8(%rcx)
_destroy109:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy110
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy110:
	addq   $8,    %rsp
	popq   -8(%rbp)           # copy

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy111
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 174: at := data[idx]  |
	# |                                           |
	# \*******************************************/
	movq   24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $174,  %rdi
	movq   $0,    %rax
	call   indexarray
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 178: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 179: last := x.size()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest8
	movq   $.stringlit1, %rsi
	movq   $179,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest8:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	movq   %rax,  -24(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 181: loop while idx < last  |
	# |                                                 |
	# \*************************************************/
_while2:
	pushq  -24(%rbp)          # last
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest9
	movq   $.stringlit1, %rsi
	movq   $182,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest9:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest10
	movq   $.stringlit1, %rsi
	movq   $182,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest10:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy112
	cmpq   $0,    8(%rbx)
	jg     _destroy112
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy112:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 183: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while2
_endwhile2:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 186: insert := me  |
	# |                                        |
	# \****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy113
_destroy114:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy113
	cmpq   $0,    %rbx
	jne    _destroy114
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $186,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy113:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy115
	addq   $1,    8(%rcx)
_destroy115:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy116
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy116:
	addq   $8,    %rsp
	popq   -8(%rbp)           # insert

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # x
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy117
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy117:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy118
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $40,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 190: pivot := data[high]  |
	# |                                               |
	# \***********************************************/
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $190,  %rdi
	movq   $0,    %rax
	call   indexarray
	movq   %rax,  -16(%rbp)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 191: i := low - 1  |
	# |                                        |
	# \****************************************/
	pushq  24(%rbp)           # low
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -24(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 192: j := low  |
	# |                                    |
	# \************************************/
	pushq  24(%rbp)           # low
	popq   -32(%rbp)          # j

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 193: tmp: int  |
	# |                                    |
	# \************************************/
	movq   $0,    -40(%rbp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 195: loop while not (j > high - 1)  |
	# |                                                         |
	# \*********************************************************/
_while3:
	pushq  32(%rbp)           # high
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -32(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _whilebody3
	jmp    _endwhile3
_whilebody3:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 196: if not (data[j] > pivot) then  |
	# |                                                         |
	# \*********************************************************/
	pushq  -16(%rbp)          # pivot
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $196,  %rdi
	movq   $0,    %rax
	call   indexarray
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if1
	jmp    _else1
_if1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 197: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 198: tmp := data[i]  |
	# |                                          |
	# \******************************************/
	movq   -24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $198,  %rdi
	movq   $0,    %rax
	call   indexarray
	movq   %rax,  -40(%rbp)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 199: data[i] := data[j]  |
	# |                                              |
	# \**********************************************/
	movq   -24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $199,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $199,  %rdi
	movq   $0,    %rax
	call   indexarray
	popq   %rcx
	movq   %rax,  (%rcx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 200: data[j] := tmp  |
	# |                                          |
	# \******************************************/
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $200,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -40(%rbp), %rax
	popq   %rcx
	movq   %rax,  (%rcx)
	jmp    _endif1
_else1:
_endif1:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 202: j := j + 1  |
	# |                                      |
	# \**************************************/
	pushq  -32(%rbp)          # j
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)
	jmp    _while3
_endwhile3:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 205: tmp := data[i + 1]  |
	# |                                              |
	# \**********************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $205,  %rdi
	movq   $0,    %rax
	call   indexarray
	movq   %rax,  -40(%rbp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 206: data[i + 1] := data[high]  |
	# |                                                     |
	# \*****************************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $206,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $206,  %rdi
	movq   $0,    %rax
	call   indexarray
	popq   %rcx
	movq   %rax,  (%rcx)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 207: data[high] := tmp  |
	# |                                             |
	# \*********************************************/
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $207,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -40(%rbp), %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 209: partition := i + 1  |
	# |                                              |
	# \**********************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 213: pivot: int  |
	# |                                      |
	# \**************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 215: if not (low >= high) then  |
	# |                                                     |
	# \*****************************************************/
	pushq  32(%rbp)           # high
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if2
	jmp    _else2
_if2:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 216: pivot := partition(low, high)  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	movq   32(%rbp), %rax
	pushq  %rax
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest11
	movq   $.stringlit1, %rsi
	movq   $216,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest11:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   232(%rax), %rbx
	call   *%rbx              # partition()
	addq   $24,   %rsp
	movq   %rax,  -16(%rbp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 217: quicksort(low, pivot - 1)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # pivot
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest12
	movq   $.stringlit1, %rsi
	movq   $217,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest12:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy119
	cmpq   $0,    8(%rbx)
	jg     _destroy119
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy119:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 218: quicksort(pivot + 1, high)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movq   32(%rbp), %rax
	pushq  %rax
	pushq  -16(%rbp)          # pivot
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest13
	movq   $.stringlit1, %rsi
	movq   $218,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest13:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy120
	cmpq   $0,    8(%rbx)
	jg     _destroy120
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy120:
	jmp    _endif2
_else2:
_endif2:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 221: quicksort := me  |
	# |                                           |
	# \*******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy121
_destroy122:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy121
	cmpq   $0,    %rbx
	jne    _destroy122
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $221,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy121:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy123
	addq   $1,    8(%rcx)
_destroy123:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy124
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy124:
	addq   $8,    %rsp
	popq   -8(%rbp)           # quicksort

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy125
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 226: sort := quicksort(0, last - 1)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   $0,    %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest14
	movq   $.stringlit1, %rsi
	movq   $226,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest14:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy126
_destroy127:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy126
	cmpq   $0,    %rbx
	jne    _destroy127
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $226,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy126:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy128
	addq   $1,    8(%rcx)
_destroy128:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy129
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy129:
	addq   $8,    %rsp
	popq   -8(%rbp)           # sort

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy130
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 238: data := new Oyd[4]  |
	# |                                              |
	# \**********************************************/
	movq   $4,    %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $Oydvtable, %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy131
_destroy132:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy131
	cmpq   $0,    %rbx
	jne    _destroy132
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $238,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy131:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy133
	addq   $1,    8(%rcx)
_destroy133:
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 239: last := 0  |
	# |                                     |
	# \*************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 240: alloc := 4  |
	# |                                      |
	# \**************************************/
	pushq  $4
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc
	leave
	ret

.global Vectordestroy
	.type  Vectordestroy, @function
Vectordestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy134
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy134
	pushq  %rbx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy135
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy135:
	popq   %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy134:
	leave
	ret

.global Vectorname
	.type  Vectorname, @function
Vectorname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit11, %rax
	leave
	ret

.global Vector_type
	.type  Vector_type, @function
Vector_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 244: size := last  |
	# |                                        |
	# \****************************************/
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	popq   -8(%rbp)           # size

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 249: getData := data  |
	# |                                           |
	# \*******************************************/
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy136
_destroy137:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy136
	cmpq   $0,    %rbx
	jne    _destroy137
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $249,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy136:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy138
	addq   $1,    8(%rcx)
_destroy138:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy139
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy139:
	addq   $8,    %rsp
	popq   -8(%rbp)           # getData

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy140
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 253: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 254: tmp := new Oyd[allocSize]  |
	# |                                                     |
	# \*****************************************************/
	movq   24(%rbp), %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $Oydvtable, %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy141
_destroy142:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy141
	cmpq   $0,    %rbx
	jne    _destroy142
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $254,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy141:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy143
	addq   $1,    8(%rcx)
_destroy143:
	popq   -24(%rbp)          # tmp

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 256: loop while not (idx >= last)  |
	# |                                                        |
	# \********************************************************/
_while4:
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _whilebody4
	jmp    _endwhile4
_whilebody4:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 257: tmp[idx] := data[idx]  |
	# |                                                 |
	# \*************************************************/
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   -24(%rbp), %rdx
	movq   $.stringlit1, %rsi
	movq   $257,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $257,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy144
	addq   $1,    8(%rcx)
_destroy144:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy145
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy145:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 258: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while4
_endwhile4:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 261: data := tmp  |
	# |                                       |
	# \***************************************/
	pushq  -24(%rbp)          # tmp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy146
_destroy147:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy146
	cmpq   $0,    %rbx
	jne    _destroy147
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $261,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy146:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy148
	addq   $1,    8(%rcx)
_destroy148:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy149
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy149:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# Garbage collection (locals)
	pushq  -24(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy150
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy150:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 266: if last >= alloc then  |
	# |                                                 |
	# \*************************************************/
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # alloc
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if3
	jmp    _else3
_if3:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 267: alloc := alloc * 2  |
	# |                                              |
	# \**********************************************/
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # alloc
	movq   $2,    %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 268: resize(alloc)  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest15
	movq   $.stringlit1, %rsi
	movq   $268,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest15:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # resize()
	addq   $16,   %rsp
	jmp    _endif3
_else3:
_endif3:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 270: data[last] := x  |
	# |                                           |
	# \*******************************************/
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $270,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	pushq  24(%rbp)           # x
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy151
	addq   $1,    8(%rcx)
_destroy151:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy152
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy152:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 271: last := last + 1  |
	# |                                            |
	# \********************************************/
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 272: push_back := me  |
	# |                                           |
	# \*******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy153
_destroy154:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy153
	cmpq   $0,    %rbx
	jne    _destroy154
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $272,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy153:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy155
	addq   $1,    8(%rcx)
_destroy155:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy156
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy156:
	addq   $8,    %rsp
	popq   -8(%rbp)           # push_back

	# Garbage collection (args)
	pushq  24(%rbp)           # x
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy157
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy157:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy158
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 276: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 278: loop while idx < newLast  |
	# |                                                    |
	# \****************************************************/
_while5:
	pushq  32(%rbp)           # newLast
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody5
	jmp    _endwhile5
_whilebody5:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 279: push_back(newData[idx])  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movq   -16(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   24(%rbp), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $279,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy159
_destroy160:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy159
	cmpq   $0,    %rbx
	jne    _destroy160
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $279,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy159:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy161
	addq   $1,    8(%rcx)
_destroy161:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest16
	movq   $.stringlit1, %rsi
	movq   $279,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest16:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy162
	cmpq   $0,    8(%rbx)
	jg     _destroy162
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy162:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 280: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while5
_endwhile5:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 283: init := me  |
	# |                                      |
	# \**************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy163
_destroy164:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy163
	cmpq   $0,    %rbx
	jne    _destroy164
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $283,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy163:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy165
	addq   $1,    8(%rcx)
_destroy165:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy166
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy166:
	addq   $8,    %rsp
	popq   -8(%rbp)           # init

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # newData
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy167
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy167:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy168
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 288: last := 0  |
	# |                                     |
	# \*************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # last

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 289: alloc := allocSize  |
	# |                                              |
	# \**********************************************/
	pushq  24(%rbp)           # allocSize
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # alloc

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 290: data := new Oyd[alloc]  |
	# |                                                  |
	# \**************************************************/
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	movq   %rax,  %rcx
	movq   $1,    %rdx
	movq   $Oydvtable, %rsi
	movq   $Arrayvtable, %rdi
	movq   $0,    %rax
	call   addarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy169
_destroy170:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy169
	cmpq   $0,    %rbx
	jne    _destroy170
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $290,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy169:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy171
	addq   $1,    8(%rcx)
_destroy171:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy172
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy172:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 292: reserve := me  |
	# |                                         |
	# \*****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy173
_destroy174:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy173
	cmpq   $0,    %rbx
	jne    _destroy174
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $292,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy173:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy175
	addq   $1,    8(%rcx)
_destroy175:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy176
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy176:
	addq   $8,    %rsp
	popq   -8(%rbp)           # reserve

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy177
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 297: copy := new Vector.init(data, last)  |
	# |                                                               |
	# \***************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	pushq  %rax
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy178
_destroy179:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy178
	cmpq   $0,    %rbx
	jne    _destroy179
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $297,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy178:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy180
	addq   $1,    8(%rcx)
_destroy180:

	# Pushing caller
	movq   $3,    %rsi
	movq   $Vectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Vectorinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest17
	movq   $.stringlit1, %rsi
	movq   $297,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest17:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # init()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy181
_destroy182:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy181
	cmpq   $0,    %rbx
	jne    _destroy182
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $297,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy181:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy183
	addq   $1,    8(%rcx)
_destroy183:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy184
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy184:
	addq   $8,    %rsp
	popq   -8(%rbp)           # copy

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy185
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 302: at := data[idx]  |
	# |                                           |
	# \*******************************************/
	movq   24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $302,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy186
_destroy187:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy186
	cmpq   $0,    %rbx
	jne    _destroy187
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $302,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy186:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy188
	addq   $1,    8(%rcx)
_destroy188:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy189
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy189:
	addq   $8,    %rsp
	popq   -8(%rbp)           # at

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy190
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 306: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 307: last := x.size()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest18
	movq   $.stringlit1, %rsi
	movq   $307,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest18:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	movq   %rax,  -24(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 309: loop while idx < last  |
	# |                                                 |
	# \*************************************************/
_while6:
	pushq  -24(%rbp)          # last
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest19
	movq   $.stringlit1, %rsi
	movq   $310,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest19:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy191
_destroy192:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy191
	cmpq   $0,    %rbx
	jne    _destroy192
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $310,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy191:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy193
	addq   $1,    8(%rcx)
_destroy193:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest20
	movq   $.stringlit1, %rsi
	movq   $310,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest20:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy194
	cmpq   $0,    8(%rbx)
	jg     _destroy194
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy194:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 311: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while6
_endwhile6:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 314: insert := me  |
	# |                                        |
	# \****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy195
_destroy196:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy195
	cmpq   $0,    %rbx
	jne    _destroy196
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $314,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy195:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy197
	addq   $1,    8(%rcx)
_destroy197:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy198
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy198:
	addq   $8,    %rsp
	popq   -8(%rbp)           # insert

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # x
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy199
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy199:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy200
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $40,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 318: pivot := data[high]  |
	# |                                               |
	# \***********************************************/
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $318,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy201
_destroy202:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy201
	cmpq   $0,    %rbx
	jne    _destroy202
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $318,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy201:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy203
	addq   $1,    8(%rcx)
_destroy203:
	popq   -16(%rbp)          # pivot

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 319: i := low - 1  |
	# |                                        |
	# \****************************************/
	pushq  24(%rbp)           # low
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -24(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 320: j := low  |
	# |                                    |
	# \************************************/
	pushq  24(%rbp)           # low
	popq   -32(%rbp)          # j

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 321: tmp: Oyd  |
	# |                                    |
	# \************************************/
	movq   $0,    -40(%rbp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 323: loop while not (j > high - 1)  |
	# |                                                         |
	# \*********************************************************/
_while7:
	pushq  32(%rbp)           # high
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -32(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _whilebody7
	jmp    _endwhile7
_whilebody7:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 324: if not (data[j] > pivot) then  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # pivot
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy204
_destroy205:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy204
	cmpq   $0,    %rbx
	jne    _destroy205
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $324,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy204:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy206
	addq   $1,    8(%rcx)
_destroy206:

	# Pushing caller
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $324,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest21
	movq   $.stringlit1, %rsi
	movq   $324,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest21:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   88(%rax), %rbx
	call   *%rbx              # _gt_()
	addq   $16,   %rsp
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if4
	jmp    _else4
_if4:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 325: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 326: tmp := data[i]  |
	# |                                          |
	# \******************************************/
	movq   -24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $326,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy207
_destroy208:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy207
	cmpq   $0,    %rbx
	jne    _destroy208
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $326,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy207:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy209
	addq   $1,    8(%rcx)
_destroy209:
	pushq  -40(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy210
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy210:
	addq   $8,    %rsp
	popq   -40(%rbp)          # tmp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 327: data[i] := data[j]  |
	# |                                              |
	# \**********************************************/
	movq   -24(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $327,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $327,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy211
	addq   $1,    8(%rcx)
_destroy211:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy212
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy212:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 328: data[j] := tmp  |
	# |                                          |
	# \******************************************/
	movq   -32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $328,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	pushq  -40(%rbp)          # tmp
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy213
	addq   $1,    8(%rcx)
_destroy213:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy214
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy214:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)
	jmp    _endif4
_else4:
_endif4:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 330: j := j + 1  |
	# |                                      |
	# \**************************************/
	pushq  -32(%rbp)          # j
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)
	jmp    _while7
_endwhile7:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 333: tmp := data[i + 1]  |
	# |                                              |
	# \**********************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $333,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy215
_destroy216:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy215
	cmpq   $0,    %rbx
	jne    _destroy216
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $333,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy215:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy217
	addq   $1,    8(%rcx)
_destroy217:
	pushq  -40(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy218
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy218:
	addq   $8,    %rsp
	popq   -40(%rbp)          # tmp

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 334: data[i + 1] := data[high]  |
	# |                                                     |
	# \*****************************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $334,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $0,    %rcx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	movq   %rax,  %rdx
	movq   $.stringlit1, %rsi
	movq   $334,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy219
	addq   $1,    8(%rcx)
_destroy219:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy220
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy220:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 335: data[high] := tmp  |
	# |                                             |
	# \*********************************************/
	movq   32(%rbp), %rax
	movq   %rax,  %r9
	movq   $1,    %r8
	movq   $1,    %rcx
	movq   16(%rbp), %rax
	movq   32(%rax), %rdx
	movq   $.stringlit1, %rsi
	movq   $335,  %rdi
	movq   $0,    %rax
	call   indexarray
	pushq  %rax
	pushq  -40(%rbp)          # tmp
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy221
	addq   $1,    8(%rcx)
_destroy221:
	movq   8(%rsp), %rax
	pushq  (%rax)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy222
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy222:
	addq   $8,    %rsp
	popq   %rax
	popq   %rcx
	movq   %rax,  (%rcx)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 337: partition := i + 1  |
	# |                                              |
	# \**********************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # pivot
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy223
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy223:
	addq   $8,    %rsp
	pushq  -40(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy224
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy224:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 341: pivot: int  |
	# |                                      |
	# \**************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 343: if not (low >= high) then  |
	# |                                                     |
	# \*****************************************************/
	pushq  32(%rbp)           # high
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if5
	jmp    _else5
_if5:

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 344: pivot := partition(low, high)  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters
	movq   32(%rbp), %rax
	pushq  %rax
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest22
	movq   $.stringlit1, %rsi
	movq   $344,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest22:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   232(%rax), %rbx
	call   *%rbx              # partition()
	addq   $24,   %rsp
	movq   %rax,  -16(%rbp)

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 345: quicksort(low, pivot - 1)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # pivot
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest23
	movq   $.stringlit1, %rsi
	movq   $345,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest23:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy225
	cmpq   $0,    8(%rbx)
	jg     _destroy225
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy225:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 346: quicksort(pivot + 1, high)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movq   32(%rbp), %rax
	pushq  %rax
	pushq  -16(%rbp)          # pivot
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest24
	movq   $.stringlit1, %rsi
	movq   $346,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest24:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy226
	cmpq   $0,    8(%rbx)
	jg     _destroy226
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy226:
	jmp    _endif5
_else5:
_endif5:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 349: quicksort := me  |
	# |                                           |
	# \*******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy227
_destroy228:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy227
	cmpq   $0,    %rbx
	jne    _destroy228
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $349,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy227:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy229
	addq   $1,    8(%rcx)
_destroy229:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy230
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy230:
	addq   $8,    %rsp
	popq   -8(%rbp)           # quicksort

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy231
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 354: sort := quicksort(0, last - 1)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  40(%rbx)           # last
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   $0,    %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest25
	movq   $.stringlit1, %rsi
	movq   $354,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest25:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # quicksort()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy232
_destroy233:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy232
	cmpq   $0,    %rbx
	jne    _destroy233
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $354,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy232:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy234
	addq   $1,    8(%rcx)
_destroy234:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy235
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy235:
	addq   $8,    %rsp
	popq   -8(%rbp)           # sort

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy236
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 364: data := new IntVector  |
	# |                                                 |
	# \*************************************************/
	movq   $3,    %rsi
	movq   $IntVectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   IntVectorinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy237
_destroy238:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy237
	cmpq   $0,    %rbx
	jne    _destroy238
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $364,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy237:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy239
	addq   $1,    8(%rcx)
_destroy239:
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data
	leave
	ret

.global Stringdestroy
	.type  Stringdestroy, @function
Stringdestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy240
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy240
	pushq  %rbx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy241
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy241:
	popq   %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy240:
	leave
	ret

.global Stringname
	.type  Stringname, @function
Stringname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit5, %rax
	leave
	ret

.global String_type
	.type  String_type, @function
String_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 368: size := data.size()  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest26
	movq   $.stringlit1, %rsi
	movq   $368,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest26:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	movq   %rax,  -8(%rbp)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 373: length := data.size()  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest27
	movq   $.stringlit1, %rsi
	movq   $373,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest27:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	movq   %rax,  -8(%rbp)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 378: getData := data  |
	# |                                           |
	# \*******************************************/
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy242
_destroy243:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy242
	cmpq   $0,    %rbx
	jne    _destroy243
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $378,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy242:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy244
	addq   $1,    8(%rcx)
_destroy244:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy245
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy245:
	addq   $8,    %rsp
	popq   -8(%rbp)           # getData

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy246
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 383: data := newData  |
	# |                                           |
	# \*******************************************/
	pushq  24(%rbp)           # newData
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy247
_destroy248:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy247
	cmpq   $0,    %rbx
	jne    _destroy248
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $383,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy247:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy249
	addq   $1,    8(%rcx)
_destroy249:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy250
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy250:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 384: init := me  |
	# |                                      |
	# \**************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy251
_destroy252:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy251
	cmpq   $0,    %rbx
	jne    _destroy252
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $384,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy251:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy253
	addq   $1,    8(%rcx)
_destroy253:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy254
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy254:
	addq   $8,    %rsp
	popq   -8(%rbp)           # init

	# Garbage collection (args)
	pushq  24(%rbp)           # newData
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy255
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy255:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy256
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 389: data.push_back(ch)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest28
	movq   $.stringlit1, %rsi
	movq   $389,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest28:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy257
	cmpq   $0,    8(%rbx)
	jg     _destroy257
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy257:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 390: appendChar := me  |
	# |                                            |
	# \********************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy258
_destroy259:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy258
	cmpq   $0,    %rbx
	jne    _destroy259
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $390,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy258:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy260
	addq   $1,    8(%rcx)
_destroy260:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy261
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy261:
	addq   $8,    %rsp
	popq   -8(%rbp)           # appendChar

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy262
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 394: digit: int  |
	# |                                      |
	# \**************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 396: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushq  24(%rbp)           # num
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	pushq  %rax
	movq   $10,   %rbx
	popq   %rax
	imulq  %rbx,  %rax
	movq   %rax,  %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -16(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 397: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushq  $0
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if6
	jmp    _else6
_if6:

	# /*******************************************************\
	# |                                                       |
	# |  stdlib.floyd, line 398: catIntHelper(num / 10, str)  |
	# |                                                       |
	# \*******************************************************/

	# Pushing parameters
	pushq  32(%rbp)           # str
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy263
_destroy264:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy263
	cmpq   $0,    %rbx
	jne    _destroy264
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $398,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy263:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy265
	addq   $1,    8(%rcx)
_destroy265:
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest29
	movq   $.stringlit1, %rsi
	movq   $398,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest29:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # catIntHelper()
	addq   $24,   %rsp
	jmp    _endif6
_else6:
_endif6:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 400: str.appendChar(digit + 48)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # digit
	movq   $48,   %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   32(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest30
	movq   $.stringlit1, %rsi
	movq   $400,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest30:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy266
	cmpq   $0,    8(%rbx)
	jg     _destroy266
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy266:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  32(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy267
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy267:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 405: copy := new String.init(data.copy())  |
	# |                                                                |
	# \****************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest31
	movq   $.stringlit1, %rsi
	movq   $405,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest31:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # copy()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy268
_destroy269:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy268
	cmpq   $0,    %rbx
	jne    _destroy269
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $405,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy268:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy270
	addq   $1,    8(%rcx)
_destroy270:

	# Pushing caller
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest32
	movq   $.stringlit1, %rsi
	movq   $405,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest32:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy271
_destroy272:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy271
	cmpq   $0,    %rbx
	jne    _destroy272
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $405,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy271:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy273
	addq   $1,    8(%rcx)
_destroy273:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy274
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy274:
	addq   $8,    %rsp
	popq   -8(%rbp)           # copy

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy275
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 409: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest33
	movq   $.stringlit1, %rsi
	movq   $409,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest33:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # copy()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy276
_destroy277:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy276
	cmpq   $0,    %rbx
	jne    _destroy277
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $409,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy276:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy278
	addq   $1,    8(%rcx)
_destroy278:
	popq   -16(%rbp)          # newStr

	# Statement list

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 411: newStr.getData().insert(str.getData())  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest34
	movq   $.stringlit1, %rsi
	movq   $411,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest34:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # getData()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy279
_destroy280:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy279
	cmpq   $0,    %rbx
	jne    _destroy280
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $411,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy279:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy281
	addq   $1,    8(%rcx)
_destroy281:

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest35
	movq   $.stringlit1, %rsi
	movq   $411,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest35:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # getData()
	addq   $8,    %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest36
	movq   $.stringlit1, %rsi
	movq   $411,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest36:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   224(%rax), %rbx
	call   *%rbx              # insert()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy282
	cmpq   $0,    8(%rbx)
	jg     _destroy282
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy282:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 412: cat := newStr  |
	# |                                         |
	# \*****************************************/
	pushq  -16(%rbp)          # newStr
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy283
_destroy284:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy283
	cmpq   $0,    %rbx
	jne    _destroy284
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $412,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy283:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy285
	addq   $1,    8(%rcx)
_destroy285:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy286
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy286:
	addq   $8,    %rsp
	popq   -8(%rbp)           # cat

	# Garbage collection (locals)
	pushq  -16(%rbp)          # newStr
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy287
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy287:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy288
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy288:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy289
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 416: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy290
_destroy291:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy290
	cmpq   $0,    %rbx
	jne    _destroy291
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $416,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy290:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy292
	addq   $1,    8(%rcx)
_destroy292:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 418: _cat_ := cat(tmp)  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy293
_destroy294:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy293
	cmpq   $0,    %rbx
	jne    _destroy294
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $418,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy293:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy295
	addq   $1,    8(%rcx)
_destroy295:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest37
	movq   $.stringlit1, %rsi
	movq   $418,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest37:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # cat()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy296
_destroy297:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy296
	cmpq   $0,    %rbx
	jne    _destroy297
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $418,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy296:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy298
	addq   $1,    8(%rcx)
_destroy298:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy299
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy299:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _cat_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy300
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy300:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy301
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy301:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy302
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 422: newStr := copy()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest38
	movq   $.stringlit1, %rsi
	movq   $422,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest38:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # copy()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy303
_destroy304:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy303
	cmpq   $0,    %rbx
	jne    _destroy304
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $422,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy303:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy305
	addq   $1,    8(%rcx)
_destroy305:
	popq   -16(%rbp)          # newStr

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 424: newStr.appendChar(ch)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest39
	movq   $.stringlit1, %rsi
	movq   $424,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest39:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy306
	cmpq   $0,    8(%rbx)
	jg     _destroy306
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy306:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 425: catChar := newStr  |
	# |                                             |
	# \*********************************************/
	pushq  -16(%rbp)          # newStr
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy307
_destroy308:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy307
	cmpq   $0,    %rbx
	jne    _destroy308
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $425,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy307:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy309
	addq   $1,    8(%rcx)
_destroy309:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy310
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy310:
	addq   $8,    %rsp
	popq   -8(%rbp)           # catChar

	# Garbage collection (locals)
	pushq  -16(%rbp)          # newStr
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy311
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy311:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy312
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 429: result: String  |
	# |                                          |
	# \******************************************/
	movq   $0,    -16(%rbp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 430: i: int  |
	# |                                  |
	# \**********************************/
	movq   $0,    -24(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 432: if not (num = 0) then  |
	# |                                                 |
	# \*************************************************/
	pushq  $0
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if7
	jmp    _else7
_if7:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 433: result := new String  |
	# |                                                |
	# \************************************************/
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy313
_destroy314:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy313
	cmpq   $0,    %rbx
	jne    _destroy314
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $433,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy313:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy315
	addq   $1,    8(%rcx)
_destroy315:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy316
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy316:
	addq   $8,    %rsp
	popq   -16(%rbp)          # result

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 435: if (0 > num) then  |
	# |                                             |
	# \*********************************************/
	pushq  24(%rbp)           # num
	movq   $0,    %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if8
	jmp    _else8
_if8:

	# /**************************************************************\
	# |                                                              |
	# |  stdlib.floyd, line 436: result.appendChar(45) ~ minus sign  |
	# |                                                              |
	# \**************************************************************/

	# Pushing parameters
	movq   $45,   %rax
	pushq  %rax

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest40
	movq   $.stringlit1, %rsi
	movq   $436,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest40:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy317
	cmpq   $0,    8(%rbx)
	jg     _destroy317
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy317:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 437: num := -num  |
	# |                                       |
	# \***************************************/
	movq   24(%rbp), %rax
	negq   %rax
	movq   %rax,  24(%rbp)
	jmp    _endif8
_else8:
_endif8:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 441: catIntHelper(num, result)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # result
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy318
_destroy319:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy318
	cmpq   $0,    %rbx
	jne    _destroy319
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $441,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy318:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy320
	addq   $1,    8(%rcx)
_destroy320:
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest41
	movq   $.stringlit1, %rsi
	movq   $441,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest41:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # catIntHelper()
	addq   $24,   %rsp
	jmp    _endif7
_else7:

	# /******************************************************************\
	# |                                                                  |
	# |  stdlib.floyd, line 443: result := (new String).catChar(48) ~ 0  |
	# |                                                                  |
	# \******************************************************************/

	# Pushing parameters
	movq   $48,   %rax
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest42
	movq   $.stringlit1, %rsi
	movq   $443,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest42:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   224(%rax), %rbx
	call   *%rbx              # catChar()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy321
_destroy322:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy321
	cmpq   $0,    %rbx
	jne    _destroy322
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $443,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy321:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy323
	addq   $1,    8(%rcx)
_destroy323:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy324
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy324:
	addq   $8,    %rsp
	popq   -16(%rbp)          # result
_endif7:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 446: catInt := cat(result)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # result
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy325
_destroy326:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy325
	cmpq   $0,    %rbx
	jne    _destroy326
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $446,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy325:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy327
	addq   $1,    8(%rcx)
_destroy327:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest43
	movq   $.stringlit1, %rsi
	movq   $446,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest43:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # cat()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy328
_destroy329:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy328
	cmpq   $0,    %rbx
	jne    _destroy329
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $446,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy328:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy330
	addq   $1,    8(%rcx)
_destroy330:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy331
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy331:
	addq   $8,    %rsp
	popq   -8(%rbp)           # catInt

	# Garbage collection (locals)
	pushq  -16(%rbp)          # result
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy332
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy332:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy333
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 451: if 0 > idx or idx >= size() then  |
	# |                                                            |
	# \************************************************************/
	pushq  24(%rbp)           # idx
	movq   $0,    %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	pushq  %rax

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest44
	movq   $.stringlit1, %rsi
	movq   $451,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest44:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	cmpq   $0,    %rax
	jne    _if9
	jmp    _else9
_if9:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 452: charAt := -1  |
	# |                                        |
	# \****************************************/
	movq   $-1,   -8(%rbp)
	jmp    _endif9
_else9:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 454: charAt := data.at(idx)  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest45
	movq   $.stringlit1, %rsi
	movq   $454,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest45:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	movq   %rax,  -8(%rbp)
_endif9:

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 460: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy334
_destroy335:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy334
	cmpq   $0,    %rbx
	jne    _destroy335
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $460,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy334:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy336
	addq   $1,    8(%rcx)
_destroy336:
	popq   -16(%rbp)          # tmp

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 461: i := 0  |
	# |                                  |
	# \**********************************/
	movq   $0,    -24(%rbp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 462: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest46
	movq   $.stringlit1, %rsi
	movq   $462,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest46:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	movq   %rax,  -32(%rbp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 464: if not (len = tmp.length()) then  |
	# |                                                            |
	# \************************************************************/

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest47
	movq   $.stringlit1, %rsi
	movq   $464,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest47:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	pushq  %rax
	movq   -32(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if10
	jmp    _else10
_if10:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 465: eq := false  |
	# |                                       |
	# \***************************************/
	movq   $0,    -8(%rbp)
	jmp    _endif10
_else10:

	# /*************************************************************************************\
	# |                                                                                     |
	# |  stdlib.floyd, line 467: loop while not (i >= len) and (charAt(i) = tmp.charAt(i))  |
	# |                                                                                     |
	# \*************************************************************************************/
_while8:
	pushq  -32(%rbp)          # len
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	pushq  %rax

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest48
	movq   $.stringlit1, %rsi
	movq   $467,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest48:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest49
	movq   $.stringlit1, %rsi
	movq   $467,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest49:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody8
	jmp    _endwhile8
_whilebody8:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 468: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushq  -24(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while8
_endwhile8:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 470: eq := (i = len)  |
	# |                                           |
	# \*******************************************/
	pushq  -32(%rbp)          # len
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)
_endif10:

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy337
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy337:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy338
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy338:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 475: i := 0  |
	# |                                  |
	# \**********************************/
	movq   $0,    -16(%rbp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 476: len := length()  |
	# |                                           |
	# \*******************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest50
	movq   $.stringlit1, %rsi
	movq   $476,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest50:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	movq   %rax,  -24(%rbp)

	# Statement list

	# /*****************************************************************************************************************\
	# |                                                                                                                 |
	# |  stdlib.floyd, line 478: loop while not (i >= len) and not (i >= str.length()) and (charAt(i) = str.charAt(i))  |
	# |                                                                                                                 |
	# \*****************************************************************************************************************/
_while9:
	pushq  -24(%rbp)          # len
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	pushq  %rax

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest51
	movq   $.stringlit1, %rsi
	movq   $478,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest51:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	pushq  %rax

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest52
	movq   $.stringlit1, %rsi
	movq   $478,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest52:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest53
	movq   $.stringlit1, %rsi
	movq   $478,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest53:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody9
	jmp    _endwhile9
_whilebody9:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 479: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushq  -16(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while9
_endwhile9:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 481: if (i >= len) or (i >= str.length()) then  |
	# |                                                                     |
	# \*********************************************************************/
	pushq  -24(%rbp)          # len
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	pushq  %rax

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest54
	movq   $.stringlit1, %rsi
	movq   $481,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest54:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	cmpq   $0,    %rax
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
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest55
	movq   $.stringlit1, %rsi
	movq   $482,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest55:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)
	jmp    _endif11
_else11:

	# /*************************************************************\
	# |                                                             |
	# |  stdlib.floyd, line 484: gt := (charAt(i) > str.charAt(i))  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest56
	movq   $.stringlit1, %rsi
	movq   $484,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest56:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest57
	movq   $.stringlit1, %rsi
	movq   $484,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest57:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)
_endif11:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy339
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy339:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 490: gteq := gt(str) or eq(str)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy340
_destroy341:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy340
	cmpq   $0,    %rbx
	jne    _destroy341
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $490,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy340:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy342
	addq   $1,    8(%rcx)
_destroy342:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest58
	movq   $.stringlit1, %rsi
	movq   $490,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest58:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   248(%rax), %rbx
	call   *%rbx              # gt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy343
_destroy344:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy343
	cmpq   $0,    %rbx
	jne    _destroy344
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $490,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy343:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy345
	addq   $1,    8(%rcx)
_destroy345:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest59
	movq   $.stringlit1, %rsi
	movq   $490,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest59:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   48(%rax), %rbx
	call   *%rbx              # eq()
	addq   $16,   %rsp
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (args)
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy346
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy346:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 494: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy347
_destroy348:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy347
	cmpq   $0,    %rbx
	jne    _destroy348
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $494,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy347:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy349
	addq   $1,    8(%rcx)
_destroy349:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 496: _lt_ := not gteq(tmp)  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy350
_destroy351:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy350
	cmpq   $0,    %rbx
	jne    _destroy351
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $496,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy350:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy352
	addq   $1,    8(%rcx)
_destroy352:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest60
	movq   $.stringlit1, %rsi
	movq   $496,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest60:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   256(%rax), %rbx
	call   *%rbx              # gteq()
	addq   $16,   %rsp
	xorq   $1,    %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy353
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy353:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy354
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy354:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 501: toString := me  |
	# |                                          |
	# \******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy355
_destroy356:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy355
	cmpq   $0,    %rbx
	jne    _destroy356
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $501,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy355:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy357
	addq   $1,    8(%rcx)
_destroy357:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy358
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy358:
	addq   $8,    %rsp
	popq   -8(%rbp)           # toString

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy359
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 505: num := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 506: mult := 1  |
	# |                                     |
	# \*************************************/
	movq   $1,    -24(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 507: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /***************************************************************************\
	# |                                                                           |
	# |  stdlib.floyd, line 509: if idx < data.size() and data.at(idx) = 45 then  |
	# |                                                                           |
	# \***************************************************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest61
	movq   $.stringlit1, %rsi
	movq   $509,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest61:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -32(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $45

	# Pushing parameters
	movq   -32(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest62
	movq   $.stringlit1, %rsi
	movq   $509,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest62:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _if12
	jmp    _else12
_if12:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 510: mult := -1  |
	# |                                      |
	# \**************************************/
	movq   $-1,   -24(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 511: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -32(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)
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
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest63
	movq   $.stringlit1, %rsi
	movq   $514,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest63:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -32(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody10
	jmp    _endwhile10
_whilebody10:

	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 515: num := num * 10 + (data.at(idx) - 48)  |
	# |                                                                 |
	# \*****************************************************************/
	pushq  -16(%rbp)          # num
	movq   $10,   %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax

	# Pushing parameters
	movq   -32(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest64
	movq   $.stringlit1, %rsi
	movq   $515,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest64:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   $48,   %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 516: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -32(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)
	jmp    _while10
_endwhile10:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 519: toInt := num * mult  |
	# |                                               |
	# \***********************************************/
	pushq  -16(%rbp)          # num
	movq   -24(%rbp), %rbx
	popq   %rax
	imulq  %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 523: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 524: search := 0  |
	# |                                       |
	# \***************************************/
	movq   $0,    -24(%rbp)

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 525: found := false  |
	# |                                          |
	# \******************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /********************************************************************************\
	# |                                                                                |
	# |  stdlib.floyd, line 527: loop while not found and idx < size() - other.size()  |
	# |                                                                                |
	# \********************************************************************************/
_while11:
	movq   -32(%rbp), %rax
	xorq   $1,    %rax
	pushq  %rax

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest65
	movq   $.stringlit1, %rsi
	movq   $527,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest65:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest66
	movq   $.stringlit1, %rsi
	movq   $527,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest66:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	movq   %rax,  %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody11
	jmp    _endwhile11
_whilebody11:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 528: search := 0  |
	# |                                       |
	# \***************************************/
	movq   $0,    -24(%rbp)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 529: found := true  |
	# |                                         |
	# \*****************************************/
	movq   $1,    -32(%rbp)

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 530: loop while found and search < other.size()  |
	# |                                                                      |
	# \**********************************************************************/
_while12:
	pushq  -32(%rbp)          # found

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest67
	movq   $.stringlit1, %rsi
	movq   $530,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest67:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody12
	jmp    _endwhile12
_whilebody12:

	# /********************************************************************************\
	# |                                                                                |
	# |  stdlib.floyd, line 531: if charAt(idx + search) != other.charAt(search) then  |
	# |                                                                                |
	# \********************************************************************************/

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest68
	movq   $.stringlit1, %rsi
	movq   $531,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest68:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing parameters
	pushq  -16(%rbp)          # idx
	movq   -24(%rbp), %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest69
	movq   $.stringlit1, %rsi
	movq   $531,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest69:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if13
	jmp    _else13
_if13:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 532: found := false  |
	# |                                          |
	# \******************************************/
	movq   $0,    -32(%rbp)
	jmp    _endif13
_else13:
_endif13:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 534: search := search + 1  |
	# |                                                |
	# \************************************************/
	pushq  -24(%rbp)          # search
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while12
_endwhile12:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 536: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while11
_endwhile11:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 539: if found then  |
	# |                                         |
	# \*****************************************/
	movq   -32(%rbp), %rax
	cmpq   $0,    %rax
	jne    _if14
	jmp    _else14
_if14:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 540: find := idx - 1  |
	# |                                           |
	# \*******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -8(%rbp)
	jmp    _endif14
_else14:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 542: find := -1  |
	# |                                      |
	# \**************************************/
	movq   $-1,   -8(%rbp)
_endif14:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy360
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy360:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 547: res := new String  |
	# |                                             |
	# \*********************************************/
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy361
_destroy362:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy361
	cmpq   $0,    %rbx
	jne    _destroy362
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $547,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy361:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy363
	addq   $1,    8(%rcx)
_destroy363:
	popq   -16(%rbp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 548: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -24(%rbp)

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 550: res.getData().reserve(len)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movq   32(%rbp), %rax
	pushq  %rax

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest70
	movq   $.stringlit1, %rsi
	movq   $550,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest70:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # getData()
	addq   $8,    %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest71
	movq   $.stringlit1, %rsi
	movq   $550,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest71:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # reserve()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy364
	cmpq   $0,    8(%rbx)
	jg     _destroy364
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy364:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 551: loop while idx < len  |
	# |                                                |
	# \************************************************/
_while13:
	pushq  32(%rbp)           # len
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	pushq  24(%rbp)           # pos
	movq   -24(%rbp), %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest72
	movq   $.stringlit1, %rsi
	movq   $552,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest72:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest73
	movq   $.stringlit1, %rsi
	movq   $552,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest73:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy365
	cmpq   $0,    8(%rbx)
	jg     _destroy365
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy365:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 553: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while13
_endwhile13:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 556: substring := res  |
	# |                                            |
	# \********************************************/
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy366
_destroy367:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy366
	cmpq   $0,    %rbx
	jne    _destroy367
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $556,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy366:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy368
	addq   $1,    8(%rcx)
_destroy368:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy369
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy369:
	addq   $8,    %rsp
	popq   -8(%rbp)           # substring

	# Garbage collection (locals)
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy370
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy370:
	addq   $8,    %rsp

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy371
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 560: res := new Vector  |
	# |                                             |
	# \*********************************************/
	movq   $3,    %rsi
	movq   $Vectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Vectorinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy372
_destroy373:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy372
	cmpq   $0,    %rbx
	jne    _destroy373
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $560,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy372:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy374
	addq   $1,    8(%rcx)
_destroy374:
	popq   -16(%rbp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 561: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -24(%rbp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 562: last := 0  |
	# |                                     |
	# \*************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 564: loop while idx < size()  |
	# |                                                   |
	# \***************************************************/
_while14:

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest74
	movq   $.stringlit1, %rsi
	movq   $564,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest74:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody14
	jmp    _endwhile14
_whilebody14:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 565: if charAt(idx) = 32 then  |
	# |                                                    |
	# \****************************************************/
	pushq  $32

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest75
	movq   $.stringlit1, %rsi
	movq   $565,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest75:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if15
	jmp    _else15
_if15:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 566: if idx - last > 1 then  |
	# |                                                  |
	# \**************************************************/
	pushq  $1
	pushq  -24(%rbp)          # idx
	movq   -32(%rbp), %rbx
	popq   %rax
	subq   %rbx,  %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	pushq  -24(%rbp)          # idx
	movq   -32(%rbp), %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -32(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest76
	movq   $.stringlit1, %rsi
	movq   $567,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest76:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   280(%rax), %rbx
	call   *%rbx              # substring()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy375
_destroy376:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy375
	cmpq   $0,    %rbx
	jne    _destroy376
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $567,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy375:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy377
	addq   $1,    8(%rcx)
_destroy377:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest77
	movq   $.stringlit1, %rsi
	movq   $567,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest77:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy378
	cmpq   $0,    8(%rbx)
	jg     _destroy378
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy378:
	jmp    _endif16
_else16:
_endif16:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 570: last := idx + 1  |
	# |                                           |
	# \*******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)
	jmp    _endif15
_else15:
_endif15:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 573: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while14
_endwhile14:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 575: if idx - last > 1 then  |
	# |                                                  |
	# \**************************************************/
	pushq  $1
	pushq  -24(%rbp)          # idx
	movq   -32(%rbp), %rbx
	popq   %rax
	subq   %rbx,  %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	pushq  -24(%rbp)          # idx
	movq   -32(%rbp), %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -32(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest78
	movq   $.stringlit1, %rsi
	movq   $576,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest78:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   280(%rax), %rbx
	call   *%rbx              # substring()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy379
_destroy380:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy379
	cmpq   $0,    %rbx
	jne    _destroy380
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $576,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy379:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy381
	addq   $1,    8(%rcx)
_destroy381:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest79
	movq   $.stringlit1, %rsi
	movq   $576,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest79:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy382
	cmpq   $0,    8(%rbx)
	jg     _destroy382
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy382:
	jmp    _endif17
_else17:
_endif17:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 579: split := res  |
	# |                                        |
	# \****************************************/
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy383
_destroy384:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy383
	cmpq   $0,    %rbx
	jne    _destroy384
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $579,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy383:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy385
	addq   $1,    8(%rcx)
_destroy385:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy386
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy386:
	addq   $8,    %rsp
	popq   -8(%rbp)           # split

	# Garbage collection (locals)
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy387
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy387:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy388
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 583: res := new String  |
	# |                                             |
	# \*********************************************/
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy389
_destroy390:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy389
	cmpq   $0,    %rbx
	jne    _destroy390
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $583,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy389:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy391
	addq   $1,    8(%rcx)
_destroy391:
	popq   -16(%rbp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 584: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -24(%rbp)

	# Statement list

	# /************************************************************\
	# |                                                            |
	# |  stdlib.floyd, line 586: loop while idx < data.size() - 1  |
	# |                                                            |
	# \************************************************************/
_while15:

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest80
	movq   $.stringlit1, %rsi
	movq   $586,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest80:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
.stringlit16:
	.string " "
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit16, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy392
_destroy393:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy392
	cmpq   $0,    %rbx
	jne    _destroy393
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy392:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy394
	addq   $1,    8(%rcx)
_destroy394:

	# Pushing caller

	# Pushing parameters

	# Pushing parameters

	# Pushing caller

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest81
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest81:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest82
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest82:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   32(%rax), %rbx
	call   *%rbx              # toString()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy395
_destroy396:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy395
	cmpq   $0,    %rbx
	jne    _destroy396
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy395:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy397
	addq   $1,    8(%rcx)
_destroy397:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest83
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest83:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest84
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest84:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy398
_destroy399:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy398
	cmpq   $0,    %rbx
	jne    _destroy399
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $587,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy398:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy400
	addq   $1,    8(%rcx)
_destroy400:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy401
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy401:
	addq   $8,    %rsp
	popq   -16(%rbp)          # res

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 588: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while15
_endwhile15:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 590: if data.size() > 0 then  |
	# |                                                   |
	# \***************************************************/
	pushq  $0

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest85
	movq   $.stringlit1, %rsi
	movq   $590,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest85:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest86
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest86:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest87
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest87:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest88
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest88:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   32(%rax), %rbx
	call   *%rbx              # toString()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy402
_destroy403:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy402
	cmpq   $0,    %rbx
	jne    _destroy403
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy402:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy404
	addq   $1,    8(%rcx)
_destroy404:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest89
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest89:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy405
_destroy406:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy405
	cmpq   $0,    %rbx
	jne    _destroy406
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $591,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy405:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy407
	addq   $1,    8(%rcx)
_destroy407:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy408
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy408:
	addq   $8,    %rsp
	popq   -16(%rbp)          # res
	jmp    _endif18
_else18:
_endif18:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 594: join := res  |
	# |                                       |
	# \***************************************/
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy409
_destroy410:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy409
	cmpq   $0,    %rbx
	jne    _destroy410
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $594,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy409:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy411
	addq   $1,    8(%rcx)
_destroy411:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy412
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy412:
	addq   $8,    %rsp
	popq   -8(%rbp)           # join

	# Garbage collection (locals)
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy413
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy413:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # data
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy414
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy414:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy415
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 598: start := 0  |
	# |                                      |
	# \**************************************/
	movq   $0,    -16(%rbp)

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 599: stop := size() - 1  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest90
	movq   $.stringlit1, %rsi
	movq   $599,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest90:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -24(%rbp)

	# Statement list

	# /****************************************************************************\
	# |                                                                            |
	# |  stdlib.floyd, line 601: loop while start < size() and charAt(start) = 32  |
	# |                                                                            |
	# \****************************************************************************/
_while16:

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest91
	movq   $.stringlit1, %rsi
	movq   $601,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest91:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $32

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest92
	movq   $.stringlit1, %rsi
	movq   $601,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest92:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody16
	jmp    _endwhile16
_whilebody16:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 602: start := start + 1  |
	# |                                              |
	# \**********************************************/
	pushq  -16(%rbp)          # start
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while16
_endwhile16:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 605: loop while stop > 0 and charAt(stop) = 32  |
	# |                                                                     |
	# \*********************************************************************/
_while17:
	pushq  $0
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $32

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest93
	movq   $.stringlit1, %rsi
	movq   $605,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest93:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody17
	jmp    _endwhile17
_whilebody17:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 606: stop := stop - 1  |
	# |                                            |
	# \********************************************/
	pushq  -24(%rbp)          # stop
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while17
_endwhile17:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 609: if start = size() then  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest94
	movq   $.stringlit1, %rsi
	movq   $609,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest94:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if19
	jmp    _else19
_if19:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 610: trim := ""  |
	# |                                      |
	# \**************************************/
	.section .rodata
.stringlit17:
	.string ""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit17, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy416
_destroy417:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy416
	cmpq   $0,    %rbx
	jne    _destroy417
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $610,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy416:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy418
	addq   $1,    8(%rcx)
_destroy418:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy419
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy419:
	addq   $8,    %rsp
	popq   -8(%rbp)           # trim
	jmp    _endif19
_else19:

	# /**********************************************************************\
	# |                                                                      |
	# |  stdlib.floyd, line 612: trim := substring(start, stop - start + 1)  |
	# |                                                                      |
	# \**********************************************************************/

	# Pushing parameters
	pushq  -24(%rbp)          # stop
	movq   -16(%rbp), %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest95
	movq   $.stringlit1, %rsi
	movq   $612,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest95:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   280(%rax), %rbx
	call   *%rbx              # substring()
	addq   $24,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy420
_destroy421:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy420
	cmpq   $0,    %rbx
	jne    _destroy421
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $612,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy420:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy422
	addq   $1,    8(%rcx)
_destroy422:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy423
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy423:
	addq   $8,    %rsp
	popq   -8(%rbp)           # trim
_endif19:

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy424
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $40,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 617: tmp: String := other  |
	# |                                                |
	# \************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy425
_destroy426:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy425
	cmpq   $0,    %rbx
	jne    _destroy426
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $617,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy425:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy427
	addq   $1,    8(%rcx)
_destroy427:
	popq   -16(%rbp)          # tmp

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 618: amt := tmp.toInt()  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest96
	movq   $.stringlit1, %rsi
	movq   $618,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest96:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   264(%rax), %rbx
	call   *%rbx              # toInt()
	addq   $8,    %rsp
	movq   %rax,  -24(%rbp)

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 619: res := copy()  |
	# |                                         |
	# \*****************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest97
	movq   $.stringlit1, %rsi
	movq   $619,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest97:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # copy()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy428
_destroy429:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy428
	cmpq   $0,    %rbx
	jne    _destroy429
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $619,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy428:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy430
	addq   $1,    8(%rcx)
_destroy430:
	popq   -32(%rbp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 620: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -40(%rbp)

	# Statement list

	# /********************************************************************\
	# |                                                                    |
	# |  stdlib.floyd, line 622: res.getData().reserve(data.size() * amt)  |
	# |                                                                    |
	# \********************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest98
	movq   $.stringlit1, %rsi
	movq   $622,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest98:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movq   -32(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest99
	movq   $.stringlit1, %rsi
	movq   $622,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest99:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # getData()
	addq   $8,    %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest100
	movq   $.stringlit1, %rsi
	movq   $622,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest100:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # reserve()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy431
	cmpq   $0,    8(%rbx)
	jg     _destroy431
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy431:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 623: loop while idx < amt  |
	# |                                                |
	# \************************************************/
_while18:
	pushq  -24(%rbp)          # amt
	movq   -40(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody18
	jmp    _endwhile18
_whilebody18:

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 624: res.getData().insert(data)  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # data
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy432
_destroy433:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy432
	cmpq   $0,    %rbx
	jne    _destroy433
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $624,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy432:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy434
	addq   $1,    8(%rcx)
_destroy434:

	# Pushing caller

	# Pushing parameters

	# Pushing caller
	movq   -32(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest101
	movq   $.stringlit1, %rsi
	movq   $624,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest101:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # getData()
	addq   $8,    %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest102
	movq   $.stringlit1, %rsi
	movq   $624,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest102:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   224(%rax), %rbx
	call   *%rbx              # insert()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy435
	cmpq   $0,    8(%rbx)
	jg     _destroy435
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy435:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 625: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -40(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -40(%rbp)
	jmp    _while18
_endwhile18:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 628: _mul_ := res  |
	# |                                        |
	# \****************************************/
	pushq  -32(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy436
_destroy437:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy436
	cmpq   $0,    %rbx
	jne    _destroy437
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $628,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy436:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy438
	addq   $1,    8(%rcx)
_destroy438:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy439
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy439:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _mul_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy440
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy440:
	addq   $8,    %rsp
	pushq  -32(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy441
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy441:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy442
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy442:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy443
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy444
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy444
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy444:
	leave
	ret

.global Writername
	.type  Writername, @function
Writername:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit14, %rax
	leave
	ret

.global Writer_type
	.type  Writer_type, @function
Writer_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 646: io_write(char)  |
	# |                                          |
	# \******************************************/

	# Pushing parameters
	movq   24(%rbp), %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest103
	movq   $.stringlit1, %rsi
	movq   $646,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest103:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 647: writechar := me  |
	# |                                           |
	# \*******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy445
_destroy446:
	movq   (%rbx), %rbx
	cmpq   $Writervtable, %rbx
	je     _destroy445
	cmpq   $0,    %rbx
	jne    _destroy446
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit14, %rdx
	movq   $.stringlit1, %rsi
	movq   $647,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy445:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy447
	addq   $1,    8(%rcx)
_destroy447:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy448
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy448:
	addq   $8,    %rsp
	popq   -8(%rbp)           # writechar

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy449
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 653: digit: int  |
	# |                                      |
	# \**************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*******************************************************************************\
	# |                                                                               |
	# |  stdlib.floyd, line 655: digit := num - (num / 10)* 10  ~ compute num mod 10  |
	# |                                                                               |
	# \*******************************************************************************/
	pushq  24(%rbp)           # num
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	pushq  %rax
	movq   $10,   %rbx
	popq   %rax
	imulq  %rbx,  %rax
	movq   %rax,  %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -16(%rbp)

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 656: if num / 10 > 0 then  |
	# |                                                |
	# \************************************************/
	pushq  $0
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if20
	jmp    _else20
_if20:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 657: writeintHelper(num / 10)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # num
	movq   $10,   %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest104
	movq   $.stringlit1, %rsi
	movq   $657,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest104:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # writeintHelper()
	addq   $16,   %rsp
	jmp    _endif20
_else20:
_endif20:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 659: io_write(digit + 48)  |
	# |                                                |
	# \************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # digit
	movq   $48,   %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest105
	movq   $.stringlit1, %rsi
	movq   $659,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest105:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# Garbage collection (locals)

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 665: if (num = 0) then  |
	# |                                             |
	# \*********************************************/
	pushq  $0
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if21
	jmp    _else21
_if21:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 666: io_write(48)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movq   $48,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest106
	movq   $.stringlit1, %rsi
	movq   $666,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest106:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()
	jmp    _endif21
_else21:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 668: if not (num >= 0) then  |
	# |                                                  |
	# \**************************************************/
	pushq  $0
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if22
	jmp    _else22
_if22:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 669: io_write(45) ~ - symbol  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	movq   $45,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest107
	movq   $.stringlit1, %rsi
	movq   $669,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest107:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 670: num := -num  |
	# |                                       |
	# \***************************************/
	movq   24(%rbp), %rax
	negq   %rax
	movq   %rax,  24(%rbp)
	jmp    _endif22
_else22:
_endif22:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 672: writeintHelper(num)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	movq   24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest108
	movq   $.stringlit1, %rsi
	movq   $672,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest108:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   176(%rax), %rbx
	call   *%rbx              # writeintHelper()
	addq   $16,   %rsp
_endif21:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 675: io_write(13)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movq   $13,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest109
	movq   $.stringlit1, %rsi
	movq   $675,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest109:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 676: io_write(10)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movq   $10,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest110
	movq   $.stringlit1, %rsi
	movq   $676,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest110:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 678: writeint := me  |
	# |                                          |
	# \******************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy450
_destroy451:
	movq   (%rbx), %rbx
	cmpq   $Writervtable, %rbx
	je     _destroy450
	cmpq   $0,    %rbx
	jne    _destroy451
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit14, %rdx
	movq   $.stringlit1, %rsi
	movq   $678,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy450:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy452
	addq   $1,    8(%rcx)
_destroy452:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy453
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy453:
	addq   $8,    %rsp
	popq   -8(%rbp)           # writeint

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy454
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /**********************************\
	# |                                  |
	# |  stdlib.floyd, line 683: i := 0  |
	# |                                  |
	# \**********************************/
	movq   $0,    -16(%rbp)

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 684: len := str.length()  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest111
	movq   $.stringlit1, %rsi
	movq   $684,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest111:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # length()
	addq   $8,    %rsp
	movq   %rax,  -24(%rbp)

	# Statement list

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 686: loop while not (i >= len)  |
	# |                                                     |
	# \*****************************************************/
_while19:
	pushq  -24(%rbp)          # len
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
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
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest112
	movq   $.stringlit1, %rsi
	movq   $687,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest112:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   240(%rax), %rbx
	call   *%rbx              # charAt()
	addq   $16,   %rsp
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest113
	movq   $.stringlit1, %rsi
	movq   $687,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest113:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 688: i := i + 1  |
	# |                                      |
	# \**************************************/
	pushq  -16(%rbp)          # i
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while19
_endwhile19:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 691: write := me  |
	# |                                       |
	# \***************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy455
_destroy456:
	movq   (%rbx), %rbx
	cmpq   $Writervtable, %rbx
	je     _destroy455
	cmpq   $0,    %rbx
	jne    _destroy456
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit14, %rdx
	movq   $.stringlit1, %rsi
	movq   $691,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy455:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy457
	addq   $1,    8(%rcx)
_destroy457:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy458
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy458:
	addq   $8,    %rsp
	popq   -8(%rbp)           # write

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy459
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy459:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy460
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 697: write(str)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy461
_destroy462:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy461
	cmpq   $0,    %rbx
	jne    _destroy462
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $697,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy461:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy463
	addq   $1,    8(%rcx)
_destroy463:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest114
	movq   $.stringlit1, %rsi
	movq   $697,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest114:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy464
	cmpq   $0,    8(%rbx)
	jg     _destroy464
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy464:

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 698: io_write(13)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movq   $13,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest115
	movq   $.stringlit1, %rsi
	movq   $698,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest115:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 699: io_write(10)  |
	# |                                        |
	# \****************************************/

	# Pushing parameters
	movq   $10,   %rax
	movq   %rax,  %rsi

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest116
	movq   $.stringlit1, %rsi
	movq   $699,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest116:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_write()

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 700: writeln := me  |
	# |                                         |
	# \*****************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy465
_destroy466:
	movq   (%rbx), %rbx
	cmpq   $Writervtable, %rbx
	je     _destroy465
	cmpq   $0,    %rbx
	jne    _destroy466
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit14, %rdx
	movq   $.stringlit1, %rsi
	movq   $700,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy465:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy467
	addq   $1,    8(%rcx)
_destroy467:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy468
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy468:
	addq   $8,    %rsp
	popq   -8(%rbp)           # writeln

	# Garbage collection (args)
	pushq  24(%rbp)           # str
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy469
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy469:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy470
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 705: write(o.toString())  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest117
	movq   $.stringlit1, %rsi
	movq   $705,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest117:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   32(%rax), %rbx
	call   *%rbx              # toString()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy471
_destroy472:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy471
	cmpq   $0,    %rbx
	jne    _destroy472
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $705,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy471:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy473
	addq   $1,    8(%rcx)
_destroy473:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest118
	movq   $.stringlit1, %rsi
	movq   $705,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest118:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy474
	cmpq   $0,    8(%rbx)
	jg     _destroy474
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy474:

	# Garbage collection (args)
	pushq  24(%rbp)           # o
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy475
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy475:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 709: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 711: loop while idx < v.size() - 1  |
	# |                                                         |
	# \*********************************************************/
_while20:

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest119
	movq   $.stringlit1, %rsi
	movq   $711,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest119:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest120
	movq   $.stringlit1, %rsi
	movq   $712,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest120:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy476
_destroy477:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy476
	cmpq   $0,    %rbx
	jne    _destroy477
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $712,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy476:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy478
	addq   $1,    8(%rcx)
_destroy478:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest121
	movq   $.stringlit1, %rsi
	movq   $712,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest121:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # writeObject()
	addq   $16,   %rsp

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 713: write(sep)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushq  32(%rbp)           # sep
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy479
_destroy480:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy479
	cmpq   $0,    %rbx
	jne    _destroy480
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $713,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy479:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy481
	addq   $1,    8(%rcx)
_destroy481:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest122
	movq   $.stringlit1, %rsi
	movq   $713,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest122:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy482
	cmpq   $0,    8(%rbx)
	jg     _destroy482
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy482:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 714: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while20
_endwhile20:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 716: if v.size() > 0 then  |
	# |                                                |
	# \************************************************/
	pushq  $0

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest123
	movq   $.stringlit1, %rsi
	movq   $716,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest123:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest124
	movq   $.stringlit1, %rsi
	movq   $717,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest124:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest125
	movq   $.stringlit1, %rsi
	movq   $717,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest125:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy483
_destroy484:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy483
	cmpq   $0,    %rbx
	jne    _destroy484
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $717,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy483:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy485
	addq   $1,    8(%rcx)
_destroy485:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest126
	movq   $.stringlit1, %rsi
	movq   $717,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest126:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   208(%rax), %rbx
	call   *%rbx              # writeObject()
	addq   $16,   %rsp

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 718: write("\n")  |
	# |                                       |
	# \***************************************/

	# Pushing parameters
	.section .rodata
.stringlit18:
	.string "\n"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit18, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy486
_destroy487:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy486
	cmpq   $0,    %rbx
	jne    _destroy487
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $718,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy486:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy488
	addq   $1,    8(%rcx)
_destroy488:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest127
	movq   $.stringlit1, %rsi
	movq   $718,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest127:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy489
	cmpq   $0,    8(%rbx)
	jg     _destroy489
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy489:
	jmp    _endif23
_else23:
_endif23:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # v
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy490
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy490:
	addq   $8,    %rsp
	pushq  32(%rbp)           # sep
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy491
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy491:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 723: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -16(%rbp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 725: loop while idx < v.size() - 1  |
	# |                                                         |
	# \*********************************************************/
_while21:

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest128
	movq   $.stringlit1, %rsi
	movq   $725,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest128:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest129
	movq   $.stringlit1, %rsi
	movq   $726,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest129:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest130
	movq   $.stringlit1, %rsi
	movq   $726,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest130:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   232(%rax), %rbx
	call   *%rbx              # catInt()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy492
_destroy493:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy492
	cmpq   $0,    %rbx
	jne    _destroy493
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $726,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy492:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy494
	addq   $1,    8(%rcx)
_destroy494:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest131
	movq   $.stringlit1, %rsi
	movq   $726,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest131:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy495
	cmpq   $0,    8(%rbx)
	jg     _destroy495
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy495:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 727: write(sep)  |
	# |                                      |
	# \**************************************/

	# Pushing parameters
	pushq  32(%rbp)           # sep
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy496
_destroy497:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy496
	cmpq   $0,    %rbx
	jne    _destroy497
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $727,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy496:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy498
	addq   $1,    8(%rcx)
_destroy498:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest132
	movq   $.stringlit1, %rsi
	movq   $727,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest132:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # write()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy499
	cmpq   $0,    8(%rbx)
	jg     _destroy499
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy499:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 728: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while21
_endwhile21:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 730: if v.size() > 0 then  |
	# |                                                |
	# \************************************************/
	pushq  $0

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest133
	movq   $.stringlit1, %rsi
	movq   $730,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest133:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setg   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest134
	movq   $.stringlit1, %rsi
	movq   $731,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest134:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   $1,    %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest135
	movq   $.stringlit1, %rsi
	movq   $731,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest135:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest136
	movq   $.stringlit1, %rsi
	movq   $731,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest136:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   232(%rax), %rbx
	call   *%rbx              # catInt()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy500
_destroy501:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy500
	cmpq   $0,    %rbx
	jne    _destroy501
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $731,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy500:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy502
	addq   $1,    8(%rcx)
_destroy502:

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest137
	movq   $.stringlit1, %rsi
	movq   $731,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest137:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy503
	cmpq   $0,    8(%rbx)
	jg     _destroy503
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy503:
	jmp    _endif24
_else24:
_endif24:

	# Garbage collection (locals)

	# Garbage collection (args)
	pushq  24(%rbp)           # v
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy504
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy504:
	addq   $8,    %rsp
	pushq  32(%rbp)           # sep
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy505
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy505:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy506
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy506
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy506:
	leave
	ret

.global Readername
	.type  Readername, @function
Readername:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit4, %rax
	leave
	ret

.global Reader_type
	.type  Reader_type, @function
Reader_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 748: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest138
	movq   $.stringlit1, %rsi
	movq   $748,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest138:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	movq   %rax,  -16(%rbp)

	# Statement list

	# /**************************************************************************************\
	# |                                                                                      |
	# |  stdlib.floyd, line 750: loop while char = 10 or char = 13 or char = 32 or char = 8  |
	# |                                                                                      |
	# \**************************************************************************************/
_while22:
	pushq  $10
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $13
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	pushq  %rax
	pushq  $32
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	pushq  %rax
	pushq  $8
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	cmpq   $0,    %rax
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
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest139
	movq   $.stringlit1, %rsi
	movq   $751,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest139:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	movq   %rax,  -16(%rbp)
	jmp    _while22
_endwhile22:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 753: skipWS := char  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # char
	popq   -8(%rbp)           # skipWS

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 757: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest140
	movq   $.stringlit1, %rsi
	movq   $757,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest140:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	movq   %rax,  -16(%rbp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 758: s := new String  |
	# |                                           |
	# \*******************************************/
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy507
_destroy508:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy507
	cmpq   $0,    %rbx
	jne    _destroy508
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $758,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy507:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy509
	addq   $1,    8(%rcx)
_destroy509:
	popq   -24(%rbp)          # s

	# Statement list

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 760: loop while not (char = 10)  |
	# |                                                      |
	# \******************************************************/
_while23:
	pushq  $10
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _whilebody23
	jmp    _endwhile23
_whilebody23:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 761: if not (char = 13) then  |
	# |                                                   |
	# \***************************************************/
	pushq  $13
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	cmpq   $0,    %rax
	jne    _if25
	jmp    _else25
_if25:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 762: s.appendChar(char)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   -24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest141
	movq   $.stringlit1, %rsi
	movq   $762,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest141:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy510
	cmpq   $0,    8(%rbx)
	jg     _destroy510
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
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
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest142
	movq   $.stringlit1, %rsi
	movq   $764,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest142:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	movq   %rax,  -16(%rbp)
	jmp    _while23
_endwhile23:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 767: readline := s  |
	# |                                         |
	# \*****************************************/
	pushq  -24(%rbp)          # s
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy511
_destroy512:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy511
	cmpq   $0,    %rbx
	jne    _destroy512
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $767,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy511:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy513
	addq   $1,    8(%rcx)
_destroy513:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy514
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy514:
	addq   $8,    %rsp
	popq   -8(%rbp)           # readline

	# Garbage collection (locals)
	pushq  -24(%rbp)          # s
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy515
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy515:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy516
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 771: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest143
	movq   $.stringlit1, %rsi
	movq   $771,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest143:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # skipWS()
	addq   $8,    %rsp
	movq   %rax,  -16(%rbp)

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 772: s := new String  |
	# |                                           |
	# \*******************************************/
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy517
_destroy518:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy517
	cmpq   $0,    %rbx
	jne    _destroy518
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $772,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy517:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy519
	addq   $1,    8(%rcx)
_destroy519:
	popq   -24(%rbp)          # s

	# Statement list

	# /*********************************************************************************************\
	# |                                                                                             |
	# |  stdlib.floyd, line 774: loop while char != 10 and char != 13 and char != 32 and char != 8  |
	# |                                                                                             |
	# \*********************************************************************************************/
_while24:
	pushq  $10
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $13
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	pushq  %rax
	pushq  $32
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	pushq  %rax
	pushq  $8
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody24
	jmp    _endwhile24
_whilebody24:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 775: s.appendChar(char)  |
	# |                                              |
	# \**********************************************/

	# Pushing parameters
	movq   -16(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   -24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest144
	movq   $.stringlit1, %rsi
	movq   $775,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest144:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   192(%rax), %rbx
	call   *%rbx              # appendChar()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy520
	cmpq   $0,    8(%rbx)
	jg     _destroy520
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy520:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 776: char := io_read()  |
	# |                                             |
	# \*********************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest145
	movq   $.stringlit1, %rsi
	movq   $776,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest145:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	movq   %rax,  -16(%rbp)
	jmp    _while24
_endwhile24:

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 779: read := s  |
	# |                                     |
	# \*************************************/
	pushq  -24(%rbp)          # s
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy521
_destroy522:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy521
	cmpq   $0,    %rbx
	jne    _destroy522
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $779,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy521:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy523
	addq   $1,    8(%rcx)
_destroy523:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy524
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy524:
	addq   $8,    %rsp
	popq   -8(%rbp)           # read

	# Garbage collection (locals)
	pushq  -24(%rbp)          # s
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy525
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy525:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy526
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 783: char := skipWS()  |
	# |                                            |
	# \********************************************/

	# Pushing parameters

	# Pushing caller
	pushq  16(%rbp)

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest146
	movq   $.stringlit1, %rsi
	movq   $783,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest146:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # skipWS()
	addq   $8,    %rsp
	movq   %rax,  -16(%rbp)

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 784: mult := 1  |
	# |                                     |
	# \*************************************/
	movq   $1,    -24(%rbp)

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 785: num := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 787: if char = 45 then  |
	# |                                             |
	# \*********************************************/
	pushq  $45
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if26
	jmp    _else26
_if26:

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 788: mult := -1  |
	# |                                      |
	# \**************************************/
	movq   $-1,   -24(%rbp)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 789: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest147
	movq   $.stringlit1, %rsi
	movq   $789,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest147:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	pushq  %rax
	movq   $48,   %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _endif26
_else26:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 791: char := char - 48  |
	# |                                             |
	# \*********************************************/
	pushq  -16(%rbp)          # char
	movq   $48,   %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
_endif26:

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 794: loop while char >= 0 and not (char >= 10)  |
	# |                                                                     |
	# \*********************************************************************/
_while25:
	pushq  $0
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $10
	movq   -16(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setge  %al
	movzbq %al,   %rax
	xorq   $1,    %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	cmpq   $0,    %rax
	jne    _whilebody25
	jmp    _endwhile25
_whilebody25:

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 795: num := num * 10 + char  |
	# |                                                  |
	# \**************************************************/
	pushq  -32(%rbp)          # num
	movq   $10,   %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax
	movq   -16(%rbp), %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -32(%rbp)

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 796: char := io_read() - 48  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movq   16(%rbp), %rdi

	# Performing null checks
	movq   %rdi,  %rbx
	cmpq   $0,    %rbx
	jne    _nulltest148
	movq   $.stringlit1, %rsi
	movq   $796,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest148:

	# Garbage collection (caller)
	movq   %rdi,  %rcx        # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   %rdi,  %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # io_read()
	pushq  %rax
	movq   $48,   %rbx
	popq   %rax
	subq   %rbx,  %rax
	movq   %rax,  -16(%rbp)
	jmp    _while25
_endwhile25:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 799: readint := num * mult  |
	# |                                                 |
	# \*************************************************/
	pushq  -32(%rbp)          # num
	movq   -24(%rbp), %rbx
	popq   %rax
	imulq  %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 812: _val := 0  |
	# |                                     |
	# \*************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # _val
	leave
	ret

.global Integerdestroy
	.type  Integerdestroy, @function
Integerdestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy527
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy527
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy527:
	leave
	ret

.global Integername
	.type  Integername, @function
Integername:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit7, %rax
	leave
	ret

.global Integer_type
	.type  Integer_type, @function
Integer_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 816: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushq  24(%rbp)           # newVal
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # _val

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 817: init := me  |
	# |                                      |
	# \**************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy528
_destroy529:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy528
	cmpq   $0,    %rbx
	jne    _destroy529
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $817,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy528:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy530
	addq   $1,    8(%rcx)
_destroy530:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy531
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy531:
	addq   $8,    %rsp
	popq   -8(%rbp)           # init

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy532
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 822: toString := new String.catInt(_val)  |
	# |                                                               |
	# \***************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Stringvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Stringinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest149
	movq   $.stringlit1, %rsi
	movq   $822,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest149:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   232(%rax), %rbx
	call   *%rbx              # catInt()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy533
_destroy534:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy533
	cmpq   $0,    %rbx
	jne    _destroy534
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $822,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy533:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy535
	addq   $1,    8(%rcx)
_destroy535:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy536
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy536:
	addq   $8,    %rsp
	popq   -8(%rbp)           # toString

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy537
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 827: val := _val  |
	# |                                       |
	# \***************************************/
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val
	popq   -8(%rbp)           # val

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 831: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy538
_destroy539:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy538
	cmpq   $0,    %rbx
	jne    _destroy539
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $831,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy538:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy540
	addq   $1,    8(%rcx)
_destroy540:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 833: _lt_ := _val < tmp.val()  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest150
	movq   $.stringlit1, %rsi
	movq   $833,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest150:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	pushq  %rax
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy541
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy541:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy542
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy542:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 837: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy543
_destroy544:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy543
	cmpq   $0,    %rbx
	jne    _destroy544
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $837,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy543:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy545
	addq   $1,    8(%rcx)
_destroy545:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 839: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest151
	movq   $.stringlit1, %rsi
	movq   $839,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest151:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	pushq  %rax
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy546
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy546:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy547
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy547:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 843: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy548
_destroy549:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy548
	cmpq   $0,    %rbx
	jne    _destroy549
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $843,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy548:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy550
	addq   $1,    8(%rcx)
_destroy550:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /*****************************************************************\
	# |                                                                 |
	# |  stdlib.floyd, line 845: _and_ := _val != 0 and tmp.val() != 0  |
	# |                                                                 |
	# \*****************************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $0

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest152
	movq   $.stringlit1, %rsi
	movq   $845,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest152:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	andq   %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy551
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy551:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy552
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy552:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 849: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy553
_destroy554:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy553
	cmpq   $0,    %rbx
	jne    _destroy554
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $849,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy553:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy555
	addq   $1,    8(%rcx)
_destroy555:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /***************************************************************\
	# |                                                               |
	# |  stdlib.floyd, line 851: _or_ := _val != 0 or tmp.val() != 0  |
	# |                                                               |
	# \***************************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $0

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest153
	movq   $.stringlit1, %rsi
	movq   $851,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest153:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	popq   %rbx
	cmpq   %rbx,  %rax
	setne  %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy556
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy556:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy557
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy557:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 855: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy558
_destroy559:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy558
	cmpq   $0,    %rbx
	jne    _destroy559
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $855,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy558:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy560
	addq   $1,    8(%rcx)
_destroy560:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 857: _add_ := new Integer.init(_val + tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest154
	movq   $.stringlit1, %rsi
	movq   $857,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest154:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	movq   %rax,  %rbx
	popq   %rax
	addq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Integervtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Integerinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest155
	movq   $.stringlit1, %rsi
	movq   $857,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest155:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy561
_destroy562:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy561
	cmpq   $0,    %rbx
	jne    _destroy562
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $857,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy561:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy563
	addq   $1,    8(%rcx)
_destroy563:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy564
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy564:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _add_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy565
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy565:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy566
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy566:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy567
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 861: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy568
_destroy569:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy568
	cmpq   $0,    %rbx
	jne    _destroy569
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $861,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy568:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy570
	addq   $1,    8(%rcx)
_destroy570:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 863: _sub_ := new Integer.init(_val - tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest156
	movq   $.stringlit1, %rsi
	movq   $863,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest156:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	movq   %rax,  %rbx
	popq   %rax
	subq   %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Integervtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Integerinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest157
	movq   $.stringlit1, %rsi
	movq   $863,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest157:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy571
_destroy572:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy571
	cmpq   $0,    %rbx
	jne    _destroy572
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $863,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy571:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy573
	addq   $1,    8(%rcx)
_destroy573:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy574
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy574:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _sub_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy575
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy575:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy576
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy576:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy577
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 867: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy578
_destroy579:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy578
	cmpq   $0,    %rbx
	jne    _destroy579
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $867,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy578:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy580
	addq   $1,    8(%rcx)
_destroy580:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 869: _mul_ := new Integer.init(_val * tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest158
	movq   $.stringlit1, %rsi
	movq   $869,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest158:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	movq   %rax,  %rbx
	popq   %rax
	imulq  %rbx,  %rax
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Integervtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Integerinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest159
	movq   $.stringlit1, %rsi
	movq   $869,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest159:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy581
_destroy582:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy581
	cmpq   $0,    %rbx
	jne    _destroy582
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $869,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy581:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy583
	addq   $1,    8(%rcx)
_destroy583:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy584
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy584:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _mul_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy585
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy585:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy586
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy586:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy587
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 873: tmp: Integer := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy588
_destroy589:
	movq   (%rbx), %rbx
	cmpq   $Integervtable, %rbx
	je     _destroy588
	cmpq   $0,    %rbx
	jne    _destroy589
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit7, %rdx
	movq   $.stringlit1, %rsi
	movq   $873,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy588:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy590
	addq   $1,    8(%rcx)
_destroy590:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /***********************************************************************\
	# |                                                                       |
	# |  stdlib.floyd, line 875: _div_ := new Integer.init(_val / tmp.val())  |
	# |                                                                       |
	# \***********************************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest160
	movq   $.stringlit1, %rsi
	movq   $875,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest160:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	movq   %rax,  %rbx
	popq   %rax
	pushq  %rdx
	movq   $0,    %rdx
	idivq  %rbx
	popq   %rdx
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Integervtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Integerinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest161
	movq   $.stringlit1, %rsi
	movq   $875,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest161:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy591
_destroy592:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy591
	cmpq   $0,    %rbx
	jne    _destroy592
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $875,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy591:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy593
	addq   $1,    8(%rcx)
_destroy593:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy594
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy594:
	addq   $8,    %rsp
	popq   -8(%rbp)           # _div_

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy595
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy595:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy596
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy596:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy597
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 886: _val := false  |
	# |                                         |
	# \*****************************************/
	pushq  $0
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # _val
	leave
	ret

.global Booleandestroy
	.type  Booleandestroy, @function
Booleandestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy598
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy598
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy598:
	leave
	ret

.global Booleanname
	.type  Booleanname, @function
Booleanname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit10, %rax
	leave
	ret

.global Boolean_type
	.type  Boolean_type, @function
Boolean_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 890: _val := newVal  |
	# |                                          |
	# \******************************************/
	pushq  24(%rbp)           # newVal
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # _val

	# /**************************************\
	# |                                      |
	# |  stdlib.floyd, line 891: init := me  |
	# |                                      |
	# \**************************************/
	pushq  16(%rbp)
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy599
_destroy600:
	movq   (%rbx), %rbx
	cmpq   $Booleanvtable, %rbx
	je     _destroy599
	cmpq   $0,    %rbx
	jne    _destroy600
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit10, %rdx
	movq   $.stringlit1, %rsi
	movq   $891,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy599:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy601
	addq   $1,    8(%rcx)
_destroy601:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy602
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy602:
	addq   $8,    %rsp
	popq   -8(%rbp)           # init

	# Garbage collection (args)

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy603
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 896: val := _val  |
	# |                                       |
	# \***************************************/
	movq   16(%rbp), %rbx
	pushq  32(%rbx)           # _val
	popq   -8(%rbp)           # val

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 901: if _val then  |
	# |                                        |
	# \****************************************/
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	cmpq   $0,    %rax
	jne    _if27
	jmp    _else27
_if27:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 902: toString := "true"  |
	# |                                              |
	# \**********************************************/
	.section .rodata
.stringlit19:
	.string "true"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit19, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy604
_destroy605:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy604
	cmpq   $0,    %rbx
	jne    _destroy605
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $902,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy604:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy606
	addq   $1,    8(%rcx)
_destroy606:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy607
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy607:
	addq   $8,    %rsp
	popq   -8(%rbp)           # toString
	jmp    _endif27
_else27:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 904: toString := "false"  |
	# |                                               |
	# \***********************************************/
	.section .rodata
.stringlit20:
	.string "false"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit20, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy608
_destroy609:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy608
	cmpq   $0,    %rbx
	jne    _destroy609
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $904,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy608:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy610
	addq   $1,    8(%rcx)
_destroy610:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy611
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy611:
	addq   $8,    %rsp
	popq   -8(%rbp)           # toString
_endif27:

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy612
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $16,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 909: tmp: Boolean := other  |
	# |                                                 |
	# \*************************************************/
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy613
_destroy614:
	movq   (%rbx), %rbx
	cmpq   $Booleanvtable, %rbx
	je     _destroy613
	cmpq   $0,    %rbx
	jne    _destroy614
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit10, %rdx
	movq   $.stringlit1, %rsi
	movq   $909,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy613:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy615
	addq   $1,    8(%rcx)
_destroy615:
	popq   -16(%rbp)          # tmp

	# Statement list

	# /**************************************************\
	# |                                                  |
	# |  stdlib.floyd, line 911: eq := _val = tmp.val()  |
	# |                                                  |
	# \**************************************************/

	# Pushing parameters

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest162
	movq   $.stringlit1, %rsi
	movq   $911,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest162:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # val()
	addq   $8,    %rsp
	pushq  %rax
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  -8(%rbp)

	# Garbage collection (locals)
	pushq  -16(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy616
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy616:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # other
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy617
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy617:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy618
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy618
	pushq  %rbx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy619
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy619:
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy620
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy620:
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy621
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy621:
	movq   16(%rbp), %rbx
	movq   56(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy622
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy622:
	popq   %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy618:
	leave
	ret

.global Mapname
	.type  Mapname, @function
Mapname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit12, %rax
	leave
	ret

.global Map_type
	.type  Map_type, @function
Map_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 929: if newKey = null then  |
	# |                                                 |
	# \*************************************************/
	pushq  $0
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
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
	pushq  $0
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if29
	jmp    _else29
_if29:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 932: _key := newKey  |
	# |                                          |
	# \******************************************/
	pushq  24(%rbp)           # newKey
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy623
_destroy624:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy623
	cmpq   $0,    %rbx
	jne    _destroy624
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $932,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy623:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy625
	addq   $1,    8(%rcx)
_destroy625:
	movq   16(%rbp), %rcx
	pushq  48(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy626
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy626:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   48(%rcx)           # _key

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 933: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushq  32(%rbp)           # newValue
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy627
_destroy628:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy627
	cmpq   $0,    %rbx
	jne    _destroy628
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $933,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy627:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy629
	addq   $1,    8(%rcx)
_destroy629:
	movq   16(%rbp), %rcx
	pushq  56(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy630
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy630:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   56(%rcx)           # _value
	jmp    _endif29
_else29:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 935: if newKey < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # _key
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy631
_destroy632:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy631
	cmpq   $0,    %rbx
	jne    _destroy632
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $935,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy631:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy633
	addq   $1,    8(%rcx)
_destroy633:

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest163
	movq   $.stringlit1, %rsi
	movq   $935,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest163:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   64(%rax), %rbx
	call   *%rbx              # _lt_()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _if30
	jmp    _else30
_if30:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 936: if _left = null then  |
	# |                                                |
	# \************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if31
	jmp    _else31
_if31:

	# /********************************************\
	# |                                            |
	# |  stdlib.floyd, line 937: _left := new Map  |
	# |                                            |
	# \********************************************/
	movq   $4,    %rsi
	movq   $Mapvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy634
_destroy635:
	movq   (%rbx), %rbx
	cmpq   $Mapvtable, %rbx
	je     _destroy634
	cmpq   $0,    %rbx
	jne    _destroy635
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit12, %rdx
	movq   $.stringlit1, %rsi
	movq   $937,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy634:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy636
	addq   $1,    8(%rcx)
_destroy636:
	movq   16(%rbp), %rcx
	pushq  32(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy637
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy637:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # _left
	jmp    _endif31
_else31:
_endif31:

	# /**********************************************************\
	# |                                                          |
	# |  stdlib.floyd, line 939: _left.insert(newKey, newValue)  |
	# |                                                          |
	# \**********************************************************/

	# Pushing parameters
	pushq  32(%rbp)           # newValue
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy638
_destroy639:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy638
	cmpq   $0,    %rbx
	jne    _destroy639
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $939,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy638:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy640
	addq   $1,    8(%rcx)
_destroy640:
	pushq  24(%rbp)           # newKey
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy641
_destroy642:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy641
	cmpq   $0,    %rbx
	jne    _destroy642
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $939,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy641:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy643
	addq   $1,    8(%rcx)
_destroy643:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest164
	movq   $.stringlit1, %rsi
	movq   $939,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest164:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # insert()
	addq   $24,   %rsp
	jmp    _endif30
_else30:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 941: if newKey > _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # _key
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy644
_destroy645:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy644
	cmpq   $0,    %rbx
	jne    _destroy645
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $941,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy644:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy646
	addq   $1,    8(%rcx)
_destroy646:

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest165
	movq   $.stringlit1, %rsi
	movq   $941,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest165:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   88(%rax), %rbx
	call   *%rbx              # _gt_()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _if32
	jmp    _else32
_if32:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 942: if _right = null then  |
	# |                                                 |
	# \*************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if33
	jmp    _else33
_if33:

	# /*********************************************\
	# |                                             |
	# |  stdlib.floyd, line 943: _right := new Map  |
	# |                                             |
	# \*********************************************/
	movq   $4,    %rsi
	movq   $Mapvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy647
_destroy648:
	movq   (%rbx), %rbx
	cmpq   $Mapvtable, %rbx
	je     _destroy647
	cmpq   $0,    %rbx
	jne    _destroy648
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit12, %rdx
	movq   $.stringlit1, %rsi
	movq   $943,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy647:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy649
	addq   $1,    8(%rcx)
_destroy649:
	movq   16(%rbp), %rcx
	pushq  40(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy650
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy650:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   40(%rcx)           # _right
	jmp    _endif33
_else33:
_endif33:

	# /***********************************************************\
	# |                                                           |
	# |  stdlib.floyd, line 945: _right.insert(newKey, newValue)  |
	# |                                                           |
	# \***********************************************************/

	# Pushing parameters
	pushq  32(%rbp)           # newValue
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy651
_destroy652:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy651
	cmpq   $0,    %rbx
	jne    _destroy652
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $945,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy651:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy653
	addq   $1,    8(%rcx)
_destroy653:
	pushq  24(%rbp)           # newKey
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy654
_destroy655:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy654
	cmpq   $0,    %rbx
	jne    _destroy655
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $945,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy654:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy656
	addq   $1,    8(%rcx)
_destroy656:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest166
	movq   $.stringlit1, %rsi
	movq   $945,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest166:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # insert()
	addq   $24,   %rsp
	jmp    _endif32
_else32:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 947: _value := newValue  |
	# |                                              |
	# \**********************************************/
	pushq  32(%rbp)           # newValue
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy657
_destroy658:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy657
	cmpq   $0,    %rbx
	jne    _destroy658
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $947,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy657:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy659
	addq   $1,    8(%rcx)
_destroy659:
	movq   16(%rbp), %rcx
	pushq  56(%rcx)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy660
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy660:
	addq   $8,    %rsp
	movq   16(%rbp), %rcx
	popq   56(%rcx)           # _value
_endif32:
_endif30:
_endif29:
_endif28:

	# Garbage collection (args)
	pushq  24(%rbp)           # newKey
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy661
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy661:
	addq   $8,    %rsp
	pushq  32(%rbp)           # newValue
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy662
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy662:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $8,    %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# Statement list

	# /****************************************************************\
	# |                                                                |
	# |  stdlib.floyd, line 956: if _key = null or target = null then  |
	# |                                                                |
	# \****************************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	pushq  %rax
	pushq  $0
	movq   24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	movq   %rax,  %rbx
	popq   %rax
	orq    %rbx,  %rax
	cmpq   $0,    %rax
	jne    _if34
	jmp    _else34
_if34:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 957: get := null  |
	# |                                       |
	# \***************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy663
_destroy664:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy663
	cmpq   $0,    %rbx
	jne    _destroy664
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $957,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy663:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy665
	addq   $1,    8(%rcx)
_destroy665:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy666
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy666:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
	jmp    _endif34
_else34:

	# /***************************************************\
	# |                                                   |
	# |  stdlib.floyd, line 959: if _key.eq(target) then  |
	# |                                                   |
	# \***************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # target
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy667
_destroy668:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy667
	cmpq   $0,    %rbx
	jne    _destroy668
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $959,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy667:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy669
	addq   $1,    8(%rcx)
_destroy669:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   48(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest167
	movq   $.stringlit1, %rsi
	movq   $959,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest167:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   48(%rax), %rbx
	call   *%rbx              # eq()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _if35
	jmp    _else35
_if35:

	# /*****************************************\
	# |                                         |
	# |  stdlib.floyd, line 960: get := _value  |
	# |                                         |
	# \*****************************************/
	movq   16(%rbp), %rbx
	pushq  56(%rbx)           # _value
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy670
_destroy671:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy670
	cmpq   $0,    %rbx
	jne    _destroy671
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $960,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy670:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy672
	addq   $1,    8(%rcx)
_destroy672:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy673
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy673:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
	jmp    _endif35
_else35:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 962: if target < _key then  |
	# |                                                 |
	# \*************************************************/

	# Pushing parameters
	movq   16(%rbp), %rbx
	pushq  48(%rbx)           # _key
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy674
_destroy675:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy674
	cmpq   $0,    %rbx
	jne    _destroy675
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $962,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy674:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy676
	addq   $1,    8(%rcx)
_destroy676:

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest168
	movq   $.stringlit1, %rsi
	movq   $962,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest168:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   64(%rax), %rbx
	call   *%rbx              # _lt_()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _if36
	jmp    _else36
_if36:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 963: if _left = null then  |
	# |                                                |
	# \************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if37
	jmp    _else37
_if37:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 964: get := null  |
	# |                                       |
	# \***************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy677
_destroy678:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy677
	cmpq   $0,    %rbx
	jne    _destroy678
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $964,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy677:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy679
	addq   $1,    8(%rcx)
_destroy679:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy680
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy680:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
	jmp    _endif37
_else37:

	# /****************************************************\
	# |                                                    |
	# |  stdlib.floyd, line 966: get := _left.get(target)  |
	# |                                                    |
	# \****************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # target
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy681
_destroy682:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy681
	cmpq   $0,    %rbx
	jne    _destroy682
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $966,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy681:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy683
	addq   $1,    8(%rcx)
_destroy683:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest169
	movq   $.stringlit1, %rsi
	movq   $966,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest169:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # get()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy684
_destroy685:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy684
	cmpq   $0,    %rbx
	jne    _destroy685
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $966,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy684:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy686
	addq   $1,    8(%rcx)
_destroy686:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy687
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy687:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
_endif37:
	jmp    _endif36
_else36:

	# /*************************************************\
	# |                                                 |
	# |  stdlib.floyd, line 969: if _right = null then  |
	# |                                                 |
	# \*************************************************/
	pushq  $0
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if38
	jmp    _else38
_if38:

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 970: get := null  |
	# |                                       |
	# \***************************************/
	pushq  $0
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy688
_destroy689:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy688
	cmpq   $0,    %rbx
	jne    _destroy689
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $970,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy688:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy690
	addq   $1,    8(%rcx)
_destroy690:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy691
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy691:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
	jmp    _endif38
_else38:

	# /*****************************************************\
	# |                                                     |
	# |  stdlib.floyd, line 972: get := _right.get(target)  |
	# |                                                     |
	# \*****************************************************/

	# Pushing parameters
	pushq  24(%rbp)           # target
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy692
_destroy693:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy692
	cmpq   $0,    %rbx
	jne    _destroy693
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $972,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy692:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy694
	addq   $1,    8(%rcx)
_destroy694:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   40(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest170
	movq   $.stringlit1, %rsi
	movq   $972,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest170:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # get()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy695
_destroy696:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy695
	cmpq   $0,    %rbx
	jne    _destroy696
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $972,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy695:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy697
	addq   $1,    8(%rcx)
_destroy697:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy698
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy698:
	addq   $8,    %rsp
	popq   -8(%rbp)           # get
_endif38:
_endif36:
_endif35:
_endif34:

	# Garbage collection (args)
	pushq  24(%rbp)           # target
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy699
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy699:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy700
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy701
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy701
	movq   %rbx,  %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy701:
	leave
	ret

.global Mappername
	.type  Mappername, @function
Mappername:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit8, %rax
	leave
	ret

.global Mapper_type
	.type  Mapper_type, @function
Mapper_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*********************************************************************\
	# |                                                                     |
	# |  stdlib.floyd, line 992: res := new IntVector.reserve(data.size())  |
	# |                                                                     |
	# \*********************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest171
	movq   $.stringlit1, %rsi
	movq   $992,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest171:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax

	# Pushing caller
	movq   $3,    %rsi
	movq   $IntVectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   IntVectorinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest172
	movq   $.stringlit1, %rsi
	movq   $992,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest172:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # reserve()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy702
_destroy703:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy702
	cmpq   $0,    %rbx
	jne    _destroy703
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $992,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy702:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy704
	addq   $1,    8(%rcx)
_destroy704:
	popq   -16(%rbp)          # res

	# /************************************\
	# |                                    |
	# |  stdlib.floyd, line 993: idx := 0  |
	# |                                    |
	# \************************************/
	movq   $0,    -24(%rbp)

	# /***************************************\
	# |                                       |
	# |  stdlib.floyd, line 994: tmp: String  |
	# |                                       |
	# \***************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /********************************************************\
	# |                                                        |
	# |  stdlib.floyd, line 996: loop while idx < data.size()  |
	# |                                                        |
	# \********************************************************/
_while26:

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest173
	movq   $.stringlit1, %rsi
	movq   $996,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest173:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody26
	jmp    _endwhile26
_whilebody26:

	# /***********************************************\
	# |                                               |
	# |  stdlib.floyd, line 997: tmp := data.at(idx)  |
	# |                                               |
	# \***********************************************/

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest174
	movq   $.stringlit1, %rsi
	movq   $997,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest174:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy705
_destroy706:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy705
	cmpq   $0,    %rbx
	jne    _destroy706
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $997,  %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy705:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy707
	addq   $1,    8(%rcx)
_destroy707:
	pushq  -32(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy708
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy708:
	addq   $8,    %rsp
	popq   -32(%rbp)          # tmp

	# /******************************************************\
	# |                                                      |
	# |  stdlib.floyd, line 998: res.push_back(tmp.toInt())  |
	# |                                                      |
	# \******************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   -32(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest175
	movq   $.stringlit1, %rsi
	movq   $998,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest175:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   264(%rax), %rbx
	call   *%rbx              # toInt()
	addq   $8,    %rsp
	pushq  %rax

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest176
	movq   $.stringlit1, %rsi
	movq   $998,  %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest176:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy709
	cmpq   $0,    8(%rbx)
	jg     _destroy709
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy709:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 999: idx := idx + 1  |
	# |                                          |
	# \******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while26
_endwhile26:

	# /******************************************\
	# |                                          |
	# |  stdlib.floyd, line 1002: mapInt := res  |
	# |                                          |
	# \******************************************/
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy710
_destroy711:
	movq   (%rbx), %rbx
	cmpq   $IntVectorvtable, %rbx
	je     _destroy710
	cmpq   $0,    %rbx
	jne    _destroy711
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit3, %rdx
	movq   $.stringlit1, %rsi
	movq   $1002, %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy710:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy712
	addq   $1,    8(%rcx)
_destroy712:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy713
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy713:
	addq   $8,    %rsp
	popq   -8(%rbp)           # mapInt

	# Garbage collection (locals)
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy714
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy714:
	addq   $8,    %rsp
	pushq  -32(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy715
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy715:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # data
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy716
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy716:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy717
	subq   $1,    8(%rax)
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
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $32,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /*******************************************************************\
	# |                                                                   |
	# |  stdlib.floyd, line 1006: res := new Vector.reserve(data.size())  |
	# |                                                                   |
	# \*******************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest177
	movq   $.stringlit1, %rsi
	movq   $1006, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest177:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax

	# Pushing caller
	movq   $3,    %rsi
	movq   $Vectorvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Vectorinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest178
	movq   $.stringlit1, %rsi
	movq   $1006, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest178:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # reserve()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy718
_destroy719:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy718
	cmpq   $0,    %rbx
	jne    _destroy719
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $1006, %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy718:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy720
	addq   $1,    8(%rcx)
_destroy720:
	popq   -16(%rbp)          # res

	# /*************************************\
	# |                                     |
	# |  stdlib.floyd, line 1007: idx := 0  |
	# |                                     |
	# \*************************************/
	movq   $0,    -24(%rbp)

	# /****************************************\
	# |                                        |
	# |  stdlib.floyd, line 1008: tmp: String  |
	# |                                        |
	# \****************************************/
	movq   $0,    -32(%rbp)

	# Statement list

	# /*********************************************************\
	# |                                                         |
	# |  stdlib.floyd, line 1010: loop while idx < data.size()  |
	# |                                                         |
	# \*********************************************************/
_while27:

	# Pushing parameters

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest179
	movq   $.stringlit1, %rsi
	movq   $1010, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest179:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # size()
	addq   $8,    %rsp
	pushq  %rax
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	setl   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _whilebody27
	jmp    _endwhile27
_whilebody27:

	# /************************************************\
	# |                                                |
	# |  stdlib.floyd, line 1011: tmp := data.at(idx)  |
	# |                                                |
	# \************************************************/

	# Pushing parameters
	movq   -24(%rbp), %rax
	pushq  %rax

	# Pushing caller
	movq   24(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest180
	movq   $.stringlit1, %rsi
	movq   $1011, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest180:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   216(%rax), %rbx
	call   *%rbx              # at()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy721
_destroy722:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy721
	cmpq   $0,    %rbx
	jne    _destroy722
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit1, %rsi
	movq   $1011, %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy721:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy723
	addq   $1,    8(%rcx)
_destroy723:
	pushq  -32(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy724
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy724:
	addq   $8,    %rsp
	popq   -32(%rbp)          # tmp

	# /*************************************************************************\
	# |                                                                         |
	# |  stdlib.floyd, line 1012: res.push_back(new Integer.init(tmp.toInt()))  |
	# |                                                                         |
	# \*************************************************************************/

	# Pushing parameters

	# Pushing parameters

	# Pushing parameters

	# Pushing caller
	movq   -32(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest181
	movq   $.stringlit1, %rsi
	movq   $1012, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest181:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   264(%rax), %rbx
	call   *%rbx              # toInt()
	addq   $8,    %rsp
	pushq  %rax

	# Pushing caller
	movq   $1,    %rsi
	movq   $Integervtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Integerinit

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest182
	movq   $.stringlit1, %rsi
	movq   $1012, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest182:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # init()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy725
_destroy726:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy725
	cmpq   $0,    %rbx
	jne    _destroy726
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit1, %rsi
	movq   $1012, %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy725:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy727
	addq   $1,    8(%rcx)
_destroy727:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest183
	movq   $.stringlit1, %rsi
	movq   $1012, %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest183:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # push_back()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy728
	cmpq   $0,    8(%rbx)
	jg     _destroy728
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy728:

	# /*******************************************\
	# |                                           |
	# |  stdlib.floyd, line 1013: idx := idx + 1  |
	# |                                           |
	# \*******************************************/
	pushq  -24(%rbp)          # idx
	movq   $1,    %rbx
	popq   %rax
	addq   %rbx,  %rax
	movq   %rax,  -24(%rbp)
	jmp    _while27
_endwhile27:

	# /**********************************************\
	# |                                              |
	# |  stdlib.floyd, line 1016: mapInteger := res  |
	# |                                              |
	# \**********************************************/
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy729
_destroy730:
	movq   (%rbx), %rbx
	cmpq   $Vectorvtable, %rbx
	je     _destroy729
	cmpq   $0,    %rbx
	jne    _destroy730
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit11, %rdx
	movq   $.stringlit1, %rsi
	movq   $1016, %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy729:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy731
	addq   $1,    8(%rcx)
_destroy731:
	pushq  -8(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy732
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy732:
	addq   $8,    %rsp
	popq   -8(%rbp)           # mapInteger

	# Garbage collection (locals)
	pushq  -16(%rbp)          # res
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy733
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy733:
	addq   $8,    %rsp
	pushq  -32(%rbp)          # tmp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy734
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy734:
	addq   $8,    %rsp

	# Garbage collection (args)
	pushq  24(%rbp)           # data
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy735
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy735:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax

	# Garbage collection (return value)
	movq   -8(%rbp), %rax
	cmpq   $0,    %rax
	je     _destroy736
	subq   $1,    8(%rax)
_destroy736:
	leave
	ret


	# /*****************************************************\
	# |                                                     |
	# |  ..\tests\phase5\comp.floyd, line 1: class Main is  |
	# |                                                     |
	# \*****************************************************/
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
.global Maininit
	.type  Maininit, @function
Maininit:
	pushq  %rbp
	movq   %rsp,  %rbp

	# /*******************************************************\
	# |                                                       |
	# |  ..\tests\phase5\comp.floyd, line 2: data := new Map  |
	# |                                                       |
	# \*******************************************************/
	movq   $4,    %rsi
	movq   $Mapvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy737
_destroy738:
	movq   (%rbx), %rbx
	cmpq   $Mapvtable, %rbx
	je     _destroy737
	cmpq   $0,    %rbx
	jne    _destroy738
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit12, %rdx
	movq   $.stringlit2, %rsi
	movq   $2,    %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy737:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy739
	addq   $1,    8(%rcx)
_destroy739:
	movq   16(%rbp), %rcx
	popq   32(%rcx)           # data
	leave
	ret

.global Maindestroy
	.type  Maindestroy, @function
Maindestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	cmpq   $0,    %rbx
	je     _destroy740
	subq   $1,    8(%rbx)
	cmpq   $0,    8(%rbx)
	jg     _destroy740
	pushq  %rbx
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rbx
	cmpq   $0,    %rbx
	je     _destroy741
	pushq  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp
_destroy741:
	popq   %rax
	movq   %rax,  %rdi
	call   destroyobject
_destroy740:
	leave
	ret

.global Mainname
	.type  Mainname, @function
Mainname:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $.stringlit13, %rax
	leave
	ret

.global Main_type
	.type  Main_type, @function
Main_type:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   16(%rbp), %rbx
	movq   (%rbx), %rax
	leave
	ret


	# /**************************************************\
	# |                                                  |
	# |  ..\tests\phase5\comp.floyd, line 4: start() is  |
	# |                                                  |
	# \**************************************************/
.global Main_start
	.type  Main_start, @function
Main_start:
	pushq  %rbp
	movq   %rsp,  %rbp
	subq   $24,   %rsp

	# Initializing locals
	movq   $0,    -8(%rbp)

	# /***************************************************\
	# |                                                   |
	# |  ..\tests\phase5\comp.floyd, line 5: inp: String  |
	# |                                                   |
	# \***************************************************/
	movq   $0,    -16(%rbp)

	# /***************************************************\
	# |                                                   |
	# |  ..\tests\phase5\comp.floyd, line 6: val: String  |
	# |                                                   |
	# \***************************************************/
	movq   $0,    -24(%rbp)

	# Statement list

	# /*******************************************************************************************************\
	# |                                                                                                       |
	# |  ..\tests\phase5\comp.floyd, line 8: out.writeln("Enter key and value pairs (\"stop\" to finish): ")  |
	# |                                                                                                       |
	# \*******************************************************************************************************/

	# Pushing parameters
	.section .rodata
.stringlit21:
	.string "Enter key and value pairs (\"stop\" to finish): "
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit21, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy742
_destroy743:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy742
	cmpq   $0,    %rbx
	jne    _destroy743
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $8,    %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy742:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy744
	addq   $1,    8(%rcx)
_destroy744:

	# Pushing caller
	movq   _out,  %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest184
	movq   $.stringlit2, %rsi
	movq   $8,    %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest184:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy745
	cmpq   $0,    8(%rbx)
	jg     _destroy745
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy745:

	# /********************************************************\
	# |                                                        |
	# |  ..\tests\phase5\comp.floyd, line 9: inp := in.read()  |
	# |                                                        |
	# \********************************************************/

	# Pushing parameters

	# Pushing caller
	movq   _in,   %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest185
	movq   $.stringlit2, %rsi
	movq   $9,    %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest185:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # read()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy746
_destroy747:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy746
	cmpq   $0,    %rbx
	jne    _destroy747
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $9,    %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy746:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy748
	addq   $1,    8(%rcx)
_destroy748:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy749
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy749:
	addq   $8,    %rsp
	popq   -16(%rbp)          # inp

	# /*******************************************************************\
	# |                                                                   |
	# |  ..\tests\phase5\comp.floyd, line 10: loop while inp.neq("stop")  |
	# |                                                                   |
	# \*******************************************************************/
_while28:

	# Pushing parameters
	.section .rodata
.stringlit22:
	.string "stop"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit22, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy750
_destroy751:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy750
	cmpq   $0,    %rbx
	jne    _destroy751
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $10,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy750:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy752
	addq   $1,    8(%rcx)
_destroy752:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest186
	movq   $.stringlit2, %rsi
	movq   $10,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest186:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   56(%rax), %rbx
	call   *%rbx              # neq()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _whilebody28
	jmp    _endwhile28
_whilebody28:

	# /*********************************************************\
	# |                                                         |
	# |  ..\tests\phase5\comp.floyd, line 11: val := in.read()  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters

	# Pushing caller
	movq   _in,   %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest187
	movq   $.stringlit2, %rsi
	movq   $11,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest187:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # read()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy753
_destroy754:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy753
	cmpq   $0,    %rbx
	jne    _destroy754
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $11,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy753:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy755
	addq   $1,    8(%rcx)
_destroy755:
	pushq  -24(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy756
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy756:
	addq   $8,    %rsp
	popq   -24(%rbp)          # val

	# /**************************************************************\
	# |                                                              |
	# |  ..\tests\phase5\comp.floyd, line 12: data.insert(inp, val)  |
	# |                                                              |
	# \**************************************************************/

	# Pushing parameters
	pushq  -24(%rbp)          # val
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy757
_destroy758:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy757
	cmpq   $0,    %rbx
	jne    _destroy758
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $12,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy757:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy759
	addq   $1,    8(%rcx)
_destroy759:
	pushq  -16(%rbp)          # inp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy760
_destroy761:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy760
	cmpq   $0,    %rbx
	jne    _destroy761
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $12,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy760:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy762
	addq   $1,    8(%rcx)
_destroy762:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest188
	movq   $.stringlit2, %rsi
	movq   $12,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest188:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   160(%rax), %rbx
	call   *%rbx              # insert()
	addq   $24,   %rsp

	# /*********************************************************\
	# |                                                         |
	# |  ..\tests\phase5\comp.floyd, line 14: inp := in.read()  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters

	# Pushing caller
	movq   _in,   %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest189
	movq   $.stringlit2, %rsi
	movq   $14,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest189:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # read()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy763
_destroy764:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy763
	cmpq   $0,    %rbx
	jne    _destroy764
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $14,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy763:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy765
	addq   $1,    8(%rcx)
_destroy765:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy766
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy766:
	addq   $8,    %rsp
	popq   -16(%rbp)          # inp
	jmp    _while28
_endwhile28:

	# /********************************************************\
	# |                                                        |
	# |  ..\tests\phase5\comp.floyd, line 17: out.writeln("")  |
	# |                                                        |
	# \********************************************************/

	# Pushing parameters
	.section .rodata
.stringlit23:
	.string ""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit23, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy767
_destroy768:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy767
	cmpq   $0,    %rbx
	jne    _destroy768
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $17,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy767:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy769
	addq   $1,    8(%rcx)
_destroy769:

	# Pushing caller
	movq   _out,  %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest190
	movq   $.stringlit2, %rsi
	movq   $17,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest190:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy770
	cmpq   $0,    8(%rbx)
	jg     _destroy770
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy770:

	# /**********************************************************************************************************\
	# |                                                                                                          |
	# |  ..\tests\phase5\comp.floyd, line 18: out.writeln("Enter keys to access values (\"stop\" to finish): ")  |
	# |                                                                                                          |
	# \**********************************************************************************************************/

	# Pushing parameters
	.section .rodata
.stringlit24:
	.string "Enter keys to access values (\"stop\" to finish): "
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit24, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy771
_destroy772:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy771
	cmpq   $0,    %rbx
	jne    _destroy772
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $18,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy771:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy773
	addq   $1,    8(%rcx)
_destroy773:

	# Pushing caller
	movq   _out,  %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest191
	movq   $.stringlit2, %rsi
	movq   $18,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest191:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy774
	cmpq   $0,    8(%rbx)
	jg     _destroy774
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy774:

	# /*********************************************************\
	# |                                                         |
	# |  ..\tests\phase5\comp.floyd, line 19: inp := in.read()  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters

	# Pushing caller
	movq   _in,   %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest192
	movq   $.stringlit2, %rsi
	movq   $19,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest192:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # read()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy775
_destroy776:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy775
	cmpq   $0,    %rbx
	jne    _destroy776
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $19,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy775:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy777
	addq   $1,    8(%rcx)
_destroy777:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy778
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy778:
	addq   $8,    %rsp
	popq   -16(%rbp)          # inp

	# /*******************************************************************\
	# |                                                                   |
	# |  ..\tests\phase5\comp.floyd, line 20: loop while inp.neq("stop")  |
	# |                                                                   |
	# \*******************************************************************/
_while29:

	# Pushing parameters
	.section .rodata
.stringlit25:
	.string "stop"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit25, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy779
_destroy780:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy779
	cmpq   $0,    %rbx
	jne    _destroy780
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $20,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy779:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy781
	addq   $1,    8(%rcx)
_destroy781:

	# Pushing caller
	movq   -16(%rbp), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest193
	movq   $.stringlit2, %rsi
	movq   $20,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest193:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   56(%rax), %rbx
	call   *%rbx              # neq()
	addq   $16,   %rsp
	cmpq   $0,    %rax
	jne    _whilebody29
	jmp    _endwhile29
_whilebody29:

	# /*************************************************************\
	# |                                                             |
	# |  ..\tests\phase5\comp.floyd, line 21: val := data.get(inp)  |
	# |                                                             |
	# \*************************************************************/

	# Pushing parameters
	pushq  -16(%rbp)          # inp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy782
_destroy783:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy782
	cmpq   $0,    %rbx
	jne    _destroy783
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $21,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy782:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy784
	addq   $1,    8(%rcx)
_destroy784:

	# Pushing caller
	movq   16(%rbp), %rbx
	movq   32(%rbx), %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest194
	movq   $.stringlit2, %rsi
	movq   $21,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest194:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   168(%rax), %rbx
	call   *%rbx              # get()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy785
_destroy786:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy785
	cmpq   $0,    %rbx
	jne    _destroy786
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $21,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy785:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy787
	addq   $1,    8(%rcx)
_destroy787:
	pushq  -24(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy788
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy788:
	addq   $8,    %rsp
	popq   -24(%rbp)          # val

	# /***********************************************************\
	# |                                                           |
	# |  ..\tests\phase5\comp.floyd, line 22: if val = null then  |
	# |                                                           |
	# \***********************************************************/
	pushq  $0
	movq   -24(%rbp), %rax
	popq   %rbx
	cmpq   %rbx,  %rax
	sete   %al
	movzbq %al,   %rax
	cmpq   $0,    %rax
	jne    _if39
	jmp    _else39
_if39:

	# /*******************************************************************************************\
	# |                                                                                           |
	# |  ..\tests\phase5\comp.floyd, line 23: out.writeln("Key \"" & inp & "\" does not exist!")  |
	# |                                                                                           |
	# \*******************************************************************************************/

	# Pushing parameters

	# Pushing parameters
	.section .rodata
.stringlit26:
	.string "\" does not exist!"
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit26, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy789
_destroy790:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy789
	cmpq   $0,    %rbx
	jne    _destroy790
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy789:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy791
	addq   $1,    8(%rcx)
_destroy791:

	# Pushing caller

	# Pushing parameters
	pushq  -16(%rbp)          # inp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy792
_destroy793:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy792
	cmpq   $0,    %rbx
	jne    _destroy793
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy792:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy794
	addq   $1,    8(%rcx)
_destroy794:

	# Pushing caller
	.section .rodata
.stringlit27:
	.string "Key \""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit27, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest195
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest195:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest196
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest196:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy795
_destroy796:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy795
	cmpq   $0,    %rbx
	jne    _destroy796
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy795:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy797
	addq   $1,    8(%rcx)
_destroy797:

	# Pushing caller
	movq   _out,  %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest197
	movq   $.stringlit2, %rsi
	movq   $23,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest197:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy798
	cmpq   $0,    8(%rbx)
	jg     _destroy798
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy798:
	jmp    _endif39
_else39:

	# /****************************************************************************************************\
	# |                                                                                                    |
	# |  ..\tests\phase5\comp.floyd, line 25: out.writeln("Key: \"" & inp & "\"; Value: \"" & val & "\"")  |
	# |                                                                                                    |
	# \****************************************************************************************************/

	# Pushing parameters

	# Pushing parameters
	.section .rodata
.stringlit28:
	.string "\""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit28, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy799
_destroy800:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy799
	cmpq   $0,    %rbx
	jne    _destroy800
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy799:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy801
	addq   $1,    8(%rcx)
_destroy801:

	# Pushing caller

	# Pushing parameters
	pushq  -24(%rbp)          # val
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy802
_destroy803:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy802
	cmpq   $0,    %rbx
	jne    _destroy803
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy802:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy804
	addq   $1,    8(%rcx)
_destroy804:

	# Pushing caller

	# Pushing parameters
	.section .rodata
.stringlit29:
	.string "\"; Value: \""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit29, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy805
_destroy806:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy805
	cmpq   $0,    %rbx
	jne    _destroy806
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy805:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy807
	addq   $1,    8(%rcx)
_destroy807:

	# Pushing caller

	# Pushing parameters
	pushq  -16(%rbp)          # inp
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy808
_destroy809:
	movq   (%rbx), %rbx
	cmpq   $Oydvtable, %rbx
	je     _destroy808
	cmpq   $0,    %rbx
	jne    _destroy809
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit9, %rdx
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy808:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy810
	addq   $1,    8(%rcx)
_destroy810:

	# Pushing caller
	.section .rodata
.stringlit30:
	.string "Key: \""
.text
	movq   $Stringvtable, %rsi
	movq   $.stringlit30, %rdi
	movq   $0,    %rax
	call   createstring
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest198
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest198:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest199
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest199:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest200
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest200:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest201
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest201:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   144(%rax), %rbx
	call   *%rbx              # _cat_()
	addq   $16,   %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy811
_destroy812:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy811
	cmpq   $0,    %rbx
	jne    _destroy812
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy811:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy813
	addq   $1,    8(%rcx)
_destroy813:

	# Pushing caller
	movq   _out,  %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest202
	movq   $.stringlit2, %rsi
	movq   $25,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest202:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   200(%rax), %rbx
	call   *%rbx              # writeln()
	addq   $16,   %rsp
	pushq  %rax               # Test for variable destruction
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	je     _destroy814
	cmpq   $0,    8(%rbx)
	jg     _destroy814
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy814:
_endif39:

	# /*********************************************************\
	# |                                                         |
	# |  ..\tests\phase5\comp.floyd, line 27: inp := in.read()  |
	# |                                                         |
	# \*********************************************************/

	# Pushing parameters

	# Pushing caller
	movq   _in,   %rax
	pushq  %rax

	# Performing null checks
	movq   (%rsp), %rbx
	cmpq   $0,    %rbx
	jne    _nulltest203
	movq   $.stringlit2, %rsi
	movq   $27,   %rdi
	movq   $0,    %rax
	call   nullexception
_nulltest203:

	# Garbage collection (caller)
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)

	# Call method
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   184(%rax), %rbx
	call   *%rbx              # read()
	addq   $8,    %rsp
	pushq  %rax
	movq   (%rsp), %rbx       # Perform inheritance checks
	cmpq   $0,    %rbx
	je     _destroy815
_destroy816:
	movq   (%rbx), %rbx
	cmpq   $Stringvtable, %rbx
	je     _destroy815
	cmpq   $0,    %rbx
	jne    _destroy816
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   16(%rax), %rbx
	call   *%rbx
	movq   %rax,  %rcx
	movq   $.stringlit5, %rdx
	movq   $.stringlit2, %rsi
	movq   $27,   %rdi
	movq   $0,    %rax
	call   inheritexception
_destroy815:
	movq   (%rsp), %rcx       # Add reference
	cmpq   $0,    %rcx
	je     _destroy817
	addq   $1,    8(%rcx)
_destroy817:
	pushq  -16(%rbp)
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy818
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy818:
	addq   $8,    %rsp
	popq   -16(%rbp)          # inp
	jmp    _while29
_endwhile29:

	# Garbage collection (locals)
	pushq  -16(%rbp)          # inp
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy819
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy819:
	addq   $8,    %rsp
	pushq  -24(%rbp)          # val
	movq   (%rsp), %rbx       # Remove reference
	cmpq   $0,    %rbx
	je     _destroy820
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
_destroy820:
	addq   $8,    %rsp

	# Garbage collection (caller)
	pushq  16(%rbp)
	movq   (%rsp), %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	addq   $8,    %rsp

	# Method close
	movq   -8(%rbp), %rax
	leave
	ret

.global main
	.type  main,  @function
main:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   $0,    %rsi
	movq   $Readervtable, %rdi
	movq   $0,    %rax
	call   addobject
	movq   %rax,  _in         # Initialize in (Reader)
	movq   (_in), %rcx        # Add reference
	addq   $1,    8(%rcx)
	movq   $0,    %rsi
	movq   $Writervtable, %rdi
	movq   $0,    %rax
	call   addobject
	movq   %rax,  _out        # Initialize out (Writer)
	movq   (_out), %rcx       # Add reference
	addq   $1,    8(%rcx)
	movq   $1,    %rsi
	movq   $Mainvtable, %rdi
	movq   $0,    %rax
	call   addobject
	pushq  %rax
	call   Maininit
	movq   (%rsp), %rcx       # Add reference
	addq   $1,    8(%rcx)
	call   Main_start
	pushq  _in
	call   Readerdestroy
	pushq  _out
	call   Writerdestroy
	addq   $24,   %rsp
	call   stats
	leave
	ret

.global calldestroy
	.type  calldestroy, @function
calldestroy:
	pushq  %rbp
	movq   %rsp,  %rbp
	movq   %rdi,  %rax
	pushq  %rax
	movq   %rax,  %rbx
	movq   (%rbx), %rax
	movq   8(%rax), %rbx
	call   *%rbx
	leave
	ret

	.weak  IntVectorvtable
	.section .gnu.linkonce.r.IntVectorvtable,"aG",@progbits,IntVectorvtable,comdat
	.align 8
	.type  IntVectorvtable, @object
	.size  IntVectorvtable, 248
IntVectorvtable:
	.quad  Oydvtable
	.quad  IntVectordestroy
	.quad  IntVectorname
	.quad  IntVector_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  IntVector_size
	.quad  IntVector_getData
	.quad  IntVector_resize
	.quad  IntVector_push_back
	.quad  IntVector_init
	.quad  IntVector_reserve
	.quad  IntVector_copy
	.quad  IntVector_at
	.quad  IntVector_insert
	.quad  IntVector_partition
	.quad  IntVector_quicksort
	.quad  IntVector_sort

	.weak  Readervtable
	.section .gnu.linkonce.r.Readervtable,"aG",@progbits,Readervtable,comdat
	.align 8
	.type  Readervtable, @object
	.size  Readervtable, 192
Readervtable:
	.quad  Oydvtable
	.quad  Readerdestroy
	.quad  Readername
	.quad  Reader_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Reader_io_read
	.quad  Reader_skipWS
	.quad  Reader_readline
	.quad  Reader_read
	.quad  Reader_readint

	.weak  Stringvtable
	.section .gnu.linkonce.r.Stringvtable,"aG",@progbits,Stringvtable,comdat
	.align 8
	.type  Stringvtable, @object
	.size  Stringvtable, 304
Stringvtable:
	.quad  Oydvtable
	.quad  Stringdestroy
	.quad  Stringname
	.quad  String_type
	.quad  String_toString
	.quad  Oyd_val
	.quad  String_eq
	.quad  Oyd_neq
	.quad  String__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  String__mul_
	.quad  Oyd__div_
	.quad  String__cat_
	.quad  Oyd__idx_
	.quad  String_size
	.quad  String_length
	.quad  String_getData
	.quad  String_init
	.quad  String_appendChar
	.quad  String_catIntHelper
	.quad  String_copy
	.quad  String_cat
	.quad  String_catChar
	.quad  String_catInt
	.quad  String_charAt
	.quad  String_gt
	.quad  String_gteq
	.quad  String_toInt
	.quad  String_find
	.quad  String_substring
	.quad  String_split
	.quad  String_join
	.quad  String_trim

	.weak  Arrayvtable
	.section .gnu.linkonce.r.Arrayvtable,"aG",@progbits,Arrayvtable,comdat
	.align 8
	.type  Arrayvtable, @object
	.size  Arrayvtable, 152
Arrayvtable:
	.quad  Oydvtable
	.quad  Arraydestroy
	.quad  Arrayname
	.quad  Array_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_

	.weak  Integervtable
	.section .gnu.linkonce.r.Integervtable,"aG",@progbits,Integervtable,comdat
	.align 8
	.type  Integervtable, @object
	.size  Integervtable, 168
Integervtable:
	.quad  Oydvtable
	.quad  Integerdestroy
	.quad  Integername
	.quad  Integer_type
	.quad  Integer_toString
	.quad  Oyd_val
	.quad  Integer_eq
	.quad  Oyd_neq
	.quad  Integer__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Integer__and_
	.quad  Integer__or_
	.quad  Integer__add_
	.quad  Integer__sub_
	.quad  Integer__mul_
	.quad  Integer__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Integer_init
	.quad  Integer_val

	.weak  Mappervtable
	.section .gnu.linkonce.r.Mappervtable,"aG",@progbits,Mappervtable,comdat
	.align 8
	.type  Mappervtable, @object
	.size  Mappervtable, 168
Mappervtable:
	.quad  Oydvtable
	.quad  Mapperdestroy
	.quad  Mappername
	.quad  Mapper_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Mapper_mapInt
	.quad  Mapper_mapInteger

	.weak  Oydvtable
	.section .gnu.linkonce.r.Oydvtable,"aG",@progbits,Oydvtable,comdat
	.align 8
	.type  Oydvtable, @object
	.size  Oydvtable, 152
Oydvtable:
	.quad  0
	.quad  Oyddestroy
	.quad  Oydname
	.quad  Oyd_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_

	.weak  Booleanvtable
	.section .gnu.linkonce.r.Booleanvtable,"aG",@progbits,Booleanvtable,comdat
	.align 8
	.type  Booleanvtable, @object
	.size  Booleanvtable, 168
Booleanvtable:
	.quad  Oydvtable
	.quad  Booleandestroy
	.quad  Booleanname
	.quad  Boolean_type
	.quad  Boolean_toString
	.quad  Oyd_val
	.quad  Boolean_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Boolean_init
	.quad  Boolean_val

	.weak  Vectorvtable
	.section .gnu.linkonce.r.Vectorvtable,"aG",@progbits,Vectorvtable,comdat
	.align 8
	.type  Vectorvtable, @object
	.size  Vectorvtable, 248
Vectorvtable:
	.quad  Oydvtable
	.quad  Vectordestroy
	.quad  Vectorname
	.quad  Vector_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Vector_size
	.quad  Vector_getData
	.quad  Vector_resize
	.quad  Vector_push_back
	.quad  Vector_init
	.quad  Vector_reserve
	.quad  Vector_copy
	.quad  Vector_at
	.quad  Vector_insert
	.quad  Vector_partition
	.quad  Vector_quicksort
	.quad  Vector_sort

	.weak  Mapvtable
	.section .gnu.linkonce.r.Mapvtable,"aG",@progbits,Mapvtable,comdat
	.align 8
	.type  Mapvtable, @object
	.size  Mapvtable, 168
Mapvtable:
	.quad  Oydvtable
	.quad  Mapdestroy
	.quad  Mapname
	.quad  Map_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Map_insert
	.quad  Map_get

	.weak  Mainvtable
	.section .gnu.linkonce.r.Mainvtable,"aG",@progbits,Mainvtable,comdat
	.align 8
	.type  Mainvtable, @object
	.size  Mainvtable, 160
Mainvtable:
	.quad  Oydvtable
	.quad  Maindestroy
	.quad  Mainname
	.quad  Main_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Main_start

	.weak  Writervtable
	.section .gnu.linkonce.r.Writervtable,"aG",@progbits,Writervtable,comdat
	.align 8
	.type  Writervtable, @object
	.size  Writervtable, 224
Writervtable:
	.quad  Oydvtable
	.quad  Writerdestroy
	.quad  Writername
	.quad  Writer_type
	.quad  Oyd_toString
	.quad  Oyd_val
	.quad  Oyd_eq
	.quad  Oyd_neq
	.quad  Oyd__lt_
	.quad  Oyd__lteq_
	.quad  Oyd__gteq_
	.quad  Oyd__gt_
	.quad  Oyd__and_
	.quad  Oyd__or_
	.quad  Oyd__add_
	.quad  Oyd__sub_
	.quad  Oyd__mul_
	.quad  Oyd__div_
	.quad  Oyd__cat_
	.quad  Oyd__idx_
	.quad  Writer_io_write
	.quad  Writer_writechar
	.quad  Writer_writeintHelper
	.quad  Writer_writeint
	.quad  Writer_write
	.quad  Writer_writeln
	.quad  Writer_writeObject
	.quad  Writer_writeVector
	.quad  Writer_writeIntVector

