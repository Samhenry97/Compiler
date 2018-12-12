.data

	# Line 2: mov: int
	.comm _mov, 4, 4

	# Line 3: x: int
	.comm _x, 4, 4

	# Line 4: y: int
	.comm _y, 4, 4

.text
.global main
	.type  main,  @function
main:
	call   start 

	# Line 34: Exit call
	pushl  $0    
	call   exit  



.global start
	.type  start, @function
start:

	# Line 9: mov := 12 * in.readint()   ~ Enter 10
	pushl  $12   
	call   readint
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   _mov  

	# Line 10: out.writeint(mov)           ~ 120
	pushl  _mov  
	call   writeint
	addl   $4,    %esp  

	# Line 12: mov := mov / -1
	pushl  _mov  
	pushl  $-1   
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	popl   _mov  

	# Line 13: out.writeint(mov)           ~ -120
	pushl  _mov  
	call   writeint
	addl   $4,    %esp  

	# Line 15: mov := mov * -1
	pushl  _mov  
	pushl  $-1   
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   _mov  

	# Line 16: out.writeint(mov)           ~ 120
	pushl  _mov  
	call   writeint
	addl   $4,    %esp  

	# Line 18: if (true) then
	pushl  $1    
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if0  
	jmp    _else0
_if0:

	# Line 19: x := 1
	pushl  $1    
	popl   _x    

	# Line 20: loop while not (x > 3)   ~ -1 -2 1 -1 -2 2 -1 -2 3
_while0:
	pushl  _x    
	pushl  $3    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	setg   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _whilebody0
	jmp    _endwhile0
_whilebody0:

	# Line 21: y := 2
	pushl  $2    
	popl   _y    

	# Line 22: loop while y > -2
_while1:
	pushl  _y    
	pushl  $-2   
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	setg   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _whilebody1
	jmp    _endwhile1
_whilebody1:

	# Line 23: y := y - 1
	pushl  _y    
	pushl  $1    
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	popl   _y    

	# Line 24: if not (y >= 0) then
	pushl  _y    
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	setge  %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if1  
	jmp    _else1
_if1:

	# Line 25: out.writeint(y)
	pushl  _y    
	call   writeint
	addl   $4,    %esp  
	jmp    _endif1
_else1:
_endif1:
	jmp    _while1
_endwhile1:

	# Line 28: out.writeint(x)
	pushl  _x    
	call   writeint
	addl   $4,    %esp  

	# Line 29: x := x + 1
	pushl  _x    
	pushl  $1    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	popl   _x    
	jmp    _while0
_endwhile0:
	jmp    _endif0
_else0:
_endif0:
	ret          

