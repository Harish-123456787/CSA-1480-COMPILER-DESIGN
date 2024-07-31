%{
#include <stdio.h>
#include <string.h>

// Define a regular expression for a valid email address
#define EMAIL_REGEX "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"

%}

%%

[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,} {
    if (strlen(yytext) < 256) {
        printf("Valid email address: %s\n", yytext);
    } else {
        printf("Invalid email address (too long): %s\n", yytext);
    }
}

.|\n { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
