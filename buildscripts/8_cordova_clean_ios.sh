#!/bin/bash

cordova=`which cordova`

BUILDDIR=../target/project


echo "START: cordova clean ios"
echo "*******************************************************************"


cd "$BUILDDIR"

echo "cleaning cordova build ios"
./platforms/ios/cordova/clean


echo "END: cordova clean ios"
echo "*******************************************************************"
