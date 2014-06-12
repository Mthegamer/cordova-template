#!/bin/bash

cordova=`which cordova`

PROJECTNAME=project
PROJECTPACKAGE=org.project.mobile
BUILDDIR=project

echo "START: creating cordova project"
echo "*******************************************************************"

if [ -d "../target" ]
then
    echo "cleaning build directory!"
#    read -p "Press [Enter] to continue"
    rm -rf ../target/*
else
    echo " creating... build directory"
#    read -p "Press [Enter] to continue"
    mkdir ../target
fi

cd ../target

WD=`pwd`

echo "current directory:" $WD


echo "creating cordova project"
echo -e "\n cordova create " $PROJECTNAME $PROJECTPACKAGE $BUILDDIR
cordova create "$PROJECTNAME" "$PROJECTPACKAGE" "$BUILDDIR"

if [ -d "$BUILDDIR" ]
then
    cd "$BUILDDIR"
else
    echo "CORDOVA PROJECT NOT CREATED! exiting..."
    exit 1
fi


cd ..
cd ..

echo "END: creating cordova project"
echo "*******************************************************************"

