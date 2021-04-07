#include <stdbool.h>
#include <stdio.h>
#define BUFFER_SIZE 256

char buf[BUFFER_SIZE] = "123jska1c10000b3";
int maxSize = 0;
int currentSize = 0;
int start;
int end;

int main()
{
    bool prevWasLetter = false;
    for (int i = 0; i < BUFFER_SIZE; i++) {
        if (buf[i] >= '0' && buf[i] <= '9') {
            currentSize++;
        } else {
            if (currentSize > maxSize) {
                maxSize = currentSize;
                end = i;
                start = i - currentSize;
            }
            currentSize = 0;
        }

        if (buf[i] == '\0')
            break;
    }

    for (int i = start; i < end; i++) {
        printf("%c", buf[i]);
    }

    return 0;
}