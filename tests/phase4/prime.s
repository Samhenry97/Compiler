.data

.text
.global main
main:
	call   start 

	# Line 56: Exit call
	pushl  $0    
	call   exit  



.global isPrime
isPrime:

	# Line 10: good := true
	pushl  $1    
	popl   _good 

	# Line 13: if not (x > 1) then
	pushl  8(%ebp)
	pushl  $1    
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
	jne    _if0  
	jmp    _else0
_if0:

	# Line 14: good := false
	pushl  $0    
	popl   _good 
	jmp    _endif0
_else0:

	# Line 18: if not (x > 3) then
	pushl  8(%ebp)
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
	jne    _if1  
	jmp    _else1
_if1:

	# Line 19: good := true
	pushl  $1    
	popl   _good 
	jmp    _endif1
_else1:

	# Line 23: if (x - (x / 2) * 2) = 0 or (x - (x / 3) * 3) = 0 then
	pushl  8(%ebp)
	pushl  8(%ebp)
	pushl  $2    
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	pushl  $2    
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	pushl  8(%ebp)
	pushl  8(%ebp)
	pushl  $3    
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	pushl  $3    
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	orl    %ebx,  %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if2  
	jmp    _else2
_if2:

	# Line 24: good := false
	pushl  $0    
	popl   _good 
	jmp    _endif2
_else2:

	# Line 27: div := 5
	pushl  $5    
	popl   _div  

	# Line 28: loop while not(div * div >= x)
_while0:
	pushl  -8(%ebp)
	pushl  -8(%ebp)
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	pushl  8(%ebp)
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
	jne    _whilebody0
	jmp    _endwhile0
_whilebody0:

	# Line 29: if (x - (x / div) * div) = 0 or (x - (x / (div + 2)) * (div + 2)) = 0 then
	pushl  8(%ebp)
	pushl  8(%ebp)
	pushl  -8(%ebp)
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	pushl  -8(%ebp)
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	pushl  8(%ebp)
	pushl  8(%ebp)
	pushl  -8(%ebp)
	pushl  $2    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	movl   $0,    %edx  
	idivl  %ebx  
	pushl  %eax  
	pushl  -8(%ebp)
	pushl  $2    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	imull  %ebx,  %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	subl   %ebx,  %eax  
	pushl  %eax  
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %ebx  
	popl   %eax  
	orl    %ebx,  %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if3  
	jmp    _else3
_if3:

	# Line 30: good := false
	pushl  $0    
	popl   _good 
	jmp    _endif3
_else3:
_endif3:

	# Line 32: div := div + 6
	pushl  -8(%ebp)
	pushl  $6    
	popl   %ebx  
	popl   %eax  
	addl   %ebx,  %eax  
	pushl  %eax  
	popl   _div  
	jmp    _while0
_endwhile0:
_endif2:
_endif1:
_endif0:

	# Line 38: isPrime := good
	pushl  -12(%ebp)
	popl   _isPrime
	ret          

.global start
start:

	# Line 44: x := in.readint()
	call   readint
	pushl  %eax  
	popl   _x    

	# Line 45: loop while not (x = 0)
_while1:
	pushl  -8(%ebp)
	pushl  $0    
	popl   %ebx  
	popl   %eax  
	cmpl   %ebx,  %eax  
	sete   %al   
	movzbl %al,   %eax  
	pushl  %eax  
	popl   %eax  
	xorl   $1,    %eax  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _whilebody1
	jmp    _endwhile1
_whilebody1:

	# Line 46: if isPrime(x) then
	pushl  -8(%ebp)
	call   isPrime
	addl   $4,    %esp  
	pushl  %eax  
	popl   %eax  
	cmpl   $0,    %eax  
	jne    _if4  
	jmp    _else4
_if4:

	# Line 47: out.writeint(1)
	pushl  $1    
	call   writeint
	addl   $4,    %esp  
	jmp    _endif4
_else4:

	# Line 49: out.writeint(0)
	pushl  $0    
	call   writeint
	addl   $4,    %esp  
_endif4:

	# Line 52: x := in.readint()
	call   readint
	pushl  %eax  
	popl   _x    
	jmp    _while1
_endwhile1:
	ret          

