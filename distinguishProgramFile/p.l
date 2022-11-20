%{
int integers=0;
int floats=0;
int identifiers=0;
int operators=0;
int comments=0;
%}
%%
[#].* { printf("%s<- preprocessor directive\n", yytext);}
[ |\n|\t] {;}
[,|;|"("|")"|"{"|"}"|"\["|"\]"] {;}
"//".* {comments++; printf("%s<- comment\n", yytext);}
[0-9]+ {integers++; printf("%s <- Integer\n", yytext);}
[0-9]+("."[0-9]+) {floats++; printf("%s <- Float\n", yytext);}
void|int|main|char|for|while|continue|switch|case|break|if|else|return|true|false {printf("%s <- keywords\n", yytext);}
"<="|">="|"!="|"=="|">"|"<"|"&"|"|"|"^"|"<<"|">>"|"~"|"&&"|"||"|"!"|"++"|"--"|"="|"+"|"-"|"*"|"/"|"%" {operators++; printf("%s <- operators\n", yytext);}
[']([^\\\']|\\.)?['] {;}
["]([^\\\"]|\\.)*["] {;}
[a-zA-Z_]+[a-zA-Z0-9_]* {identifiers++; printf("%s <- identifiers\n", yytext);}
%%
int main(){
 yyin = fopen("text.c", "r");
 yylex();
 printf("\n");
 printf("Nos of integers: %d\n", integers);
 printf("Nos of floats: %d\n", floats);
 printf("Nos of identifiers: %d\n", identifiers);
 printf("Nos of operators: %d\n", operators);
 printf("Nos of comments: %d\n", comments);
}

int yywrap(){
 return 1;
}