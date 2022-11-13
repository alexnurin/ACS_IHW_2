#include <stdio.h>
#include <string.h>


extern char *input(FILE *);
extern char *combination(char *a, char *b);

int main(int argc, char *argv[]) {
    char *a = "", *b = "";
    char *output_file = 0;
    if (argc == 3) {
        a = argv[1];
        b = argv[2];
    } else if (argc == 2 && !strcmp("-f", argv[1])) {
        FILE *finputA = fopen("../input.txt", "r");
        FILE *finputB = fopen("../input2.txt", "r");
        if (finputA == NULL || finputB == NULL) {
            finputA = fopen("input.txt", "r");
            finputB = fopen("input2.txt", "r");
            if (finputA == NULL || finputB == NULL) {
                printf("Cannot open file.\n");
                // printf("%d\n", errno);
                return 1;
            }
        }
        output_file = "output.txt";
        a = input(finputA);
        b = input(finputB);
    } else {
        printf("Input first string:\n");
        a = input(stdin);
        printf("Input second string:\n");
        b = input(stdin);
    }
    char *res = combination(a, b);
    if (!output_file) {
        printf("%s", res);
    } else {
        FILE *output = fopen(output_file, "w");
        fprintf(output, "%s", res);
    }
}