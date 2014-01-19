#!/bin/bash

for i in EV REL ABS MSC LED SND REP KEY BTN BUS SW
do
	echo "creating... $i.h" 
	./name.sh $i >> "$i.h"
done

echo "compiling..."
echo "gcc input-events.c input.c -o seplogger"
gcc input-events.c input.c -o seplogger

if [ $? -eq 0 ]
	then echo "done!"
else
	echo "ops!"
fi
