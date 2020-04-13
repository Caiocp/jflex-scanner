package br.com.compiler.scanner;
%%
%public
%class LexicalAnalyzerExample
%{
private void print_value(String lexema, String tipo, String valor) {
 System.out.println(lexema + "\t" + " | " + tipo + "\t" + " | " + valor);
}
%}
%int
%line
%column

NUMERO = [\d]+
SINALNUMERO = [-+]{1}\d+
SOMA = [+]
SUB = [-]
MULT = [*]
DIV = [/]
EXP = [*]{2}
PDIR = [(]
PESQ = [)]
ESPACO = [\n| |\t|\r]

%%

{NUMERO} {print_value(yytext(), "N�mero", yytext());}
{SINALNUMERO} {print_value(yytext(), "N�mero", yytext());}
{SOMA} {print_value(yytext(), "Operador", "Soma");}
{SUB} {print_value(yytext(), "Operador", "Subtra��o");}
{MULT} {print_value(yytext(), "Operador", "Multiplica��o");}
{EXP} {print_value(yytext(), "Operador", "Exponencia��o");}
{DIV} {print_value(yytext(), "Operador", "Divis�o");}
{PDIR} {print_value(yytext(), "Pontua��o", "ParenDir");}
{PESQ} {print_value(yytext(), "Pontua��o", "ParenEsq");}
{ESPACO} {/*Ignore*/}
. { throw new RuntimeException("Lexemas inv�lidos " + yytext()); }
