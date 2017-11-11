%{
#include <stdio.h>
int flag = 0;
%}
%token NUMBER
%%
Start: e{ printf("\nParsed\n"); return 0; }
e:e'+'t { printf("E -> E + T\n"); }
 |t     { printf("E -> T\n"); }
;

t:t f { printf("T -> TF\n"); }
 |f   { printf("T -> F\n"); }
;

f:f'*'    { printf("F -> F*\n"); }
 |'('e')' { printf("F -> (E)\n"); }
 |'a'     { printf("F -> a\n"); }
 |'b'     { printf("F -> b\n"); }
 |        { printf("F -> epsilon\n"); }
;

%%

void main()
{
	printf("\nEnter An Expression:\n");
	yyparse();
	if(flag == 0)
		printf("\nValid Expression\n");
}

void yyerror()
{
	printf("Invalid Expression\n");
	flag = 1;
}

