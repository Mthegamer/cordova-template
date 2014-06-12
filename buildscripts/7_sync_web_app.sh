#!/bin/bash

cordova=`which cordova`

BUILDDIR=../target/project

WWWDIR="$BUILDDIR/www"


WD=`pwd`


echo "START: sync web-app"
echo "*******************************************************************"


if [ -d "../target" ]
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
