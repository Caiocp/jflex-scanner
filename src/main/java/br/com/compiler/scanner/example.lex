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
{NUMERO} {print_value(yytext(), "Número");}
{SOMA} {print_value(yytext(), "Soma");}
{SUB} {print_value(yytext(), "Subtração");}
{EXP} {print_value(yytext(), "Exponenciação");}
{MULT} {print_value(yytext(), "Multiplicação");}
{DIV} {print_value(yytext(), "Divisão");}
{PDIR} {print_value(yytext(), "Pontuação");}
{PESQ} {print_value(yytext(), "Pontuação");}
. { throw new RuntimeException("Lexemas inválidos " + yytext()); }
