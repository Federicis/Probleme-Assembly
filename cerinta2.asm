.data
	test: .int 0
	in: .asciz "%110[^\n]"
	out: .asciz "%d\n"
	chDelim: .asciz " "
	nr1: .space 4
	sir: .space 110
.text

.global main

main:

et_citire:
	pushl $sir
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	pushl $chDelim
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je et_exit
	jmp et_state
et_while:
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je et_exit
	jmp et_state

et_state:
	mov %eax, %esi 
	xorl %eax, %eax
	xorl %edx, %edx
	movb (%esi, %edx, 1), %al
	cmp $57, %al
	jbe et_numar
	jmp et_operatie

et_numar:
	movl (%esi, %edx, 4), %eax
	movl %eax, nr1
	pushl $nr1
	call atoi
	popl %ebx
	pushl %eax
	jmp et_while

et_operatie:
	cmp $109, %al
	je et_mul
	cmp $100, %al
	je et_div
	cmp $115, %al
	je et_sub
	cmp $97, %al
	je et_add
	
et_mul:
	popl %eax
	popl %ebx
	xorl %edx, %edx
	mul %ebx
	pushl %eax
	jmp et_while

et_div:
	popl %ebx
	popl %eax
	xorl %edx, %edx
	div %ebx
	pushl %eax
	jmp et_while

et_sub:
	popl %ebx
	popl %eax
	sub %ebx, %eax
	pushl %eax
	jmp et_while

et_add:
	popl %ebx
	popl %eax
	add %ebx, %eax
	pushl %eax
	jmp et_while

et_exit:
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
// reminder debug input ascii to int daca nu intra pe tester
