%{
#include<stdio.h>
#include<string.h>
int yylex(void);
char p='A' - 1;
%}

%union
{
int dval;
char v[100];
}

%token NUM
%token VAR
%token SQRT
%left '+' '-'
%left '*' '/'
%type <dval> S
%type <dval> E
%type <v> VAR
%type <dval> NUM
%type <v> SQRT
%start S
%%
S : 	{}
	|
	S T '\n' {} ;
T : VAR '=' E ';' {printf("\n%s = %c\n",$1,$3);};
E : NUM {$$=yylval.dval;}
    |
    E '+' E {p++;printf("\n%c = %d + %d",p,$1,$3);$$=p;}
    |
    E '-' E {p++;printf("\n%c = %d - %d",p,$1,$3);$$=p;}
    |
    E '*' E {p++;printf("\n%c = %d * %d",p,$1,$3);$$=p;}
    |
    E '/' E {p++;printf("\n%c = %d / %d",p,$1,$3);$$=p;}
    |
    SQRT '(' E ')' {p++;printf("\n%c = SQRT(%d)",p,$3);$$=p;}
    |
    '(' E ')' {$$=p;};
%%
int main()
{
	yyparse();
	return 0;
}
yyerror(char *s)
{
}
yywrap()
{
return 1;
}    
