/*    bespoke.y
 
      A yacc specification file for Bespoke.
     
      To create the syntax analyzer:

      flex bespoke.l
      bison bespoke.y
      g++ bespoke.tab.c -o parser
      parser < inputFileName
*/

%{
#include <stdio.h>

int numLines = 0;

void printRule(const char*, const char*);
int yyerror(const char* s);
void printTokenInfo(const char* tokenType, const char* lexeme);

extern "C" {
  int yyparse(void);
  int yylex(void);
  int yywrap() { return 1; }
}

%}

/* Token declarations */
%token /* TODO: Token list */

/* Starting point */
%start N_START

/* Translation rules */
%%
/* TODO: Translate grammar */
%%

#include "lex.yy.c"
extern FILE *yyin;

void printRule(const char *lhs, const char *rhs) {
  printf("%s -> %s\n", lhs, rhs);
  return;
}

int yyerror(const char *s) {
  printf("Line %d: %s\n", numLines + 1, s);
  return(1);
}

void printTokenInfo(const char* tokenType, const char* lexeme) {
  printf("TOKEN: %s  LEXEME: %s\n", tokenType, lexeme);
}

int main() {
  do {
    yyparse();
    numLines++;
  } while (!feof(yyin));

  return 0;
}
