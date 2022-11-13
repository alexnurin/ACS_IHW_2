	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:                               # определяем константные строки
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi # принимаем число аргументов из консоли
	                            # argc <=> -68[rbp]
	mov	QWORD PTR -80[rbp], rsi # принимаем аргументы консоли
	                            # argv <=> -80[rbp]

	lea	rax, .LC0[rip]
	mov	QWORD PTR -8[rbp], rax  # char* a = rax = ""
	                            # a <=> -8[rbp]
	lea	rax, .LC0[rip]
	mov	QWORD PTR -16[rbp], rax # char* b = rax = ""
	                            # b <=> -16[rbp]
	mov	QWORD PTR -24[rbp], 0   # char* output_file = 0
	                            # output_file <=> -24[rbp]

	cmp	DWORD PTR -68[rbp], 3   # if (argc == 3)
	jne	.L2

	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax  # a = argv[1]

	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -16[rbp], rax # b = argv[2]
	jmp	.L3
.L2:
	cmp	DWORD PTR -68[rbp], 2   # if (argc == 2) && ..
	jne	.L4
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8                  # char это 8 бит
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC1[rip]          # "-f"
	call	strcmp@PLT          # вызов strcmp("-f", argv[1])
	test	eax, eax
	jne	.L4                     # .. && !strcmp("-f", argv[1])

	lea	rsi, .LC2[rip]          # начинаем поиск файлов ввода
	lea	rdi, .LC3[rip]
	call	fopen@PLT           # fopen("../input.txt", "r");
	mov	QWORD PTR -32[rbp], rax # FILE* finputA = _

	lea	rsi, .LC2[rip]
	lea	rdi, .LC4[rip]
	call	fopen@PLT           # fopen("../input.txt", "r");
	mov	QWORD PTR -40[rbp], rax # FILE* finputB = _

	cmp	QWORD PTR -32[rbp], 0   # если не нашли файл - попробуем на уровень ниже (рядом с exe-шником)
	je	.L5
	cmp	QWORD PTR -40[rbp], 0   #
	jne	.L6
.L5:
	lea	rsi, .LC2[rip]          # ищем аналогично L2 но путь к файлу
	lea	rdi, .LC5[rip]          # теперь на уровень ниже
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rsi, .LC2[rip]
	lea	rdi, .LC6[rip]
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -32[rbp], 0   # если так и не смогли открыть файл
	je	.L7
	cmp	QWORD PTR -40[rbp], 0
	jne	.L6
.L7:
	lea	rdi, .LC7[rip]          # "Cannot open file."
	call	puts@PLT            # вызов printf(_)
	mov	eax, 1
	jmp	.L8                     # завершаем работу с кодом 1
.L6:
	lea	rax, .LC8[rip]
	mov	QWORD PTR -24[rbp], rax # output_file = "output.txt";

	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -8[rbp], rax  # a = input(finputA)

	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	input@PLT
	mov	QWORD PTR -16[rbp], rax # b = input(finputB)

	jmp	.L3
.L4:
	lea	rdi, .LC9[rip]              # запускаем ручной ввод
	call	puts@PLT                # выводим сообщение "Input first string:"
	mov	rdi, QWORD PTR stdin[rip]
	call	input@PLT
	mov	QWORD PTR -8[rbp], rax      # a = input(stdin)
	lea	rdi, .LC10[rip]
	call	puts@PLT                # выводим сообщение "Input second string:"
	mov	rdi, QWORD PTR stdin[rip]
	call	input@PLT
	mov	QWORD PTR -16[rbp], rax     # b = input(stdin)
.L3:
	mov	rsi, QWORD PTR -16[rbp]
	mov	rdi, QWORD PTR -8[rbp]
	call	combination@PLT
	mov	QWORD PTR -48[rbp], rax     # char *res = combination(a, b);
	                                # res <=> -48[rbp]
	cmp	QWORD PTR -24[rbp], 0       # if (!output_file)
	jne	.L9
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT              # printf("%s", res);
	jmp	.L10
.L9:
	lea	rsi, .LC12[rip]
	mov	rdi, QWORD PTR -24[rbp]
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax     # FILE *output = fopen(output_file, "w")
	                                # output <=> -56[rbp]
	mov	rsi, QWORD PTR -56[rbp]
	mov	rdi, QWORD PTR -48[rbp]
	call	fputs@PLT               # fprintf(output, "%s", res);
.L10:
	mov	eax, 0
.L8:
	leave
	ret
