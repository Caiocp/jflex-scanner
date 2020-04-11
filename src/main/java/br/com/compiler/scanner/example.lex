package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String tipo) {
 System.out.println(lexema + " - " + tipo);
}
%}
%int
%line
%column

BRANCO = [\n| |\t|\r]
SOMA = [+]
SUB = [-]
MULT = [*]
DIV = [/]
EXP = [*]{2}
NUMERO = [\d]+
PDIR = [(]
PESQ = [)]

%%

{BRANCO} {/*Ignore*/}
{NUMERO} {print_value(yytext(), "N�mero");}
{SOMA} {print_value(yytext(), "Soma");}
{SUB} {print_value(yytext(), "Subtra��o");}
{EXP} {print_value(yytext(), "Exponencia��o");}
{MULT} {print_value(yytext(), "Multiplica��o");}
{DIV} {print_value(yytext(), "Divis�o");}
{PDIR} {print_value(yytext(), "Pontua��o");}
{PESQ} {print_value(yytext(), "Pontua��o");}
. { throw new RuntimeException("Lexemas inv�lidos " + yytext()); }
