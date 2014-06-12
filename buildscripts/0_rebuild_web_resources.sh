#!/bin/bash
echo "START: partial rebuild all platforms"
echo "*******************************************************************"
./6_sync_android_resources.sh
./6_sync_ios_resources.sh
./7_sync_web_app.sh
./8_cordova_clean_android.sh
./8_cordova_clean_ios.sh
./9_cordova_build.sh
echo "END: partial rebuild all platforms"
echo "*******************************************************************"

