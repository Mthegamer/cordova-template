#!/bin/bash

echo "START: CLEAN"
echo "*******************************************************************"


CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

if [ -d "$BUILD_DIR" ]
then
    echo "cleaning build directory!"
#    read -p "Press [Enter] to continue"
    rm -rf $BUILD_DIR
else
    echo " creating build directory"
#    read -p "Press [Enter] to continue"
    mkdir $BUILD_DIR
fi
echo "END: CLEAN"
echo "*******************************************************************"
