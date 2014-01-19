#!/bin/sh

TYPE="$1"
INPUT="/usr/include/linux/input.h"

awk "
	/EV_VERSION/	{ next };
	/_MAX/		{ next };
	/#define $1_/	{ printf(\"\t[ %-16s ] = \\\"%s\\\",\n\", \$2, \$2); }
" < $INPUT
