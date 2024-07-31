%{
#include <stdio.h>

int charCount = 0;
int wordCount = 0;
int lineCount = 0;
%}

%%

\n               { lineCount++; charCount++; }
[ \t]            { charCount++; }
[^ \t\n]+        { wordCount++; charCount += yyleng; }
.                { charCount++; }

%%

int main() {
    yylex();
    printf("Number of characters: %d\n", charCount);
    printf("Number of words: %d\n", wordCount);
    printf("Number of lines: %d\n", lineCount);
    return 0;
}

int yywrap() {
    return 1;
}
