
# ANTLR4 Gradle Template

Template for [ANTLR4](http://www.antlr.org/) projects using [Gradle](http://gradle.org/) and its [ANTLR plugin](https://docs.gradle.org/current/userguide/antlr_plugin.html).

In addition to the default behaviour of the ANTLR plugin, this template uses the package declaration from the grammar file.



## Getting Started ##

You can use the template exactly as described in the documentation of the ANTLR plugin for Gradle.
The main steps are basically:

1. Clone this project
2. Store your ANTLR grammar file in *src/main/antlr* or *src/test/antlr*
3. Run **generateGrammarSource** respectively **generateTestGrammarSource**
4. Find the generated code in *src-gen/main/java* or *src-gen/test/java*



## Features ##

#### Folders for generated code ####

The folders for the generated code are defined in the variables **GENERATED_MAIN** and **GENERATED_TEST** inside the *build.gradle*
and can be easily changed. The default folders are *src-gen/main/java* and *src-gen/test/java*.

#### Grammars with different packages ####

There is no problem in providing multiple grammar files with different package names in their package declarations.

First the template uses the ANTLR plugin to generate the code as intended by the plugin (everything goes in the same folder).
In a second step it will move the generated files into their correct packages.



## Example ##

In *src/main/antlr*, this project contains the sample grammar from the ANTLR homepage, extended with a package declaration:

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

By running the Gradle task **generateGrammarSource** ANTLR will generate *Lexer* and *Parser* and move the files to *src-gen/main/java/org/antlr/samples/antlr4example*.
Each **.java*-file will have the correct package name (*package org.antlr.samples.antlr4example;*).