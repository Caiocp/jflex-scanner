package br.com.compiler.scanner;

import java.io.IOException;
import java.io.StringReader;

public class ScannerTest {
	public static void main(String[] args) throws IOException {
		String expr = "1 + 1"; //coloque a express�o aqui
		LexicalAnalyzerExample lexical = new LexicalAnalyzerExample(new StringReader(expr));
		lexical.yylex();
	}
}

/*
- Alguns exemplos:
---> +1*2
---> +5**2-(4)
---> -5--7
---> -(8+12)**1*3/-4
---> a2+(3-5)
---> 1+2/b
[^\d\s()/*+-]\+|\-[\d]+
*/