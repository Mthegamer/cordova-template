#!/bin/bash

cordova=`which cordova`

PROJECTNAME=project
PROJECTPACKAGE=org.project.mobile
BUILDDIR=project


echo "START: cordova iOS platform"
echo "*******************************************************************"
cd build/$PROJECTNAME

echo "installing cordova platforms"
#read -p "Press [Enter] to continue"
cordova platform add ios


cd ..
cd ..

echo "END: cordova iOS platform"
echo "*******************************************************************"