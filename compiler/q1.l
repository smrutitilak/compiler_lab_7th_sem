%{
int charcount=0,linecount=0,ifc=0,destc=0,closec=0;
%}
%%
. charcount++;
\n {linecount++; charcount++;}
exit {return 0;}
if* { ifc++; printf("%d if line no\n",linecount); }
dest* {destc++; printf("%d dest line no\n",linecount); }
close* {closec++; printf("%d close line no\n",linecount); }
%%
int main()
{
yylex();
printf("There were %d characters in %d lines\n %d if \n %d dest\n %d  close\n",
charcount,linecount,ifc,destc,closec);
return 0;
}
