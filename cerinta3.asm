.data
	in: .asciz "%110[^\n]"
	dbgout: .asciz "%s\n"
	out: .asciz "%d\n"
	chDelim: .asciz " "
	it: .long 0
	check: .long 1
	nr1: .space 4
	sir: .space 110
	variabile: .space 200
	debug: .space 200
.text

.global main

main:

et_citire:
	movl $variabile, %edi
	pushl %edi
	pushl $sir
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	popl %edi
	pushl %edi
	pushl $chDelim
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx
	popl %edi
	cmp $0, %eax
	je et_exit
	jmp et_state
et_while:
	pushl %edi
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	popl %edi
	cmp $0, %eax
	je et_exit
	jmp et_state

et_state:
	xorl %ebx, %ebx
	mov %eax, %esi 
/*
	pushl check
	pushl $out
	call printf
	popl %ebx
	popl %ebx
*/
	xorl %eax, %eax
	xorl %edx, %edx
	movb (%esi, %edx, 1), %al
	cmp $57, %al
	jbe et_numar
	jmp et_varsauop

et_numar:
	movl (%esi, %edx, 4), %eax
	movl %eax, nr1
	pushl %edi
	pushl $nr1
	call atoi
	popl %ebx
	popl %edi
	pushl %eax
	jmp et_while

et_varsauop:
	movl (%esi, %edx, 4), %eax
	movl %eax, nr1
	pushl %edi
	pushl %esi
	pushl %edx
	pushl %eax
	pushl $nr1
	call strlen
	mov %eax, %ebx
	popl %ecx
	popl %eax
	popl %edx
	popl %esi
	popl %edi
	cmp $1, %ebx
	je et_variabila
	jmp et_operatie
	
et_variabila:
	xorl %eax, %eax
	movb (%esi, %edx, 1), %al
	sub $123, %eax
	movl %eax, it
	pushl it
	jmp et_while
	
et_operatie:
	movl nr1, %eax
	cmp $109, %al
	je et_mul
	cmp $100, %al
	je et_div
	cmp $115, %al
	je et_sub
	cmp $97, %al
	je et_add
	cmp $108, %al
	je et_let
// de adaugat la operatii variabilele si de facut functia pt operatia let
et_mul:
	popl %eax
	popl %ebx
	cmp $0, %eax
	jns mul_numar1
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %eax
mul_numar1:
	cmp $0, %ebx
	jns mul_numar2
	pushl %eax
	mov %ebx, %eax
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %ebx
	popl %eax
mul_numar2:
	xorl %edx, %edx
	mul %ebx
	pushl %eax
	jmp et_while

et_div:
	popl %ebx
	popl %eax
	cmp $0, %eax
	jns div_numar1
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %eax
div_numar1:
	cmp $0, %ebx
	jns div_numar2
	pushl %eax
	mov %ebx, %eax
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %ebx
	popl %eax
div_numar2:
	xorl %edx, %edx
	div %ebx
	pushl %eax
	jmp et_while

et_sub:
	popl %ebx
	popl %eax
	cmp $0, %eax
	jns sub_numar1
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %eax
sub_numar1:
	cmp $0, %ebx
	jns sub_numar2
	pushl %eax
	mov %ebx, %eax
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %ebx
	popl %eax
sub_numar2:
	sub %ebx, %eax
	pushl %eax
	jmp et_while

et_add:
	popl %ebx
	popl %eax
	cmp $0, %eax
	jns add_numar1
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %eax
add_numar1:
	cmp $0, %ebx
	jns add_numar2
	pushl %eax
	mov %ebx, %eax
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	mov $4, %ecx
	mul %ecx
	xorl %ecx, %ecx
	mov (%edi, %eax, 4), %ebx
	popl %eax
add_numar2:
	add %ebx, %eax
	pushl %eax
	jmp et_while

et_let:
	popl %ecx
	popl %eax
	add $123, %eax
	sub $96, %eax
	xorl %edx, %edx
	movl $4, %ebx
	mul %ebx
	movl %ecx, (%edi, %eax, 4)
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
