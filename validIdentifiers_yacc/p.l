%{
#include "p.tab.h"
%}

%option noyywrap
%%
[a-z]+ {return L;}
[0-9]+ {return D;}
[ |\t|\n]+ {;}
. {return yytext[0];}
%%