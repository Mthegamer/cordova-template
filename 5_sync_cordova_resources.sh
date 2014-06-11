#!/bin/bash

cordova=`which cordova`

BUILDDIR=build/project

WWWDIR="$BUILDDIR/www"

WD=`pwd`

echo "START: cordova config"
echo "*******************************************************************"



if [ -d "build" ]
then
    echo ""
else
    echo "build directory does not exist! run cordovabuild first!"
    exit 1
fi



if [ -d "$WWWDIR" ]
then
    echo ""

else
    mkdir "$WWWDIR"
fi



echo -e "\n************************************\ncopying cordova config"
#cp cordova/config.xml "$WWWDIR"     #thats the wrong place
cp cordova/config.xml "$BUILDDIR"

echo "END: cordova config"
echo "*******************************************************************"

