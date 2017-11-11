%{
#include<stdio.h>
%}

%token DIGIT

%start list

%%

list : |
	list s '\n' {printf("Accepted\n");};
s : n '.' r {printf("S->N.R\n");};
n : n d {printf("N->ND\n");} 
	|
	d {printf("N->D\n");};
r : d r {printf("R->DR\n");}
	|
	d {printf("R->D\n");};
d : DIGIT {printf("D->%d\n",$1);};

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
