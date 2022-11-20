%{
int key = 0;
%}
%%
[A-Z] {fprintf(yyout, "%c", (yytext[0] - 'A' + key) % 26 + 'A');}
[a-z] {fprintf(yyout, "%c", (yytext[0] - 'a' + key) % 26 + 'a');}
. {fprintf(yyout, "%s", yytext);}
%%
int main(){
printf("Enter key: ");
scanf("%d", &key);
yyin = fopen("input.txt", "r");
yyout = fopen("output.txt", "w");
yylex();
fclose(yyin);
fclose(yyout);
return 0;
}

int yywrap(){
return 1;
}