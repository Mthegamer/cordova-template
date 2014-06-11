#!/bin/bash

echo "START: CLEAN"
echo "*******************************************************************"

if [ -d "build" ]
then
    echo "cleaning build directory!"
#    read -p "Press [Enter] to continue"
    rm -rf build
else
    echo " creating... build directory"
#    read -p "Press [Enter] to continue"
    mkdir build
fi
echo "END: CLEAN"
echo "*******************************************************************"
