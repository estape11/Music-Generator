# Music-Generator
Bison/Flex Compiler for musician language. 

CMD / Terminal

flex lex.l
yacc -d y.y --warning=none
gcc y.tab.c lex.yy.c -o a -W
.\a.exe < test.txt
