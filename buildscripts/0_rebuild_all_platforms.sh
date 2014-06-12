#!/bin/bash
echo "START: partial rebuild all platforms: plugins, cordova & platform resources, webb app"
echo "*******************************************************************"
./4_cordova_plugins.sh
./5_sync_cordova_resources.sh
./6_sync_android_resources.sh
./6_sync_ios_resources.sh
./7_sync_web_app.sh
./8_cordova_clean_android.sh.sh
./8_cordova_clean_ios.sh
./9_cordova_build.sh
echo "END: partial rebuild all platforms"
echo "*******************************************************************"


