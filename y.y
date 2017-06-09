%{
	#include<stdio.h>
	extern int yylineno; 
%}

/*NOTAS MUSICALES*/

%token C_NOTA     /*Do */
%token D_NOTA	/*Re*/
%token E_NOTA	/*Mi*/
%token F_NOTA	/*Fa*/
%token G_NOTA	/*Sol*/
%token A_NOTA	/*La*/
%token B_NOTA	/*Si*/

%token C_SOSTENIDO    /*Do */
%token D_SOSTENIDO 	/*Re*/
%token E_SOSTENIDO 	/*Mi*/
%token F_SOSTENIDO 	/*Fa*/
%token G_SOSTENIDO 	/*Sol*/
%token A_SOSTENIDO 	/*La*/
%token B_SOSTENIDO 	/*Si*/

%token C_MAYOR    /*Do */
%token D_MAYOR 	/*Re*/
%token E_MAYOR 	/*Mi*/
%token F_MAYOR 	/*Fa*/
%token G_MAYOR 	/*Sol*/
%token A_MAYOR 	/*La*/
%token B_MAYOR 	/*Si*/

%token C_SOSTENIDO_MAYOR    /*Do */
%token D_SOSTENIDO_MAYOR  	/*Re*/
%token E_SOSTENIDO_MAYOR  	/*Mi*/
%token F_SOSTENIDO_MAYOR  	/*Fa*/
%token G_SOSTENIDO_MAYOR 	/*Sol*/
%token A_SOSTENIDO_MAYOR  	/*La*/
%token B_SOSTENIDO_MAYOR  	/*Si*/

%token C_MENOR    /*Do */
%token D_MENOR 	/*Re*/
%token E_MENOR 	/*Mi*/
%token F_MENOR 	/*Fa*/
%token G_MENOR 	/*Sol*/
%token A_MENOR 	/*La*/
%token B_MENOR 	/*Si*/

%token C_SOSTENIDO_MENOR    /*Do */
%token D_SOSTENIDO_MENOR 	/*Re*/
%token E_SOSTENIDO_MENOR  	/*Mi*/
%token F_SOSTENIDO_MENOR  	/*Fa*/
%token G_SOSTENIDO_MENOR  	/*Sol*/
%token A_SOSTENIDO_MENOR  	/*La*/
%token B_SOSTENIDO_MENOR  	/*Si*/

%token NEGRA
%token BLANCA
%token CORCHEA
%token SEMICORCHEA

%token INICIAR_COMPAS
%token FINALIZAR_COMPAS
%token INICIAR_MUSICA
%token FINALIZAR_MUSICA

%token VARIABLE

%token F_PRINCIPAL
%token N_VARIABLE
%token NUMERO
%token COMENTARIO_I
%token COMENTARIO_F
%token NOMBRE
%token PUNTO_COMA
%token COMENZAR
%token FINALIZAR_PROCEDIMIENTO
%token PARENTESIS_A
%token PARENTESIS_C

%token SET
%token DEF
%token IGUAL
%token DECREMENTO
%token INCREMENTO

%start PRINCIPIO



%% 

	PRINCIPIO: INICIAR_MUSICA PUNTO_COMA PROCEDIMIENTO FUNCION_PRINCIPAL FINALIZAR_MUSICA PUNTO_COMA;
	PROCEDIMIENTO: NOMBRE PARENTESIS_A PARENTESIS_C COMENZAR EXPRESION FINALIZAR_PROCEDIMIENTO PUNTO_COMA | PROCEDIMIENTO PROCEDIMIENTO;				
	FUNCION_PRINCIPAL: F_PRINCIPAL PARENTESIS_A PARENTESIS_C COMENZAR PROCEDIMIENTO FINALIZAR_PROCEDIMIENTO PUNTO_COMA;
	EXPRESION: PROCEDIMIENTO | VAR | COMEN | EXPRESION EXPRESION;
	COMEN: COMENTARIO_I PALABRAS COMENTARIO_F;
	PALABRAS: PALABRAS PALABRAS | NOMBRE | NUMERO;
	VAR: SET VARIABLE IGUAL VARIABLE PUNTO_COMA | VARIABLE ASIGNACION PUNTO_COMA | DEF VARIABLE IGUAL VARIABLE PUNTO_COMA | DEF VARIABLE PUNTO_COMA;
	ASIGNACION: DECREMENTO | INCREMENTO;
	
%%

main(){
	if(yyparse()==0)
	printf("\nAnalisis Sintactico concluido sin errores\n");
}
yyerror(char* mensaje){
	printf("Error sintactico %s",mensaje);
	printf(" en linea %d\n",yylineno-1);
}