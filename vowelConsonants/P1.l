%{
int vowelCount=0;
int consCount=0;
%}
%%
[aeiouAEIOU] {vowelCount++;}
[a-zA-Z] {consCount++;}
%%
int main()
{
printf("Enter the string: ");
yylex();
printf("Vowel Count: %d\n",vowelCount);
printf("Consonant Count: %d\n",consCount);
return 0;
}
int yywrap()
{
return 1;
}