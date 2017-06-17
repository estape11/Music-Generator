%option noyywrap
%option yylineno

%{
	#include "y.tab.h"
	#include<stdio.h>	
%}

NUMERO [0-9]+
NOMBRE  [a-zA-Z]*
VARIABLE [A-Z][a-zA-Z0-9]*


%%
"Ejecute"											{return EJECUTE;}
"SET"												{return SET;}
"DEF"												{return DEF;}
"CNota"												{return C_NOTA;}
"DNota"												{return D_NOTA;}
"ENota"												{return E_NOTA;}
"FNota"												{return F_NOTA;}
"GNota"												{return G_NOTA;}
"ANota"												{return A_NOTA;}
"BNota"												{return B_NOTA;}

"C#"												{return C_SOSTENIDO;}
"D#"												{return D_SOSTENIDO;}
"E#"												{return E_SOSTENIDO;}
"F#"												{return F_SOSTENIDO;}
"G#"												{return G_SOSTENIDO;}
"A#"												{return A_SOSTENIDO;}
"B#"												{return B_SOSTENIDO;}

"C^"												{return C_MAYOR ;}
"D^"												{return D_MAYOR ;}
"E^"												{return E_MAYOR ;}
"F^"												{return F_MAYOR ;}
"G^"												{return G_MAYOR ;}
"A^"												{return A_MAYOR ;}
"B^"												{return B_MAYOR ;}

"Cm"												{return C_MENOR ;}
"Dm"												{return D_MENOR ;}
"Em"												{return E_MENOR ;}
"Fm"												{return F_MENOR ;}
"Gm"												{return G_MENOR ;}
"Am"												{return A_MENOR ;}
"Bm"												{return B_MENOR ;}

"C#^"												{return C_SOSTENIDO_MAYOR ;}
"D#^"												{return D_SOSTENIDO_MAYOR ;}
"E#^"												{return E_SOSTENIDO_MAYOR ;}
"F#^"												{return F_SOSTENIDO_MAYOR ;}
"G#^"												{return G_SOSTENIDO_MAYOR ;}
"A#^"												{return A_SOSTENIDO_MAYOR ;}
"B#^"												{return B_SOSTENIDO_MAYOR ;}

"C#m"												{return C_SOSTENIDO_MENOR ;}
"D#m"												{return D_SOSTENIDO_MENOR ;}
"E#m"												{return E_SOSTENIDO_MENOR ;}
"F#m"												{return F_SOSTENIDO_MENOR ;}
"G#m"												{return G_SOSTENIDO_MENOR ;}
"A#m"												{return A_SOSTENIDO_MENOR ;}
"B#m"												{return B_SOSTENIDO_MENOR ;}

"Neg;"												{return NEGRA;}
"Blak;"												{return BLANCA;}
"Corch;"											{return CORCHEA;}
"Scorch;"											{return SEMICORCHEA;}

"IniComp"											{return INICIAR_COMPAS;}
"FinComp"											{return FINALIZAR_COMPAS;}
"IniMusica"											{return INICIAR_MUSICA;}
"FinMusica"											{return FINALIZAR_MUSICA;}

"Principal"											{return F_PRINCIPAL;}
"Inicio"											{return COMENZAR;}
"Final"												{return FINALIZAR_PROCEDIMIENTO;}

"Loop"												{return LOOP;}
"InitLoop"											{return INI_LOOP;}
"FinLoop"											{return FIN_LOOP;}

"Contrario"											{return CONTRARIO;}
"EnCaso"											{return CONDICION;}
"FinEnCaso"											{return FIN_CONDICION;}						
"Entonces"											{return ENTONCES;}


{VARIABLE}											{return VARIABLE;}
{NUMERO}											{return NUMERO;}
{NOMBRE}											{return NOMBRE;}



","													{return COMA;}
"("													{return PARENTESIS_A;}
")"													{return PARENTESIS_C;}
";"													{return PUNTO_COMA;}
\n													{ }
\t													{ }
"/*"												{return COMENTARIO_I;}
"*/"												{return COMENTARIO_F;}
" "													{ }
"="													{return IGUAL;}
"--"												{return DECREMENTO;}
"<"													{return MENOR;}
">"													{return MAYOR;}
"!="												{return DISTINTO;}
"++"												{return INCREMENTO;}

.                              						{printf("Error lexico en linea %d\n",yylineno);}
%%



