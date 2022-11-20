%{
#include<stdio.h>
#include<stdlib.h>
extern int yylex();
void yyerror(char*);
%}
%token D L
%%
S : L D {printf("Valid Identifier\n");}
 ;
%%
int main(){
 yyparse();
return 0;
}

void yyerror(char *msg){
fprintf(stderr, "Invalid Identifier");
exit(1);
}