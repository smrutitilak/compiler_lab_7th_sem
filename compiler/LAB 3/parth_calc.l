%{
#include <stdio.h>
#include <math.h>
#include <string.h>

char tokens[1000][20];
int top=0;
int l;
%}

%%
[0-9]+(\.[0-9]+)? { strcpy(tokens[top++], yytext); }
[\+\-\*\/^] { strcpy(tokens[top++], yytext); }
[()] { strcpy(tokens[top++], yytext); }
\n { return; }
[ \t]  { }
(sqrt|log10|log) { strcpy(tokens[top++], yytext); }
. { printf("invalid input.\n"); return; }

%%

/*
Grammar:

Fac => number | (Exp) | sqrt(Exp) | log(Exp) | log10(Exp)
Expo => Fac^Expo | Fac
Term => Term*Expo | Term/Expo | Expo
Exp => Exp+Elem | Exp-Elem | Term
*/

float Exp();

float Fac() {
    float tmp;
    if(tokens[l][0] == '(') {
        l++;
        tmp = Exp();
	if (tokens[l][0] != ')') {
	    printf("Bad input");
	    exit(0);
	} else l++;
	
    } else if(strcmp(tokens[l], "sqrt") == 0 && tokens[l+1][0] == '(') {
        l+=2;
	tmp = Exp();
	if (tokens[l][0] != ')') {
	    printf("Bad input");
	    exit(0);
	} else l++;
	tmp = sqrt(tmp);
    } else if(strcmp(tokens[l], "log") == 0 && tokens[l+1][0] == '(') {
        l+=2;
	tmp = Exp();
	if (tokens[l][0] != ')') {
	    printf("Bad input");
	    exit(0);
	} else l++;
	tmp = log(tmp);
    
    } else if(strcmp(tokens[l], "log10") == 0 && tokens[l+1][0] == '(') {
        l+=2;
	tmp = Exp();
	if (tokens[l][0] != ')') {
	    printf("Bad input");
	    exit(0);
	} else l++;
	tmp = log10(tmp);
    } else {
        sscanf(tokens[l], "%f", &tmp);
	l++;
    }
    return tmp;
}

float Expo() {
    float tmp = Fac();
    if (tokens[l][0] != '^') {
        printf("Bad input");
	return 0;
    }
    return pow(tmp, Expo());
}

float Term() {
    float tmp = Expo();
    while(tokens[l][0] == '*' || tokens[l][0] == '/') {
        float tmpB;
        if(tokens[l][0] == '*') {
            l++;
            tmpB = Expo();
	    tmp = tmp * tmpB;
	}
        else if(tokens[l][0] == '/') {
            l++;
            tmpB = Expo();
	    tmp = tmp / tmpB;
	}
    }
    return tmp;
}

float Exp() {
    float tmp = Term();
    while(tokens[l][0] == '+' || tokens[l][0] == '-') {
        float tmpB;
        if(tokens[l][0] == '+') {
            l++;
            tmpB = Term();
	    tmp = tmp + tmpB;
	}
        else if(tokens[l][0] == '-') {
            l++;
            tmpB = Term();
	    tmp = tmp - tmpB;
	}
    }
    return tmp;
}


int main() {
    printf("> ");
    yylex();
    printf("%f\n", Exp());
    return 0;
}

