#!/bin/bash

cordova=`which cordova`

BUILDDIR=../target/project

echo "START: cordova clean android"
echo "*******************************************************************"


cd "$BUILDDIR"
echo "cleaning cordova build android"
./platforms/android/cordova/clean

echo "END: cordova clean android"
echo "*******************************************************************"
