.data

	# Line 8: x: int
	.comm _x, 4, 4

.text
.global main
	.type  main,  @function
main:
	call   start 

	# Line 26: Exit call
	pushl  $0    
	call   exit  



.global start
	.type  start, @function
start:

	# Line 12: x := in.readint()
	call   readint
	pushl  %eax  
	popl   _x    

	# Line 13: if (x > 0) then
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

	# Line 14: out.writeint(1)
	pushl  $1    
	call   writeint
	addl   $4,    %esp  
	jmp    _endif0
_else0:

	# Line 16: if (x = 0) then
	pushl  _x    
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if1  
	jmp    _else1
_if1:

	# Line 17: out.writeint(0)
	pushl  $0    
	call   writeint
	addl   $4,    %esp  
	jmp    _endif1
_else1:

	# Line 19: out.writeint(-1)
	pushl  $-1   
	call   writeint
	addl   $4,    %esp  
_endif1:

	# Line 21: out.writeint(9)
	pushl  $9    
	call   writeint
	addl   $4,    %esp  
_endif0:

	# Line 23: out.writeint(9)
	pushl  $9    
	call   writeint
	addl   $4,    %esp  
	ret          

