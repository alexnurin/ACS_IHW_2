	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 9.3.0-10ubuntu2) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu ./main.c -masm=intel
# -mtune=generic -march=x86-64 -auxbase-strip ./main.s
# -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector
# -fno-exceptions -fverbose-asm -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fauto-inc-dec -fcommon -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm -fgnu-runtime
# -fgnu-unique -fident -finline-atomics -fipa-stack-alignment
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
# -fplt -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstack-clash-protection
# -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 80	#,
	mov	DWORD PTR -68[rbp], edi	# argc, argc
	mov	QWORD PTR -80[rbp], rsi	# argv, argv
# ./main.c:9:     char *a = "", *b = "";
	lea	rax, .LC0[rip]	# tmp89,
	mov	QWORD PTR -8[rbp], rax	# a, tmp89
# ./main.c:9:     char *a = "", *b = "";
	lea	rax, .LC0[rip]	# tmp90,
	mov	QWORD PTR -16[rbp], rax	# b, tmp90
# ./main.c:10:     char *output_file = 0;
	mov	QWORD PTR -24[rbp], 0	# output_file,
# ./main.c:11:     if (argc == 3) {
	cmp	DWORD PTR -68[rbp], 3	# argc,
	jne	.L2	#,
# ./main.c:12:         a = argv[1];
	mov	rax, QWORD PTR -80[rbp]	# tmp91, argv
	mov	rax, QWORD PTR 8[rax]	# tmp92, MEM[(char * *)argv_20(D) + 8B]
	mov	QWORD PTR -8[rbp], rax	# a, tmp92
# ./main.c:13:         b = argv[2];
	mov	rax, QWORD PTR -80[rbp]	# tmp93, argv
	mov	rax, QWORD PTR 16[rax]	# tmp94, MEM[(char * *)argv_20(D) + 16B]
	mov	QWORD PTR -16[rbp], rax	# b, tmp94
	jmp	.L3	#
.L2:
# ./main.c:14:     } else if (argc == 2 && !strcmp("-f", argv[1])) {
	cmp	DWORD PTR -68[rbp], 2	# argc,
	jne	.L4	#,
# ./main.c:14:     } else if (argc == 2 && !strcmp("-f", argv[1])) {
	mov	rax, QWORD PTR -80[rbp]	# tmp95, argv
	add	rax, 8	# _1,
# ./main.c:14:     } else if (argc == 2 && !strcmp("-f", argv[1])) {
	mov	rax, QWORD PTR [rax]	# _2, *_1
	mov	rsi, rax	#, _2
	lea	rdi, .LC1[rip]	#,
	call	strcmp@PLT	#
# ./main.c:14:     } else if (argc == 2 && !strcmp("-f", argv[1])) {
	test	eax, eax	# _3
	jne	.L4	#,
# ./main.c:15:         FILE *finputA = fopen("../input.txt", "r");
	lea	rsi, .LC2[rip]	#,
	lea	rdi, .LC3[rip]	#,
	call	fopen@PLT	#
	mov	QWORD PTR -32[rbp], rax	# finputA, tmp96
# ./main.c:16:         FILE *finputB = fopen("../input2.txt", "r");
	lea	rsi, .LC2[rip]	#,
	lea	rdi, .LC4[rip]	#,
	call	fopen@PLT	#
	mov	QWORD PTR -40[rbp], rax	# finputB, tmp97
# ./main.c:17:         if (finputA == NULL || finputB == NULL) {
	cmp	QWORD PTR -32[rbp], 0	# finputA,
	je	.L5	#,
# ./main.c:17:         if (finputA == NULL || finputB == NULL) {
	cmp	QWORD PTR -40[rbp], 0	# finputB,
	jne	.L6	#,
.L5:
# ./main.c:18:             finputA = fopen("input.txt", "r");
	lea	rsi, .LC2[rip]	#,
	lea	rdi, .LC5[rip]	#,
	call	fopen@PLT	#
	mov	QWORD PTR -32[rbp], rax	# finputA, tmp98
# ./main.c:19:             finputB = fopen("input2.txt", "r");
	lea	rsi, .LC2[rip]	#,
	lea	rdi, .LC6[rip]	#,
	call	fopen@PLT	#
	mov	QWORD PTR -40[rbp], rax	# finputB, tmp99
# ./main.c:20:             if (finputA == NULL || finputB == NULL) {
	cmp	QWORD PTR -32[rbp], 0	# finputA,
	je	.L7	#,
# ./main.c:20:             if (finputA == NULL || finputB == NULL) {
	cmp	QWORD PTR -40[rbp], 0	# finputB,
	jne	.L6	#,
.L7:
# ./main.c:21:                 printf("Cannot open file.\n");
	lea	rdi, .LC7[rip]	#,
	call	puts@PLT	#
# ./main.c:23:                 return 1;
	mov	eax, 1	# _11,
	jmp	.L8	#
.L6:
# ./main.c:26:         output_file = "output.txt";
	lea	rax, .LC8[rip]	# tmp100,
	mov	QWORD PTR -24[rbp], rax	# output_file, tmp100
# ./main.c:27:         a = input(finputA);
	mov	rax, QWORD PTR -32[rbp]	# tmp101, finputA
	mov	rdi, rax	#, tmp101
	call	input@PLT	#
	mov	QWORD PTR -8[rbp], rax	# a, tmp102
# ./main.c:28:         b = input(finputB);
	mov	rax, QWORD PTR -40[rbp]	# tmp103, finputB
	mov	rdi, rax	#, tmp103
	call	input@PLT	#
	mov	QWORD PTR -16[rbp], rax	# b, tmp104
# ./main.c:14:     } else if (argc == 2 && !strcmp("-f", argv[1])) {
	jmp	.L3	#
.L4:
# ./main.c:30:         printf("Input first string:\n");
	lea	rdi, .LC9[rip]	#,
	call	puts@PLT	#
# ./main.c:31:         a = input(stdin);
	mov	rax, QWORD PTR stdin[rip]	# stdin.0_4, stdin
	mov	rdi, rax	#, stdin.0_4
	call	input@PLT	#
	mov	QWORD PTR -8[rbp], rax	# a, tmp105
# ./main.c:32:         printf("Input second string:\n");
	lea	rdi, .LC10[rip]	#,
	call	puts@PLT	#
# ./main.c:33:         b = input(stdin);
	mov	rax, QWORD PTR stdin[rip]	# stdin.1_5, stdin
	mov	rdi, rax	#, stdin.1_5
	call	input@PLT	#
	mov	QWORD PTR -16[rbp], rax	# b, tmp106
.L3:
# ./main.c:35:     char *res = combination(a, b);
	mov	rdx, QWORD PTR -16[rbp]	# tmp107, b
	mov	rax, QWORD PTR -8[rbp]	# tmp108, a
	mov	rsi, rdx	#, tmp107
	mov	rdi, rax	#, tmp108
	call	combination@PLT	#
	mov	QWORD PTR -48[rbp], rax	# res, tmp109
# ./main.c:36:     if (!output_file) {
	cmp	QWORD PTR -24[rbp], 0	# output_file,
	jne	.L9	#,
# ./main.c:37:         printf("%s", res);
	mov	rax, QWORD PTR -48[rbp]	# tmp110, res
	mov	rsi, rax	#, tmp110
	lea	rdi, .LC11[rip]	#,
	mov	eax, 0	#,
	call	printf@PLT	#
	jmp	.L10	#
.L9:
# ./main.c:39:         FILE *output = fopen(output_file, "w");
	mov	rax, QWORD PTR -24[rbp]	# tmp111, output_file
	lea	rsi, .LC12[rip]	#,
	mov	rdi, rax	#, tmp111
	call	fopen@PLT	#
	mov	QWORD PTR -56[rbp], rax	# output, tmp112
# ./main.c:40:         fprintf(output, "%s", res);
	mov	rdx, QWORD PTR -56[rbp]	# tmp113, output
	mov	rax, QWORD PTR -48[rbp]	# tmp114, res
	mov	rsi, rdx	#, tmp113
	mov	rdi, rax	#, tmp114
	call	fputs@PLT	#
.L10:
	mov	eax, 0	# _11,
.L8:
# ./main.c:42: }
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
