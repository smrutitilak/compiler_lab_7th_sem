%{
#include<stdio.h>
float p,flag,answer;
char cc;
%}
digit [0-9]+
op ["+"|"-"|"*"|"/"]
%%

{op} {
if(strcmp(yytext,"+")==0)
cc='+';
if(strcmp(yytext,"-")==0)
cc='-';
if(strcmp(yytext,"*")==0)
cc='*';
if(strcmp(yytext,"/")==0)
cc='/';
}
{digit} {
p=atof(yytext);
if(flag==0)
{
answer=p;
flag=1;
}
else
{
switch(cc)
{
case '+':answer=answer+p;break;
case '-':answer=answer-p;break;
case '*':answer=answer*p;break;
case '/':answer=answer/p;break;
}
}
}
! {printf("n Final Answer = %f",answer);exit(0);}
%%
int main()
{
flag=0;
answer=0;
printf("n Enter the Question String :- ");
yylex();
return(0);
}
