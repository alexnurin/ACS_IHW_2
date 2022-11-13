	.file	"input.c"
	.intel_syntax noprefix
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi # принимаем аргумент inputStream
	                            # inputStream <=> -40[rbp]
	mov	QWORD PTR -8[rbp], 2    # size_t size = 2
	                            # size <=> -8[rbp]
	mov	QWORD PTR -16[rbp], 0   # size_t cur_size = 2
	                            # cur_size <=> -16[rbp]
	mov	rdi, QWORD PTR -8[rbp]
	call	malloc@PLT          # malloc(size)
	mov	QWORD PTR -24[rbp], rax # char *str = (char *) malloc((size) * sizeof(char))
	                            # str <=> -24[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	BYTE PTR [rax], 0       # str[0] = '\0'
.L5:
	mov	rdi, QWORD PTR -40[rbp]
	call	getc@PLT            # getc(inputStream)
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
	mov	rsi, QWORD PTR -8[rbp]      # size *= 2
	mov	rdi, QWORD PTR -24[rbp]     # str
	call	realloc@PLT             # realloc(str, size * sizeof(char))
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
	mov	rax, QWORD PTR -24[rbp]     # return str - возвращаем строку и завершаем функцию
	leave
	ret
