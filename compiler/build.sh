#! /bin/bash

lex 5.l
yacc -d 5.y
gcc lex.yy.c y.tab.c -o calc



