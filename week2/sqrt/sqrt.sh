#!bin/bash

SQRT="$1"

ocamlbuild -pkgs ounit2 $SQRT/sqrt_$SQRT\_test.byte
./$SQRT/sqrt_$SQRT\_test.byte