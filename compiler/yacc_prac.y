%{
#include <stdio.h>
int flag = 0;
%}
%token NUMBER
%%
Start: s{ printf("\nParsed\n"); return 0; }
s:n'.'r { printf("S -> N.R\n"); }
 
;

n:n d { printf("N->ND\n"); }
 |d   { printf("N -> D\n"); }
;

r:d r     { printf("R -> DR\n"); }
 |d { printf("R -> D\n"); }
;


d:0     { printf("D -> 0\n"); }
 |1 { printf("D -> 1\n"); }
 |2 { printf("D -> 2\n"); }
 |3 { printf("D -> 3\n"); }
 |4 { printf("D -> 4\n"); }
 |5 { printf("D -> 5\n"); }
 |6 { printf("D -> 6\n"); }
 |7 { printf("D -> 7\n"); }
 |8 { printf("D -> 8\n"); }
 |9 { printf("D -> 9\n"); }
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

