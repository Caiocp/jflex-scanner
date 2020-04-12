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
{NUMERO} {print_value(yytext(), "Número", yytext());}
{SOMA} {print_value(yytext(), "Soma", yytext());}
{SUB} {print_value(yytext(), "Subtração", yytext());}
{EXP} {print_value(yytext(), "Exponenciação", yytext());}
{MULT} {print_value(yytext(), "Multiplicação", yytext());}
{DIV} {print_value(yytext(), "Divisão", yytext());}
{PDIR} {print_value(yytext(), "Pontuação", yytext());}
{PESQ} {print_value(yytext(), "Pontuação", yytext());}
. { throw new RuntimeException("Lexemas inválidos " + yytext()); }
