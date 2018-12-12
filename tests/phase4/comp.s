	.file "../tests/phase4/comp.floyd"
	.stabs "../tests/phase4/comp.floyd",100,0,0,.Ltext0
.Ltext0:
	.stabs "int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0
.data

	# Line 2: x:int
	.comm _x, 4, 4
	.stabs "x:G(0,1)",32,0,0,0

	# Line 3: y:int
	.comm _y, 4, 4
	.stabs "y:G(0,1)",32,0,0,0

	# Line 4: b1:boolean
	.comm _b1, 4, 4
	.stabs "b1:G(0,1)",32,0,0,0

	# Line 5: b2:boolean
	.comm _b2, 4, 4
	.stabs "b2:G(0,1)",32,0,0,0

.text
.global main
	.stabs "main:F",36,0,0,main
main:

	# Line 9: x:=0
	.stabn 68,0,9,.line9-main
.line9:
	pushl $0
	popl _x

	# Line 10: y:=0
	.stabn 68,0,10,.line10-main
.line10:
	pushl $0
	popl _y

	# Line 13: ifx=0then
	.stabn 68,0,13,.line13-main
.line13:
	pushl _x
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq0
	pushl $1
	jmp _cont0
_neq0:
	pushl $0
_cont0:
	popl %eax
	cmpl $0, %eax
	jne _if0
	jmp _else0
_if0:

	# Line 14: out.writeint(1)
	.stabn 68,0,14,.line14-main
.line14:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif0
_else0:

	# Line 16: out.writeint(0)
	.stabn 68,0,16,.line16-main
.line16:
	pushl $0
	call writeint
	addl $4, %esp
_endif0:

	# Line 20: ifx>-1then
	.stabn 68,0,20,.line20-main
.line20:
	pushl _x
	pushl $-1
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jle _neq1
	pushl $1
	jmp _cont1
_neq1:
	pushl $0
_cont1:
	popl %eax
	cmpl $0, %eax
	jne _if1
	jmp _else1
_if1:

	# Line 21: out.writeint(1)
	.stabn 68,0,21,.line21-main
.line21:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif1
_else1:

	# Line 23: out.writeint(0)
	.stabn 68,0,23,.line23-main
.line23:
	pushl $0
	call writeint
	addl $4, %esp
_endif1:

	# Line 27: ifx>=0then
	.stabn 68,0,27,.line27-main
.line27:
	pushl _x
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jl _neq2
	pushl $1
	jmp _cont2
_neq2:
	pushl $0
_cont2:
	popl %eax
	cmpl $0, %eax
	jne _if2
	jmp _else2
_if2:

	# Line 28: out.writeint(1)
	.stabn 68,0,28,.line28-main
.line28:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif2
_else2:

	# Line 30: out.writeint(0)
	.stabn 68,0,30,.line30-main
.line30:
	pushl $0
	call writeint
	addl $4, %esp
_endif2:

	# Line 34: ifnot(x>0)then
	.stabn 68,0,34,.line34-main
.line34:
	pushl _x
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jle _neq3
	pushl $1
	jmp _cont3
_neq3:
	pushl $0
_cont3:
	popl %eax
	xorl $1, %eax
	pushl %eax
	popl %eax
	cmpl $0, %eax
	jne _if3
	jmp _else3
_if3:

	# Line 35: out.writeint(1)
	.stabn 68,0,35,.line35-main
.line35:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif3
_else3:

	# Line 37: out.writeint(0)
	.stabn 68,0,37,.line37-main
.line37:
	pushl $0
	call writeint
	addl $4, %esp
_endif3:

	# Line 41: ifx=-1ory=0then
	.stabn 68,0,41,.line41-main
.line41:
	pushl _x
	pushl $-1
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq4
	pushl $1
	jmp _cont4
_neq4:
	pushl $0
_cont4:
	pushl _y
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq5
	pushl $1
	jmp _cont5
_neq5:
	pushl $0
_cont5:
	popl %ebx
	popl %eax
	orl %ebx, %eax
	pushl %eax
	popl %eax
	cmpl $0, %eax
	jne _if4
	jmp _else4
_if4:

	# Line 42: out.writeint(1)
	.stabn 68,0,42,.line42-main
.line42:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif4
_else4:

	# Line 44: out.writeint(0)
	.stabn 68,0,44,.line44-main
.line44:
	pushl $0
	call writeint
	addl $4, %esp
_endif4:

	# Line 48: ifx=0andy=0then
	.stabn 68,0,48,.line48-main
.line48:
	pushl _x
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq6
	pushl $1
	jmp _cont6
_neq6:
	pushl $0
_cont6:
	pushl _y
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq7
	pushl $1
	jmp _cont7
_neq7:
	pushl $0
_cont7:
	popl %ebx
	popl %eax
	andl %ebx, %eax
	pushl %eax
	popl %eax
	cmpl $0, %eax
	jne _if5
	jmp _else5
_if5:

	# Line 49: out.writeint(1)
	.stabn 68,0,49,.line49-main
.line49:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif5
_else5:

	# Line 51: out.writeint(0)
	.stabn 68,0,51,.line51-main
.line51:
	pushl $0
	call writeint
	addl $4, %esp
_endif5:

	# Line 54: x:=5
	.stabn 68,0,54,.line54-main
.line54:
	pushl $5
	popl _x

	# Line 55: y:=5
	.stabn 68,0,55,.line55-main
.line55:
	pushl $5
	popl _y

	# Line 56: x:=x*y
	.stabn 68,0,56,.line56-main
.line56:
	pushl _x
	pushl _y
	popl %ebx
	popl %eax
	imull %ebx, %eax
	pushl %eax
	popl _x

	# Line 57: out.writeint(x)
	.stabn 68,0,57,.line57-main
.line57:
	pushl _x
	call writeint
	addl $4, %esp

	# Line 58: y:=x/5*5
	.stabn 68,0,58,.line58-main
.line58:
	pushl _x
	pushl $5
	popl %ebx
	popl %eax
	movl $0, %edx
	idivl %ebx
	pushl %eax
	pushl $5
	popl %ebx
	popl %eax
	imull %ebx, %eax
	pushl %eax
	popl _y

	# Line 59: out.writeint(y)
	.stabn 68,0,59,.line59-main
.line59:
	pushl _y
	call writeint
	addl $4, %esp

	# Line 60: x:=5+3*5+(30/5-1)
	.stabn 68,0,60,.line60-main
.line60:
	pushl $5
	pushl $3
	pushl $5
	popl %ebx
	popl %eax
	imull %ebx, %eax
	pushl %eax
	popl %ebx
	popl %eax
	addl %ebx, %eax
	pushl %eax
	pushl $30
	pushl $5
	popl %ebx
	popl %eax
	movl $0, %edx
	idivl %ebx
	pushl %eax
	pushl $1
	popl %ebx
	popl %eax
	subl %ebx, %eax
	pushl %eax
	popl %ebx
	popl %eax
	addl %ebx, %eax
	pushl %eax
	popl _x

	# Line 61: out.writeint(x)
	.stabn 68,0,61,.line61-main
.line61:
	pushl _x
	call writeint
	addl $4, %esp

	# Line 62: x:=-x
	.stabn 68,0,62,.line62-main
.line62:
	pushl _x
	popl %eax
	negl %eax
	pushl %eax
	popl _x

	# Line 63: out.writeint(x)
	.stabn 68,0,63,.line63-main
.line63:
	pushl _x
	call writeint
	addl $4, %esp

	# Line 65: b1:=true
	.stabn 68,0,65,.line65-main
.line65:
	pushl $1
	popl _b1

	# Line 66: b2:=true
	.stabn 68,0,66,.line66-main
.line66:
	pushl $1
	popl _b2

	# Line 67: ifb1=b2then
	.stabn 68,0,67,.line67-main
.line67:
	pushl _b1
	pushl _b2
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jne _neq8
	pushl $1
	jmp _cont8
_neq8:
	pushl $0
_cont8:
	popl %eax
	cmpl $0, %eax
	jne _if6
	jmp _else6
_if6:

	# Line 68: out.writeint(1)
	.stabn 68,0,68,.line68-main
.line68:
	pushl $1
	call writeint
	addl $4, %esp
	jmp _endif6
_else6:

	# Line 70: out.writeint(0)
	.stabn 68,0,70,.line70-main
.line70:
	pushl $0
	call writeint
	addl $4, %esp
_endif6:

	# Line 73: x:=in.readint()+5
	.stabn 68,0,73,.line73-main
.line73:
	call readint
	pushl %eax
	pushl $5
	popl %ebx
	popl %eax
	addl %ebx, %eax
	pushl %eax
	popl _x

	# Line 74: out.writeint(x)
	.stabn 68,0,74,.line74-main
.line74:
	pushl _x
	call writeint
	addl $4, %esp

	# Line 76: x:=10
	.stabn 68,0,76,.line76-main
.line76:
	pushl $10
	popl _x

	# Line 77: loopwhilex>=0
	.stabn 68,0,77,.line77-main
.line77:
_while0:
	pushl _x
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx, %eax
	jl _neq9
	pushl $1
	jmp _cont9
_neq9:
	pushl $0
_cont9:
	popl %eax
	cmpl $0, %eax
	jne _whilebody0
	jmp _endwhile0
_whilebody0:

	# Line 78: out.writeint(x)
	.stabn 68,0,78,.line78-main
.line78:
	pushl _x
	call writeint
	addl $4, %esp

	# Line 79: x:=x-1
	.stabn 68,0,79,.line79-main
.line79:
	pushl _x
	pushl $1
	popl %ebx
	popl %eax
	subl %ebx, %eax
	pushl %eax
	popl _x
	jmp _while0
_endwhile0:

	# Line 82: Exit call
	pushl $0
	call exit

	.size main, .-main
