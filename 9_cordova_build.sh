#!/bin/bash

cordova=`which cordova`

BUILDDIR=build/project

echo "START: cordova build for installed platforms"
echo "*******************************************************************"

cd "$BUILDDIR"

echo "building cordova"
cordova build

echo "END: cordova build for installed platforms"
echo "*******************************************************************"
