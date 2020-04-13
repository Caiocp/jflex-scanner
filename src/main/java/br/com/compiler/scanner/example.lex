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

{NUMERO} {print_value(yytext(), "Número", yytext());}
{SINALNUMERO} {print_value(yytext(), "Número", yytext());}
{SOMA} {print_value(yytext(), "Operador", "Soma");}
{SUB} {print_value(yytext(), "Operador", "Subtração");}
{MULT} {print_value(yytext(), "Operador", "Multiplicação");}
{EXP} {print_value(yytext(), "Operador", "Exponenciação");}
{DIV} {print_value(yytext(), "Operador", "Divisão");}
{PDIR} {print_value(yytext(), "Pontuação", "ParenDir");}
{PESQ} {print_value(yytext(), "Pontuação", "ParenEsq");}
{ESPACO} {/*Ignore*/}
. { throw new RuntimeException("Lexemas inválidos " + yytext()); }
