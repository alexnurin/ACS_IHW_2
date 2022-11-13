	.file	"combination.c"
	.intel_syntax noprefix
	.text
	.globl	combination
	.type	combination, @function
combination:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 72
	mov	QWORD PTR -72[rbp], rdi     # char *a
	                                # a <=> -72[rbp]
	mov	QWORD PTR -80[rbp], rsi     # char *b
	                                # b <=> -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rbx, rax
	mov	rax, QWORD PTR -80[rbp]
	mov	rdi, rax
	call	strlen@PLT
	add	rax, rbx
	add	rax, 1
	mov	QWORD PTR -56[rbp], rax     # size_t size = len(a) + len(b) + 1
	                                # size <=> -56[rbp]
	mov	QWORD PTR -24[rbp], 0       # size_t cur_size = 0
	                                # cur_size <=> -24[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -64[rbp], rax     # char *c = ..
	                                # c <=> -64[rbp]
	mov	DWORD PTR -28[rbp], 0       # int i = 0
	                                # local i <=> -28[rbp]
	jmp	.L2
.L8:
	mov	DWORD PTR -32[rbp], 0       # int found = 0
	                                # found <=> -32[rbp]
	mov	DWORD PTR -36[rbp], 0       # for (int j = 0;...
	                                # local j <=> -36[rbp]
	jmp	.L3
.L6:
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -64[rbp]
	add	rax, rdx                    # c[j]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -28[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -72[rbp]
	add	rax, rcx                    # a[i]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al                      # if (c[j] == a[i])
	jne	.L4
	mov	DWORD PTR -32[rbp], 1       # found = 1
	jmp	.L5                         # break
.L4:
	add	DWORD PTR -36[rbp], 1
.L3:
	mov	eax, DWORD PTR -36[rbp]     # for (..; j < ...) {
	movsx	rbx, eax
	mov	rax, QWORD PTR -64[rbp]     # c
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax                    # for (..; j < strlen(c); ..) {
	jb	.L6
.L5:
	cmp	DWORD PTR -32[rbp], 0       # if (!found)
	jne	.L7
	mov	eax, DWORD PTR -28[rbp]     # i
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]     # a[i]
	lea	rcx, [rdx+rax]              # rcx = &a[i]
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	rdx, QWORD PTR -64[rbp]
	add	rdx, rax                    # c[cur_size]
	movzx	eax, BYTE PTR [rcx]     # c[cur_size] = a[i];
	mov	BYTE PTR [rdx], al
.L7:
	add	DWORD PTR -28[rbp], 1       # cur_size++
.L2:
	mov	eax, DWORD PTR -28[rbp]     # for (..; i < ..) {
	movsx	rbx, eax
	mov	rax, QWORD PTR -72[rbp]     # a -> rax
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax                    # for (..; i < strlen(a); ..) {
	jb	.L8
	mov	DWORD PTR -40[rbp], 0       # int i = 0 (второй внешний цикл)
	                                # local i <=> -40[rbp]
	jmp	.L9
.L15:
	mov	DWORD PTR -44[rbp], 0       # int found = 0
	                                # local found <=> -44[rbp]
	mov	DWORD PTR -48[rbp], 0       # int j = 0 (второй внутренний цикл)
	                                # local j <=> -48[rbp]
	jmp	.L10
.L13:
	mov	eax, DWORD PTR -48[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -64[rbp]
	add	rax, rdx                    # c[j]
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -40[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rcx                    # b[i]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al                      # if (c[j] == b[i]) {
	jne	.L11
	mov	DWORD PTR -44[rbp], 1
	jmp	.L12
.L11:
	add	DWORD PTR -48[rbp], 1
.L10:
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	cmp	QWORD PTR -24[rbp], rax    # for (int j = 0; j < cur_size; j++) {
	ja	.L13
.L12:
	cmp	DWORD PTR -44[rbp], 0       # if (!found) {
	jne	.L14
	mov	eax, DWORD PTR -40[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -80[rbp]
	lea	rcx, [rdx+rax]              # rcx = &b[i]
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	rdx, QWORD PTR -64[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR [rcx]     # c[cur_size++] = b[i];
	mov	BYTE PTR [rdx], al
.L14:
	add	DWORD PTR -40[rbp], 1       # cur_size++
.L9:
	mov	eax, DWORD PTR -40[rbp]     # аналогичный цикл, но для второй строки
	movsx	rbx, eax
	mov	rax, QWORD PTR -80[rbp]
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax                    # for (int i = 0; i < strlen(b); i++) {
	jb	.L15
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0           # c[cur_size] = '\0' - завершаем строку
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 72
	pop	rbx
	pop	rbp
	ret


	.size	combination, .-combination
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