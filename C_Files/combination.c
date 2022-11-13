#include <stdlib.h>
#include <string.h>

char *combination(char *a, char *b) {
    size_t size = strlen(a) + strlen(b) + 1, cur_size = 0;
    char *c = (char *) malloc((size) * sizeof(char));

    for (int i = 0; i < strlen(a); i++) {
        int found = 0;
        for (int j = 0; j < strlen(c); j++) {
            if (c[j] == a[i]) {
                found = 1;
                break;
            }
        }
        if (!found) {
            c[cur_size++] = a[i];
        }
    }
    for (int i = 0; i < strlen(b); i++) {
        int found = 0;
        for (int j = 0; j < cur_size; j++) {
            if (c[j] == b[i]) {
                found = 1;
                break;
            }
        }
        if (!found) {
            c[cur_size++] = b[i];
        }
    }
    c[cur_size] = '\0';
    return c;
}
