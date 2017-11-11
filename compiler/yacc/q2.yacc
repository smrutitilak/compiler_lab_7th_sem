%{
#include<stdio.h>
%}

%start list
%left '+' 
%left '*'

%%
list : 
	|
	list expr '\n' {printf("Accepted\n\n");};
expr : expr '+' t {printf("E->E+T\n");}
	|
	t {printf("E->T\n");};
t: t f {printf("T->TF\n");}
   |
   f {printf("T->F\n");};
f: f '*' {printf("F->F*\n");}
   |
   '(' expr ')' {printf("F->(E)\n");}
   |
   'a' {printf("F->a\n");}
   |
   'b' {printf("F->b\n");}
   |
   {printf("F->e\n");}; 
%%

int main()
{
	yyparse();
	return 0;
}

yyerror(char *s) {
}

yywrap()
{
	return 1;
}
