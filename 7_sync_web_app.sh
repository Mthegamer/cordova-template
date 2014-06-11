#!/bin/bash

cordova=`which cordova`

BUILDDIR=build/project

WWWDIR="$BUILDDIR/www"


WD=`pwd`


echo "START: sync web-app"
echo "*******************************************************************"


if [ -d "build" ]
then
    echo ""
else
    echo "build directory does not exist! run cordovabuild first!"
    exit 1
fi


if [ -d "web-client" ]
then
    echo ""
else
    echo "Error: Directory web-client does not exist."
    exit 1
fi

if [ ! -d "$WWWDIR" ]
then
    echo "(re)creating directory " "$WWWDIR"
    mkdir "$WWWDIR"
fi

echo -e "\n************************************\ncopying sources from web-client"
rsync -ah web-client/* "$WWWDIR"

echo "END: sync web-app"
echo "*******************************************************************"
