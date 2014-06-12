#!/bin/bash

#part of the cordova template at https://github.com/sk3l3t0r/cordova-template
#author: android0x17@gmail.com


cordova=`which cordova`



echo "START: sync web-app"
echo "*******************************************************************"

CONFIG_FILE=0_0_configuration.conf

if [[ -f $CONFIG_FILE ]]; then
        . $CONFIG_FILE
else
    echo "ERROR reading config!"
    exit 1;
fi

WWWDIR="$BUILD_DIR/$PROJECT_NAME/www"

if [ -d "$BUILD_DIR" ]
then
    echo ""
else
    echo "target directory does not exist! Run complete build first!"
    exit 1
fi


if [ -d "../sources" ]
then
    echo ""
else
    echo "Error: Directory 'sources' does not exist."
    exit 1
fi

if [ ! -d "$WWWDIR" ]
then
    echo "(re)creating directory " "$WWWDIR"
    mkdir "$WWWDIR"
fi

echo -e "\n************************************\ncopying sources from sources"
rsync -ah ../sources/* "$WWWDIR"

echo "END: sync web-app"
echo "*******************************************************************"
