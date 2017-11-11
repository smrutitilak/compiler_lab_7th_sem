%{
#include <string.h>
#include <ctype.h>

int charcount = 0,
    linecount = 1,
    wordcount = 0,
    vowelcount = 0,
    nonvowelcount = 0,
    i = 0;

char word_list[100][100];
%}

letter [a-zA-Z]
vowel [AEIOUaeiou]
comment (\/\*.*)|(\/\/.*)
linecomment \/\/[^\n]*\n
blockcommentstart \/\*
blockcommentend \*\/

%s BLOCK_COMMENT

%%

{blockcommentstart} {ECHO; BEGIN BLOCK_COMMENT;}
<BLOCK_COMMENT>[^\n] {ECHO;}
<BLOCK_COMMENT>{blockcommentend} {BEGIN INITIAL;}

<INITIAL>{vowel}{letter}+ {vowelcount++;
		  wordcount++;
		  charcount+=yyleng;
		  int i = 0;
		  for(i = 0; i < yyleng; i++) 
	  	    printf("%c", toupper(yytext[i]));
	  	    
		 }

<INITIAL>{letter}+ {
	   wordcount++;
	   nonvowelcount++;
	   strcpy(word_list[nonvowelcount-1], yytext);	
	  }
\n {linecount++; charcount++; }
{linecomment} {linecount++; }
%%

int main()
{
  yylex();
  printf("There were %d words and %d words starting with vowels\n",
  	 wordcount, vowelcount);
int i,j;

  return 0;
}


