%{
int identifiers=0;
%}
%%
[#].* {;}
"//".* {;}
[ |\n|\t] {;}
[,|;|"("|")"|"{"|"}"|"\["|"\]"] {;}
[0-9]+("."[0-9]+)? {;}
void|main|char|int|float|while|do|for|if|else|switch|break|default|continue|goto|double|return|true|false {;}
"<"|">"|"="|"!"|"<="|">="|"=="|"!="|"+"|"-"|"*"|"/"|"%"|"++"|"--"|"&"|"|"|"&&"|"||"|"^" {;}
[']([^\\\']|\\.)?['] {;}
["]([^\\\"]|\\.)*["] {;}
[a-zA-Z_]+[a-zA-Z0-9_]* { identifiers++; printf("%s <- identifier\n", yytext);}
%%
int main(){
 yyin = fopen("text.c", "r");
 yylex();
 printf("\nNumber of identifiers: %d\n", identifiers);
return 0;
}

int yywrap(){
 return 1;
}