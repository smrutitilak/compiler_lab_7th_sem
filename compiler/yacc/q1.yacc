%{
#include<stdio.h>
%}

%start list

%token DIGIT

%left '+' '-' 
%left '*' '/' '%'

%%

list : 
	|
	list expr'\n' {printf("%d\n",$2);};


expr:    '(' expr ')'
         {
           $$ = $2;
         }
         |
         expr '*' expr
         {
           $$ = $1 * $3;
         }
         |
         expr '/' expr
         {
           $$ = $1 / $3;
         }
         |
         expr '%' expr
         {
           $$ = $1 % $3;
         }
         |
         expr '+' expr
         {
           $$ = $1 + $3;
         }
          |

         expr '-' expr
         {
           $$ = $1 - $3;
         }
         |
         DIGIT 
         {
         	$$=$1;
         }

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
  return(1);
}
