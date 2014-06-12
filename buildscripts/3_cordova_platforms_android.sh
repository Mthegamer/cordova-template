#!/bin/bash

cordova=`which cordova`

PROJECTNAME=project
PROJECTPACKAGE=org.project.mobile
BUILDDIR=project

echo "START: cordova ANDROID platform"
echo "*******************************************************************"
cd ../target/$PROJECTNAME


echo "installing cordova platforms"
#read -p "Press [Enter] to continue"
cordova platform add android


cd ..
cd ..
echo "END: cordova ANDROID platform"
echo "*******************************************************************"
