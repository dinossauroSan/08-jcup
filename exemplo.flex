/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+
letra = [a-zA-Z]
stringLITERAL = \"([^\"\\n])*\" 


%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULTIPLICACAO); }
"/"       { return new Symbol(sym.DIVISAO); }
"%"       { return new Symbol(sym.MODULO); }
"^"       { return new Symbol(sym.POTENCIACAO); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
"["       { return new Symbol(sym.COLCHETEESQ); }
"]"       { return new Symbol(sym.COLCHETEDIR); }
"{"       { return new Symbol(sym.CHAVEESQ); }
"}"       { return new Symbol(sym.CHAVEDIR); }
":"       { return new Symbol(sym.DOISPONTOS); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
{stringLITERAL}  { return new Symbol(sym.STRING, yytext()); }
/* NEGADO ^  
Qualquer caractere que NAO seja: " e \n
*/
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\n Caractere inválido: " + yytext() +
                               "\n Linha: " + yyline +
                               "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }