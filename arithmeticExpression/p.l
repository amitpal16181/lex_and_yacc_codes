%{
#include<stdio.h>
int brackets=0;
int operators=0;
int identifiers=0;
int flag=0;
%}
%%
[a-zA-Z_]+[a-zA-Z0-9_]* {identifiers++;}
-?[0-9]+("."[0-9]+)? {identifiers++;}
[+|\-|/|*|%|=|\^] {operators++;}
"(" {brackets++;}
")" {brackets--;}
";" {flag=1;}
.|\n {;}
%%
int main(){
 printf("Enter Arithmetic expresson: ");
 yylex();
 if((operators+1)==identifiers && brackets==0 && flag==0) {
  printf("Valid Expression");
}
else{
   printf("Invalid Expression");
}
return 0;
}

int yywrap(){
  return 1;
}