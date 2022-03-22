.data
	in: .asciz "%d"
	ina: .asciz "%s"
	out: .asciz "%d "
	out2: .asciz "%s"
	op_sau_rot: .asciz "         "
	n: .long 0
	m: .long 0
	nr: .long 0
	i: .long 0
	j: .long 0
	fckidiv: .long -1
	nume_matrice: .space 10
	useless_let: .space 10
	matrix: .space 5000
	
.text

.global main

main:

et_citire:
	pushl $nume_matrice
	pushl $ina
	call scanf
	popl %ebx
	popl %ebx
	pushl $n
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	pushl $m
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	mov m, %edi
	mov n, %esi
	mov $matrix, %ecx
et_fori:
	incl i
	mov $0, %edx
	mov %edx, j
	cmp i, %esi
	jb et_cont
et_forj:
	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	pushl %eax
	pushl %ecx
	pushl $nr
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	popl %ecx
	popl %eax
	movl nr, %ebx
	movl %ebx, (%ecx, %eax, 4)
	cmp j, %edi
	je et_fori
	jmp et_forj
et_cont:
	pushl $useless_let
	pushl $ina
	call scanf
	popl %ebx
	popl %ebx
	pushl $nume_matrice
	pushl $ina
	call scanf
	popl %ebx
	popl %ebx
	mov $nume_matrice, %ecx
	mov $0, %eax
	movb (%ecx, %eax, 1), %al
	cmp $97, %eax
	jb et_exit
	pushl %ecx
	call strlen
	popl %ebx
	cmp $1, %eax
	ja et_exit
	pushl $op_sau_rot
	pushl $ina
	call scanf
	popl %ebx
	popl %ebx
	mov $op_sau_rot, %ecx
	mov $0, %eax
	movb (%ecx, %eax, 1), %al
	cmp $114, %al
	je et_rotire
	jmp et_operatie
	
et_rotire:
	pushl m
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	pushl n
	pushl $out
	call printf
	popl %ebx
	popl %ebx
//	for j = 1; j <= m; j++
//	for i = 1; i <= n; i++
	movl $0, %ebx
	movl %ebx, i
	movl %ebx, j
	xorl %eax, %eax
	mov $1, %edi
	mov m, %esi
	mov $matrix, %ecx
et_forj2:
	incl j
	mov n, %edx
	mov %edx, i
	incl i
	cmp j, %esi
	jb et_exit
et_fori2:
	mov i, %edx
	sub $1, %edx
	mov %edx, i
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	movl (%ecx, %eax, 4), %ebx
	movl %ebx, nr
	pushl %ecx
	pushl nr
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	cmp i, %edi
	je et_forj2
	jmp et_fori2
	
et_operatie:
	pushl n
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	pushl m
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	pushl $op_sau_rot
	call atoi
	popl %ebx
	movl %eax, nr
	pushl $op_sau_rot
	pushl $ina
	call scanf
	popl %ebx
	popl %ebx
	movl $op_sau_rot, %ebx
	xorl %eax, %eax
	movb (%ebx, %eax, 1), %al
	cmp $97, %al
	je et_add
	cmp $115, %al
	je et_sub
	cmp $109, %al
	je et_mul
	cmp $100, %al
	je et_div
	jmp et_exit

et_add:
	mov m, %edi
	mov n, %esi
	xorl %edx, %edx
	mov %edx, i
	mov %edx, j
	mov $matrix, %ecx
et_foria:
	incl i
	mov $0, %edx
	mov %edx, j
	cmp i, %esi
	jb et_exit
et_forja:
	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	movl (%ecx, %eax, 4), %ebx
	add nr, %ebx
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %eax
	popl %ecx
	cmp j, %edi
	je et_foria
	jmp et_forja

et_sub:
	mov m, %edi
	mov n, %esi
	xorl %edx, %edx
	mov %edx, i
	mov %edx, j
	mov $matrix, %ecx
et_foris:
	incl i
	mov $0, %edx
	mov %edx, j
	cmp i, %esi
	jb et_exit
et_forjs:
	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	movl (%ecx, %eax, 4), %ebx
	sub nr, %ebx
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %eax
	popl %ecx
	cmp j, %edi
	je et_foris
	jmp et_forjs

et_mul:
	mov m, %edi
	mov n, %esi
	xorl %edx, %edx
	mov %edx, i
	mov %edx, j
	mov $matrix, %ecx
et_forim:
	incl i
	mov $0, %edx
	mov %edx, j
	cmp i, %esi
	jb et_exit
et_forjm:
	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	pushl %eax
	movl (%ecx, %eax, 4), %eax
	xorl %edx, %edx
	movl nr, %ebx
	imul %ebx
	movl %eax, %ebx
	popl %eax
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %eax
	popl %ecx
	cmp j, %edi
	je et_forim
	jmp et_forjm

et_div:
	mov m, %edi
	mov n, %esi
	xorl %edx, %edx
	mov %edx, i
	mov %edx, j
	mov $matrix, %ecx
et_forid:
	incl i
	mov $0, %edx
	mov %edx, j

	cmp i, %esi
	jb et_exit
et_forjd:

	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
// %ecx = adresa
// %eax = locatia
	pushl %eax
	movl (%ecx, %eax, 4), %eax
	xorl %edx, %edx
	movl nr, %ebx
	cmp $0, %eax
	jns et_next
	pushl %ecx
	mov fckidiv, %ecx
	imul %ecx
	xorl %edx, %edx
	pushl %eax
	mov %ebx, %eax
	imul %ecx
	mov %eax, %ebx
	popl %eax
	popl %ecx
	xorl %edx, %edx
et_next:
	idiv %ebx
	movl %eax, %ebx
	popl %eax
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %eax
	popl %ecx
	cmp j, %edi
	je et_forid
	jmp et_forjd

et_exit:
	mov $10, %eax
	mov %eax, op_sau_rot
	pushl $op_sau_rot
	pushl $out2
	call printf
	popl %ebx
	popl %ebx
	pushl $0
	call fflush
	popl %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	

/*
et_check:
	movl $matrix, %ecx
	movl $0, %ebx
	movl %ebx, i
	movl %ebx, j
	xorl %eax, %eax
et_fori2:
	incl i
	mov $0, %edx
	mov %edx, j
	cmp i, %esi
	jb et_exit
et_forj2:
	incl j
	movl i, %eax
	sub $1, %eax
	xorl %edx, %edx
	mov m, %ebx
	mul %ebx
	add j, %eax
	mov $4, %ebx
	xorl %edx, %edx
	mul %ebx
	movl (%ecx, %eax, 4), %ebx
	movl %ebx, nr
	pushl %eax
	pushl %ecx
	pushl nr
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	popl %eax
	cmp j, %edi
	je et_fori2
	jmp et_forj2
*/
