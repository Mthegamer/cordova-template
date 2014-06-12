#!/bin/bash
echo "START: complete clean rebuild of all platforms/plugins!"
echo "*******************************************************************"
./1_clean_build_dir.sh
./2_cordova_project.sh
./3_cordova_platforms_android.sh
./3_cordova_platforms_ios.sh
./4_cordova_plugins.sh
./5_sync_cordova_resources.sh
./6_sync_android_resources.sh
./6_sync_ios_resources.sh
./7_sync_web_app.sh
./9_cordova_build.sh
echo "END: complete clean rebuild of all platforms/plugins!"
echo "*******************************************************************"

