package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String tipo, String valor) {
 System.out.println(lexema + " | " + tipo + " | " + valor);
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
{NUMERO} {print_value(yytext(), "N�mero", yytext());}
{SOMA} {print_value(yytext(), "Soma", yytext());}
{SUB} {print_value(yytext(), "Subtra��o", yytext());}
{EXP} {print_value(yytext(), "Exponencia��o", yytext());}
{MULT} {print_value(yytext(), "Multiplica��o", yytext());}
{DIV} {print_value(yytext(), "Divis�o", yytext());}
{PDIR} {print_value(yytext(), "Pontua��o", yytext());}
{PESQ} {print_value(yytext(), "Pontua��o", yytext());}
. { throw new RuntimeException("Lexemas inv�lidos " + yytext()); }
