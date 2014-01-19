#!/bin/bash

echo "Installing SOME dependencies... "
sudo apt-get install espeak aplay fortune ruby1.9.3

echo "Installing logger..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/logger
pwd
./install.sh

cd $DIR

if [ $? -eq 0 ]
	then echo "done!"
else
	echo "ops!"
fi
