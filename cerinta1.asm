.data
	useless: .long 8
	in: .asciz "%s"
	out: .asciz "%s\n"
	cat: .byte 100
	rest: .byte 0
	rez: .byte 0
	x: .space 5
	hexa: .space 110
	binary: .space 440
	final: .space 440
	variabila: .space 1
	numar: .space 1
.text

.global main

main:
	pushl $hexa
	pushl $in
	call scanf
	popl %ebx
	popl %ebx
	movl $hexa, %edi
	movl $binary, %esi
	xorl %edx, %edx
	xorl %ecx, %ecx
	
et_for:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je et_MCtoPolish
//0
	cmp $48, %al
	je x0
//1
	cmp $49, %al
	je x1
//2
	cmp $50, %al
	je x2
//3
	cmp $51, %al
	je x3
//4
	cmp $52, %al
	je x4
//5
	cmp $53, %al
	je x5
//6
	cmp $54, %al
	je x6
//7
	cmp $55, %al
	je x7
//8
	cmp $56, %al
	je x8
//9
	cmp $57, %al
	je x9
//A
	cmp $65, %al
	je xA
//B
	cmp $66, %al
	je xB
//C
	cmp $67, %al
	je xC
//D
	cmp $68, %al
	je xD
//E
	cmp $69, %al
	je xE
//F
	cmp $70, %al
	je xF
	
et_cont:
	incl %ecx
	jmp et_for

x0:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x1:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x2:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x3:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x4:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x5:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x6:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x7:
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x8:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
x9:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xA:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xB:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xC:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xD:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xE:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $48, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
xF:
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	movb $49, (%esi, %edx, 1)
	incl %edx
	jmp et_cont
	
et_MCtoPolish:
//binary
	xorl %edx, %edx 
//final 
	xorl %ecx, %ecx 
	movl $final, %edi
	
et_for2:
	movb (%esi, %edx, 1), %al
	cmp $0, %al
	je et_afisare
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_operatie
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_variabila
	jmp et_numar
et_cont2:
	incl %edx
	jmp et_for2	
	
et_operatie:
	add useless, %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_div
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_subormul
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_add
	jmp et_let
	
et_div:
	movb $100, (%edi, %ecx, 1)
	incl %ecx
	movb $105, (%edi, %ecx, 1)
	incl %ecx
	movb $118, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	incl %edx
	incl %edx
	jmp et_cont2

et_subormul:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_mul
	jmp et_sub

et_mul:
	movb $109, (%edi, %ecx, 1)
	incl %ecx
	movb $117, (%edi, %ecx, 1)
	incl %ecx
	movb $108, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_sub:
	movb $115, (%edi, %ecx, 1)
	incl %ecx
	movb $117, (%edi, %ecx, 1)
	incl %ecx
	movb $98, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_add:
	movb $97, (%edi, %ecx, 1)
	incl %ecx
	movb $100, (%edi, %ecx, 1)
	incl %ecx
	movb $100, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_let:
	movb $108, (%edi, %ecx, 1)
	incl %ecx
	movb $101, (%edi, %ecx, 1)
	incl %ecx
	movb $116, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_variabila:
	xorb %al, %al
	movb %al, variabila
	incl %edx
	incl %edx
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit6
et_comeback6:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit5
	jmp et_cont2
et_comeback5:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit4
et_comeback4:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit3
et_comeback3:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit2
et_comeback2:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit1
et_comeback1:
	incl %edx
	mov (%esi, %edx, 1), %al
	cmp $49, %al
	je et_v_bit0
et_comeback0:
	movb variabila, %al
	movb %al, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_v_bit6:
	mov $64, %al
	addb %al, variabila
	jmp et_comeback6
	
et_v_bit5:
	mov $32, %al
	addb %al, variabila
	jmp et_comeback5

et_v_bit4:
	mov $16, %al
	addb %al, variabila
	jmp et_comeback4
	
et_v_bit3:
	mov $8, %al
	addb %al, variabila
	jmp et_comeback3
	
et_v_bit2:
	mov $4, %al
	addb %al, variabila
	jmp et_comeback2
	
et_v_bit1:
	mov $2, %al
	addb %al, variabila
	jmp et_comeback1

et_v_bit0:
	mov $1, %al
	addb %al, variabila
	jmp et_comeback0
	

et_numar:
	xorb %al, %al
	movb %al, numar
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $48, %al
	je et_faraminus
	movb $45, (%edi, %ecx, 1)
	incl %ecx
et_faraminus:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit7
et_cmb7:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit6
et_cmb6:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit5
et_cmb5:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit4
et_cmb4:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit3
et_cmb3:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit2
et_cmb2:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit1
et_cmb1:
	incl %edx
	movb (%esi, %edx, 1), %al
	cmp $49, %al
	je et_nr_bit0
et_cmb0:
	pushl %edx
	pushl %ecx
	mov $0, %edx
	mov $0, %ecx
	movb numar, %al
	movb cat, %cl
	div %ecx
	add $48, %al
	movb %dl, rest
	popl %ecx
	popl %edx
	cmp $48, %al
	je et_zero1
	movb %al, (%edi, %ecx, 1)
	incl %ecx
	pushl %edx
	pushl %ecx
	mov $0, %eax
	mov $0, %ecx
	mov $0, %edx
	movb rest, %al
	movb $10, %cl
	div %ecx
	add $48, %al
	movb %dl, rest
	popl %ecx
	popl %edx
	movb %al, (%edi, %ecx, 1)
	incl %ecx
	movb rest, %al
	add $48, %al
	movb %al, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_zero1:
	pushl %edx
	pushl %ecx
	mov $0, %eax
	mov $0, %ecx
	mov $0, %edx
	movb rest, %al
	movb $10, %cl
	div %ecx
	add $48, %al
	movb %dl, rest
	popl %ecx
	popl %edx
	cmp $48, %al
	je et_zero2
	movb %al, (%edi, %ecx, 1)
	incl %ecx
et_zero2:
	movb rest, %al
	add $48, %al
	movb %al, (%edi, %ecx, 1)
	incl %ecx
	movb $32, (%edi, %ecx, 1)
	incl %ecx
	jmp et_cont2
	
et_nr_bit7:
	movb $128, %al
	addb %al, numar
	jmp et_cmb7

et_nr_bit6:
	movb $64, %al
	addb %al, numar
	jmp et_cmb6

et_nr_bit5:
	movb $32, %al
	addb %al, numar
	jmp et_cmb5

et_nr_bit4:
	movb $16, %al
	addb %al, numar
	jmp et_cmb4
	
et_nr_bit3:
	movb $8, %al
	addb %al, numar
	jmp et_cmb3
	
et_nr_bit2:
	movb $4, %al
	addb %al, numar
	jmp et_cmb2
	
et_nr_bit1:
	movb $2, %al
	addb %al, numar
	jmp et_cmb1

et_nr_bit0:
	movb $1, %al
	addb %al, numar
	jmp et_cmb0
	
et_afisare:
	pushl $final
	pushl $out
	call printf
	popl %ebx
	popl %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

