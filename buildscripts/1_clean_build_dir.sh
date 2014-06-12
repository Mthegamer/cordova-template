#!/bin/bash

echo "START: CLEAN"
echo "*******************************************************************"

if [ -d "../target" ]
then
    echo "cleaning build directory!"
#    read -p "Press [Enter] to continue"
    rm -rf ../target
else
    echo " creating... build directory"
#    read -p "Press [Enter] to continue"
    mkdir ../target
fi
echo "END: CLEAN"
echo "*******************************************************************"
