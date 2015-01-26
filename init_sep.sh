#!/bin/bash

#force sound output to p2
amixer cset numid=3 1 >/dev/null
amixer cset numid=3 80% >/dev/null

PI_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $PI_DIR

# add scripts shortcut to path
if [[ $PATH != *"$PI_DIR/scripts/shortcuts"* ]]
then
	PATH="$PI_DIR/shortcuts:$PATH"
fi

python seeing_eye.py


