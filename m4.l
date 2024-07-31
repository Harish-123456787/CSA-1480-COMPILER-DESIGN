%{
#include <stdio.h>
%}

%%

[a-zA-Z]      { if (!strchr("aeiouAEIOU", yytext[0])) printf("%s", yytext); }
.|\n          { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
