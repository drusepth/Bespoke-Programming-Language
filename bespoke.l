/*    bespoke.l
 
      A lex specification file for Bespoke.
     
      To create the lexical analyzer:

      flex bespoke.l
      g++ lex.yy.c -o bespoke_lexer
      bespoke_lexer < inputFileName
*/

%{

%}

/* Definitions of regular expressions go here */

WSPACE             [ \t\v\r]+
NEWLINE            \n

DIGIT              [0-9]
DIGITMODIFIER      positive|negative
LETTER             [a-zA-Z]

INTCONST           {DIGITMODIFIER}*[\s]{DIGIT}+
IDENT              ({LETTER}|_)({LETTER}|{DIGIT}|_)*

%%

"print"            {
                     printTokenInfo("PRINT", yytext);
                     return T_PRINT;
                   }
                  
"input"            {
                     printTokenInfo("input", yytext);
                     return T_INPUT;
                   }

"if"               {
                     printTokenInfo("IF", yytext);
                     return T_IF;
                   }

"plus"             {
                     printTokenInfo("ADD", yytext);
                     return T_ADD;
                   }

"minus"            {
                     printTokenInfo("SUB", yytext);
                     return T_SUB;
                   }

"times"            {
                     printTokenInfo("MULT", yytext);
                     return T_MULT;
                   }

"divided by"       {
                     printTokenInfo("DIV", yytext);
                     return T_DIV;
                   }

"is greater than"  {
                     printTokenInfo("GT", yytext);
                     return T_GT;
                   }

"is at least"      {
                     printTokenInfo("GE", yytext);
                     return T_GE;
                   }

"is less than"     {
                     printTokenInfo("LT", yytext);
                     return T_LT;
                   }

"is no more than"  {
                     printTokenInfo("LE", yytext);
                     return T_LE;
                   }

"is equal to"      {
                     printTokenInfo("EQ", yytext);
                     return T_EQ;
                   }

"is not equal to"  {
                     printTokenInfo("NE", yytext);
                     return T_NE;
                   }

"and"              {
                     printTokenInfo("AND", yytext);
                     return T_AND;
                   }

"or"               {
                     printTokenInfo("OR", yytext);
                     return T_OR;
                   }

"not"              {
                     printTokenInfo("NOT", yytext);
                     return T_NOT;
                   }

{INTCONST}         {
                     printTokenInfo("INTCONST", yytext);
                     return T_INTCONST;
                   }

{IDENT}            {
                     printTokenInfo("IDENT", yytext);
                     return T_IDENT;
                   }

{NEWLINE}          {
                     numLines++;
                   }

{WSPACE}           { }

.                  {
                     printTokenInfo("UNKNOWN", yytext);
                     return T_UNKNOWN;
                   }

%%

