	.file	"stdlib64.c"
	.globl	RESERVED
	.data
	.align 4
	.type	RESERVED, @object
	.size	RESERVED, 4
RESERVED:
	.long	4
	.globl	DIM
	.align 4
	.type	DIM, @object
	.size	DIM, 4
DIM:
	.long	4
	.globl	VTABLE
	.bss
	.align 4
	.type	VTABLE, @object
	.size	VTABLE, 4
VTABLE:
	.zero	4
	.globl	REF
	.data
	.align 4
	.type	REF, @object
	.size	REF, 4
REF:
	.long	1
	.globl	CID
	.align 4
	.type	CID, @object
	.size	CID, 4
CID:
	.long	2
	.globl	SIZE
	.align 4
	.type	SIZE, @object
	.size	SIZE, 4
SIZE:
	.long	3
	.globl	allocated
	.bss
	.align 4
	.type	allocated, @object
	.size	allocated, 4
allocated:
	.zero	4
	.globl	freed
	.align 4
	.type	freed, @object
	.size	freed, 4
freed:
	.zero	4
	.text
	.globl	printstring
	.type	printstring, @function
printstring:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	printstring, .-printstring
	.globl	printint
	.type	printint, @function
printint:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -56(%rbp)
	jne	.L5
	movb	$48, -37(%rbp)
	leaq	-37(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
	jmp	.L4
.L5:
	cmpq	$0, -56(%rbp)
	jns	.L7
	negq	-56(%rbp)
	movb	$45, -37(%rbp)
	leaq	-37(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
.L7:
	movl	$0, -36(%rbp)
	jmp	.L8
.L9:
	movl	-36(%rbp), %esi
	leal	1(%rsi), %eax
	movl	%eax, -36(%rbp)
	movq	-56(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movl	%edx, %eax
	addl	$48, %eax
	movl	%eax, %edx
	movslq	%esi, %rax
	movb	%dl, -32(%rbp,%rax)
	movq	-56(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -56(%rbp)
.L8:
	cmpq	$0, -56(%rbp)
	jg	.L9
	jmp	.L10
.L11:
	subl	$1, -36(%rbp)
	movl	-36(%rbp), %eax
	cltq
	leaq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
.L10:
	cmpl	$0, -36(%rbp)
	jg	.L11
.L4:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L12
	call	__stack_chk_fail
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	printint, .-printint
	.globl	print
	.type	print, @function
print:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L14
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L14:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$0, -220(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -216(%rbp)
	jmp	.L15
.L17:
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$37, %al
	jne	.L16
	addl	$1, -220(%rbp)
.L16:
	addq	$1, -216(%rbp)
.L15:
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L17
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -216(%rbp)
	jmp	.L18
.L28:
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$37, %al
	jne	.L19
	addq	$1, -216(%rbp)
	movq	-216(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -216(%rbp)
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$100, %eax
	je	.L21
	cmpl	$115, %eax
	je	.L22
	jmp	.L18
.L21:
	movl	-208(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L23
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L24
.L23:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L24:
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	printint
	jmp	.L18
.L22:
	movl	-208(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L26
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L27
.L26:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L27:
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	printstring
	nop
	jmp	.L18
.L19:
	movq	-216(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -216(%rbp)
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
.L18:
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L28
	nop
	movq	-184(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L29
	call	__stack_chk_fail
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print, .-print
	.section	.rodata
.LC0:
	.string	"%s: %s, line #%d\n"
	.text
	.globl	error
	.type	error, @function
error:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	print
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE5:
	.size	error, .-error
	.globl	Writer_io_write
	.type	Writer_io_write, @function
Writer_io_write:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-28(%rbp), %eax
	movb	%al, -9(%rbp)
	leaq	-9(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
	movl	REF(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$1, %rdx
	movq	%rdx, (%rax)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L32
	call	__stack_chk_fail
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	Writer_io_write, .-Writer_io_write
	.globl	Reader_io_read
	.type	Reader_io_read, @function
Reader_io_read:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-9(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read
	movl	REF(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	subq	$1, %rdx
	movq	%rdx, (%rax)
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L35
	call	__stack_chk_fail
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Reader_io_read, .-Reader_io_read
	.section	.rodata
.LC1:
	.string	"Null pointer exception"
	.text
	.globl	nullexception
	.type	nullexception, @function
nullexception:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	call	error
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	nullexception, .-nullexception
	.section	.rodata
	.align 8
.LC2:
	.string	"Invalid type cast from %s to %s: %s, line #%d\n"
	.text
	.globl	inheritexception
	.type	inheritexception, @function
inheritexception:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	print
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE9:
	.size	inheritexception, .-inheritexception
	.globl	addarray
	.type	addarray, @function
addarray:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$296, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -296(%rbp)
	movq	%rsi, -304(%rbp)
	movq	%rdx, -312(%rbp)
	movq	%rcx, -184(%rbp)
	movq	%r8, -176(%rbp)
	movq	%r9, -168(%rbp)
	testb	%al, %al
	je	.L39
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm1, -144(%rbp)
	movaps	%xmm2, -128(%rbp)
	movaps	%xmm3, -112(%rbp)
	movaps	%xmm4, -96(%rbp)
	movaps	%xmm5, -80(%rbp)
	movaps	%xmm6, -64(%rbp)
	movaps	%xmm7, -48(%rbp)
.L39:
	movq	%fs:40, %rax
	movq	%rax, -216(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-312(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -264(%rbp)
	movq	%rax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	movq	%rax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -256(%rbp)
	movq	$1, -272(%rbp)
	movl	$24, -240(%rbp)
	movl	$48, -236(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -232(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, -224(%rbp)
	movl	$0, -280(%rbp)
	jmp	.L40
.L43:
	movl	-240(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L41
	movq	-224(%rbp), %rax
	movl	-240(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-240(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -240(%rbp)
	jmp	.L42
.L41:
	movq	-232(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -232(%rbp)
.L42:
	movq	(%rax), %rcx
	movq	-256(%rbp), %rax
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rcx, (%rax,%rdx,8)
	movq	-256(%rbp), %rax
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-272(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -272(%rbp)
	addl	$1, -280(%rbp)
.L40:
	movl	-280(%rbp), %eax
	cltq
	cmpq	-312(%rbp), %rax
	jl	.L43
	movq	-272(%rbp), %rdx
	movq	-312(%rbp), %rax
	addq	%rax, %rdx
	movl	RESERVED(%rip), %eax
	cltq
	addq	%rdx, %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -248(%rbp)
	movq	-272(%rbp), %rdx
	movq	-312(%rbp), %rax
	addq	%rax, %rdx
	movl	RESERVED(%rip), %eax
	cltq
	addq	%rdx, %rax
	leal	0(,%rax,8), %edx
	movl	allocated(%rip), %eax
	addl	%edx, %eax
	movl	%eax, allocated(%rip)
	movl	VTABLE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rax, %rdx
	movq	-296(%rbp), %rax
	movq	%rax, (%rdx)
	movl	CID(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movq	-304(%rbp), %rdx
	negq	%rdx
	movq	%rdx, (%rax)
	movl	SIZE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rax, %rdx
	movq	-272(%rbp), %rax
	movq	%rax, (%rdx)
	movl	DIM(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rax, %rdx
	movq	-312(%rbp), %rax
	movq	%rax, (%rdx)
	cmpq	$1, -312(%rbp)
	jle	.L44
	movl	DIM(%rip), %eax
	movslq	%eax, %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-248(%rbp), %rax
	addq	%rax, %rdx
	movq	-312(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	-256(%rbp), %rax
	movq	(%rax,%rcx,8), %rax
	movq	%rax, (%rdx)
.L44:
	movq	-312(%rbp), %rax
	subl	$2, %eax
	movl	%eax, -276(%rbp)
	jmp	.L45
.L46:
	movl	DIM(%rip), %edx
	movl	-276(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	DIM(%rip), %edx
	movl	-276(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movq	-256(%rbp), %rax
	movl	-276(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	imulq	%rsi, %rax
	movq	%rax, (%rcx)
	subl	$1, -276(%rbp)
.L45:
	cmpl	$0, -276(%rbp)
	jg	.L46
	movq	-248(%rbp), %rax
	movq	%rbx, %rsp
	movq	-216(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L48
	call	__stack_chk_fail
.L48:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	addarray, .-addarray
	.section	.rodata
	.align 8
.LC3:
	.string	"Array index out of bounds exception"
.LC4:
	.string	"Subarray assignment exception"
	.text
	.globl	indexarray
	.type	indexarray, @function
indexarray:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$272, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -240(%rbp)
	movq	%rdx, -248(%rbp)
	movq	%rcx, -256(%rbp)
	movq	%r8, -264(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L50
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L50:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -248(%rbp)
	jne	.L51
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	nullexception
.L51:
	movq	$0, -216(%rbp)
	movl	$40, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	movl	$0, -220(%rbp)
	jmp	.L52
.L55:
	movl	-208(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L53
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L54
.L53:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L54:
	movq	(%rax), %rdx
	movl	DIM(%rip), %ecx
	movl	-220(%rbp), %eax
	addl	%ecx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-248(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rax, -216(%rbp)
	addl	$1, -220(%rbp)
.L52:
	movl	-220(%rbp), %eax
	cltq
	movq	-264(%rbp), %rdx
	subq	$1, %rdx
	cmpq	%rdx, %rax
	jl	.L55
	movl	-208(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L56
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L57
.L56:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L57:
	movl	(%rax), %eax
	cltq
	addq	%rax, -216(%rbp)
	movl	SIZE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-216(%rbp), %rax
	jle	.L58
	cmpq	$0, -216(%rbp)
	jns	.L59
.L58:
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	call	error
.L59:
	movl	DIM(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-264(%rbp), %rax
	je	.L60
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	call	error
.L60:
	movl	RESERVED(%rip), %eax
	movslq	%eax, %rdx
	movl	DIM(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-248(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	addq	%rdx, %rax
	addq	%rax, -216(%rbp)
	cmpq	$0, -256(%rbp)
	je	.L61
	movq	-216(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L63
.L61:
	movq	-216(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
.L63:
	movq	-184(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L64
	call	__stack_chk_fail
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	indexarray, .-indexarray
	.globl	addobject
	.type	addobject, @function
addobject:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	RESERVED(%rip), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -8(%rbp)
	movl	RESERVED(%rip), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	leal	0(,%rax,8), %edx
	movl	allocated(%rip), %eax
	addl	%edx, %eax
	movl	%eax, allocated(%rip)
	movl	VTABLE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	movl	CID(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	movl	SIZE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	addobject, .-addobject
	.globl	destroyobject
	.type	destroyobject, @function
destroyobject:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	CID(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jg	.L68
	movl	CID(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jns	.L69
	movl	DIM(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	%eax, %edx
	movl	RESERVED(%rip), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L70
.L72:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L71
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	calldestroy
.L71:
	addl	$1, -8(%rbp)
.L70:
	movl	-8(%rbp), %eax
	cltq
	movl	SIZE(%rip), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rcx
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	cmpq	%rdx, %rax
	jl	.L72
.L69:
	movl	RESERVED(%rip), %eax
	movslq	%eax, %rdx
	movl	DIM(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	addq	%rax, %rdx
	movl	SIZE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	addq	%rdx, %rax
	leal	0(,%rax,8), %edx
	movl	freed(%rip), %eax
	addl	%edx, %eax
	movl	%eax, freed(%rip)
	jmp	.L73
.L68:
	movl	SIZE(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	RESERVED(%rip), %eax
	cltq
	addq	%rdx, %rax
	leal	0(,%rax,8), %edx
	movl	freed(%rip), %eax
	addl	%edx, %eax
	movl	%eax, freed(%rip)
.L73:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -24(%rbp)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	destroyobject, .-destroyobject
	.section	.rodata
.LC5:
	.string	"----------------------\n"
.LC6:
	.string	"Program Complete.\n"
.LC7:
	.string	"%d bytes allocated.\n"
.LC8:
	.string	"%d bytes freed.\n"
.LC9:
	.string	"%d bytes active.\n"
	.text
	.globl	stats
	.type	stats, @function
stats:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC5, %edi
	movl	$0, %eax
	call	print
	movl	$.LC6, %edi
	movl	$0, %eax
	call	print
	movl	allocated(%rip), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	print
	movl	freed(%rip), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	print
	movl	allocated(%rip), %edx
	movl	freed(%rip), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	print
	movl	$.LC5, %edi
	movl	$0, %eax
	call	print
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	stats, .-stats
	.globl	createstring
	.type	createstring, @function
createstring:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	addobject
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq 	%rax
	movl	$0, %eax
	call	Stringinit
	addq	$8, %rsp
	jmp	.L76
.L77:
	movl	REF(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	addq	$1, %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-8(%rbp), %rax
	pushq	%rdx
	pushq	%rax
	movl	$0, %eax
	call	String_appendChar
	addq	$16, %rsp
	addq	$1, -24(%rbp)
.L76:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L77
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	createstring, .-createstring
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
