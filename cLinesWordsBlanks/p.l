%{
int words=0;
int lines=0;
int spaces=0;
int characters=0;
%}
%%
[^ \n\t,\.:;]+ {words++; characters+=yyleng;}
[\n] {lines++; characters+=yyleng;}
[ |\t] {spaces++; characters+=yyleng;}
. {characters++;}
%%
int main(){
 yyin=fopen("text.txt", "r");
 yylex();
 printf("number of words: %d\n", words);
 printf("number of lines: %d\n", lines+1);
 printf("number of spaces: %d\n", spaces);
 printf("number of characters: %d\n", characters);
}

int yywrap(){
 return 1;
}