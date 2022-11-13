	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	""
.LC1:
	.string	"-f"
.LC2:
	.string	"r"
.LC3:
	.string	"../input.txt"
.LC4:
	.string	"../input2.txt"
.LC5:
	.string	"input.txt"
.LC6:
	.string	"input2.txt"
.LC7:
	.string	"Cannot open file."
.LC8:
	.string	"output.txt"
.LC9:
	.string	"Input first string:"
.LC10:
	.string	"Input second string:"
.LC11:
	.string	"%s"
.LC12:
	.string	"w"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	lea	rax, .LC0[rip]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC0[rip]
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	cmp	DWORD PTR -68[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L3
.L2:
	cmp	DWORD PTR -68[rbp], 2
	jne	.L4
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	call	strcmp@PLT
	test	eax, eax
	jne	.L4
	lea	rsi, .LC2[rip]
	lea	rdi, .LC3[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rsi, .LC2[rip]
	lea	rdi, .LC4[rip]
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L5
	cmp	QWORD PTR -40[rbp], 0
	jne	.L6
.L5:
	lea	rsi, .LC2[rip]
	lea	rdi, .LC5[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rsi, .LC2[rip]
	lea	rdi, .LC6[rip]
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L7
	cmp	QWORD PTR -40[rbp], 0
	jne	.L6
.L7:
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L8
.L6:
	lea	rax, .LC8[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -16[rbp], rax
	jmp	.L3
.L4:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -8[rbp], rax
	lea	rdi, .LC10[rip]
	call	puts@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -16[rbp], rax
.L3:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	combination@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L9
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L10
.L9:
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	fputs@PLT
.L10:
	mov	eax, 0
.L8:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
