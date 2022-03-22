.data
	formatScanf: .asciz "%1000[^\n]"
	formatPrintf: .asciz "%d "
	last: .asciz "%d\n"
	debugprintf: .asciz "%d!\n"
	chDelim: .asciz " "
	n: .long 0
	nnn: .long 0
	m:	.long 0
	ok: .long 1
	permutare: .space 1000
	s: .space 1000
	fr: .space 1000
	solution: .space 1000
	stack: .space 1000
	subb: .space 1000
.text

afisare:
	movl stack, %esp
	movl nnn, %eax
	movl $solution, %esi
	movl $1, %ecx
et_forfinal:
	pushl %ecx
	pushl %eax
	pushl (%esi, %ecx, 4)
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %eax
	popl %ecx
	incl %ecx
	cmp %eax, %ecx
	jl et_forfinal
	pushl (%esi, %ecx, 4)
	pushl $last
	call printf
	popl %ebx
	popl %ebx
	xorl %eax, %eax
	pushl %eax
	call fflush
	popl %ebx
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80

bkt:
	pushl %ebp
	movl %esp, %ebp
	

	movl nnn, %eax
	cmp %eax, 8(%ebp)
	ja et_jumpafisare
	movl $permutare, %esi
	movl 8(%ebp), %ecx
	cmp $0, (%esi, %ecx, 4)
	je et_next
		incl %ecx
		pushl %ecx
		call bkt
		popl %ecx
		decl %ecx
		jmp et_return
	///solution = %edi, fr = %esi inc = %ecx, n = %eax, i = %ebx, j = %edx
et_next:
	movl $solution, %edi
	movl $1, %ebx
	movl $fr, %esi
	movl n, %eax
	
et_fori:
//{



	cmp $3, (%esi, %ebx, 4)
	jae et_inci
	movl $1, %edx
	movl %edx, ok
	movl %ecx, %edx
	decl %edx
	cmp $0, %edx
	je et_cont1
et_forj1:
	//{
		cmp (%edi, %edx, 4), %ebx
		jne et_ok1
		pushl %edx
		xorl %edx, %edx
		movl %edx, ok
		popl %edx
et_ok1:
		decl %edx
		movl 8(%ebp), %ecx
		pushl %ecx
		sub m, %ecx
		movl %ecx, subb
		popl %ecx
		
		cmp subb, %edx
	//does it work?
		jl et_cont1
		cmp $0, %edx
		je et_cont1
		jmp et_forj1
	//}
et_cont1:
	movl %ecx, %edx
	incl %edx
	cmp nnn, %edx
	ja et_cont2
et_forj2:
	//{
		cmp (%edi, %edx, 4), %ebx
		jne et_ok2
		pushl %edx
		xorl %edx, %edx
		movl %edx, ok
		popl %edx
et_ok2:
		incl %edx
		pushl %ecx
		add m, %ecx
		movl %ecx, subb
		popl %ecx
		cmp subb, %edx
	//does it work?
		jg et_cont2
		cmp nnn, %edx
		ja et_cont2
		jmp et_forj2
	//}
et_cont2:
	movl ok, %edx
	cmp $1, %edx
	jne et_inci
	movl %ebx, (%edi, %ecx, 4)
	incl (%esi, %ebx, 4)
	incl %ecx
	pushl %eax
	pushl %ebx
	pushl %ecx
	call bkt
	popl %ecx
	popl %ebx
	popl %eax
	decl %ecx
	decl (%esi, %ebx, 4)
	movl $0, (%edi, %ecx, 4)
et_inci:
	incl %ebx
	cmp %eax, %ebx
	jbe et_fori
//}
et_return:
	popl %ebp
	ret
et_jumpafisare:
	call afisare
	
.global main

main:
	movl %esp, stack
	movl $fr, %esi
	movl $permutare, %edi
	pushl $s
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	pushl $chDelim
	pushl $s
	call strtok
	popl %ebx
	popl %ebx
	pushl %eax
	call atoi
	popl %ebx
	movl %eax, n
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	pushl %eax
	call atoi
	popl %ebx
	movl %eax, m
	xorl %edx, %edx
	movl n, %eax
	movl $3, %ebx
	xorl %edx, %edx
	mul %ebx
	movl %eax, nnn
	movl $1, %ecx
	movl $solution, %edx

et_while:
	pushl %edx
	pushl %ecx
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	popl %ecx
	popl %edx
	cmp $0, %eax
	je et_cont
	pushl %edx
	pushl %ecx
	pushl %eax
	call atoi
	popl %ebx
	popl %ecx
	popl %edx
	movl %eax, (%edi, %ecx, 4)
	movl %eax, (%edx, %ecx, 4)
	incl (%esi, %eax, 4)
	incl %ecx
	jmp et_while
et_cont:
	pushl $1
	call bkt
	popl %ebx
	movl $1, %eax
	neg %eax
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	movl $0, %eax
	pushl %eax
	call fflush
	popl %eax
et_exit:
	mov $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
