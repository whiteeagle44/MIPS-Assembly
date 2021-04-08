#include <stdio.h>
#define BUFFER_SIZE 256

char buf[BUFFER_SIZE] = "abc1234def329";
char* left;
char* right;

int main()
{
    printf("Input: ");
    printf("%s, ", buf);
    right = &buf[0];
    while (*(right + 1) != '\0') {
        right++;
    }
    // right now points to last character
    // printf("%c", *right);

    left = &buf[0]; // left points to first character

    while (left != right) {
        if (*left >= '0' && *left <= '9') {
            if (*right >= '0' && *right <= '9') {
                char temp = *left;
                *left = *right;
                *right = temp;
            }
            right--;
            if (left == right)
                break;
        }
        left++;
    }

    printf("Result: ");
    printf("%s", buf);

    return 0;
}