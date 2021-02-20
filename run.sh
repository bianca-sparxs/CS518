#!bin/bash

WEEK_NUM="$1"

if [ $WEEK_NUM -lt 3 ]
then 
    ocamlbuild -pkgs ounit2 week$WEEK_NUM/tests.byte
    ./week$WEEK_NUM/tests.byte
else
    ocamlbuild -pkgs qcheck week$WEEK_NUM/tests.byte
    printf '#use "topfind";;\n#require "qcheck";;\n#use "week%d/tests.ml";;\n' $WEEK_NUM | ocaml
fi

