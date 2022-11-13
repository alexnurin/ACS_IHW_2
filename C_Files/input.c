#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *input(FILE *inputStream) {
    size_t size = 2, cur_size = 0;
    char *str = (char *) malloc((size) * sizeof(char));
    str[0] = '\0';
    while (1) {
        char ch = (char) getc(inputStream);
        if ((ch == '\n' && inputStream == stdin) || ch == EOF)
            break;
        if (cur_size + 1 >= size) {
            size = size * 2;
            str = realloc(str, size * sizeof(char));
        }
        str[cur_size++] = ch;
    }
    str[cur_size] = '\0';
    return str;
}