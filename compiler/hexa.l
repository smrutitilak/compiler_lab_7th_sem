d [0123456789]

%%
{d}* {
		int temp;
		sscanf( yytext, "%d", &temp);
		printf("0x%04X\n %d",temp);
	}
\n	{ }
exit	{ return 0; }
%%
