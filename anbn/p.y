%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
void yyerror(char*);
%}
%token A B
%%
S:E'\n' {printf("Valid String\n"); exit(0);}
;
E:A E B
| A B
;
%%
int main(){
yyparse();
return 0;
}

void yyerror(char *msg){
fprintf(stderr, "Invalid String\n");
exit(1);
}