%{
#include<stdio.h>
%}

%%
"//"([a-z]|[0-9]|[A-Z]|" "|"-")*  {}

%%
main()
{
yyin=fopen("input","r");
yylex();
return 0;
}
int yywrap()
{
return 1;
}

