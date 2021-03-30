#include <stdio.h>
#define BUFFER_SIZE 256

char buf[BUFFER_SIZE] = "THIS 123 984 STRING";
int main()
{
    for (int i = 0; i < BUFFER_SIZE; i++) {
        if (buf[i] >= '0' && buf[i] <= '9') {
            buf[i] = (char)'9' - buf[i] + '0';
        }

        if (buf[i] == '\0')
            break;
    }

    printf("Conversion results  > %s", buf);

    return 0;
}