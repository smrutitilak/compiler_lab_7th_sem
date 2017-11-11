%{ 
	int intcount=0, deccount=0;
%}
letter [a-zA-Z]
digit [0123456789]
space [ \t]
%s INT
%s DEC

%%
<INITIAL>{digit}+ { BEGIN INT; }
<INITIAL>{space}+	{}
<INT>\.	{ BEGIN DEC; }
<INT>\n { intcount+=1; BEGIN INITIAL; }
<INT>{space}+	{ intcount+=1; BEGIN INITIAL; }

<DEC>\n { deccount+=1; BEGIN INITIAL; }
<DEC>{digit}+ { deccount+=1; BEGIN INITIAL; }

exit { return 0; } 
%%
int main() {
	yylex();
	printf("Number of integers : %d\nNumber of decimals : %d\n",intcount, deccount);
	return 0;
}
