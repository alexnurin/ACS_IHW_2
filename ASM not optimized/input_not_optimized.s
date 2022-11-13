	.file	"input.c"
	.intel_syntax noprefix
	.text
	.globl	input
	.type	input, @function
input:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi # inputStream
	                            # inputStream <=> -40[rbp]
	mov	QWORD PTR -8[rbp], 2    # size_t size = 2
	                            # size <=> -8[rbp]
	mov	QWORD PTR -16[rbp], 0   # size_t cur_size = 2
	                            # cur_size <=> -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax # char *str = (char *) malloc((size) * sizeof(char))
	                            # str <=> -24[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	BYTE PTR [rax], 0       # str[0] = '\0'
.L5:
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	getc@PLT
	mov	BYTE PTR -25[rbp], al   # char ch = (char) getc(inputStream)
	                            # ch <=> -25[rbp]
	cmp	BYTE PTR -25[rbp], 10   # if (..) - если символ завершения ввода
	                            # то завершаем цикл:
	jne	.L2
	mov	rax, QWORD PTR stdin[rip]
	cmp	QWORD PTR -40[rbp], rax
	je	.L3
.L2:
	cmp	BYTE PTR -25[rbp], -1
	je	.L3

	mov	rax, QWORD PTR -16[rbp]
	add	rax, 1
	cmp	QWORD PTR -8[rbp], rax      # if (cur_size + 1 >= size) {
	ja	.L4
	sal	QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -8[rbp]      # size *= 2
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	realloc@PLT
	mov	QWORD PTR -24[rbp], rax     # str = realloc(str, size * sizeof(char))
.L4:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -16[rbp], rdx
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -25[rbp]  # str[cur_size++] = ch;
	mov	BYTE PTR [rdx], al
	jmp	.L5                         # бесконечный цикл (до конца ввода)
.L3:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0           # str[cur_size] = '\0'
	mov	rax, QWORD PTR -24[rbp]
	leave
	ret

	.size	input, .-input
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