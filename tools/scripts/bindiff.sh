#!/bin/sh

SRC=fe6-base
TAR=fe6

xxd $TAR.gba > $TAR.hex
xxd $SRC.gba > $SRC.hex
diff $TAR.hex $SRC.hex
rm $TAR.hex $SRC.hex
