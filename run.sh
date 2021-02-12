#!bin/bash

WEEK_NUM="$1"

ocamlbuild -pkgs ounit2 week$WEEK_NUM/tests.byte
./week$WEEK_NUM/tests.byte