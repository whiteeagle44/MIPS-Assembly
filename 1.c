#include <stdio.h>
#define BUFFER_SIZE 256

char input[BUFFER_SIZE] = "THIS 123 984 STRING";

int main()
{
    for (int i = 0; i < BUFFER_SIZE; i++) {
        char current = input[i];
        if (current >= '0' && current <= '9') {
            current = (char)'9' - current + '0';
            // printf("Current: %c \n", current);
        }

        if (current == '\0')
            break;
    }

    printf("Conversion results  > %s", input);

    return 0;
}