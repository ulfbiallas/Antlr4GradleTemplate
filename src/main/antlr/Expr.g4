grammar Expr;		

@header {
    package org.antlr.samples.antlr4example;
} 

prog:    (expr NEWLINE)* ;
expr:    expr ('*'|'/') expr
    |    expr ('+'|'-') expr
    |    INT
    |    '(' expr ')'
    ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;