cordova template with shared source
===================================

This template project provides you with infrastructure and scripts to jumpstart a shared source cordova (phonegap) project. It provides some modernish HTML5 and JavaScript components already woven together, a basic configuration and correctly sized and named placeholders for icons and screens. You can instantly start developing the web-app and be able to build apps for multiple platforms by just running a script without changing any parameters. All platforms share the same source!

WARNING: currently this project is not in a state to be used by beginners, maybe it is even just nonsense to others. It exists mainly for my own purposes. If you still want to try: good luck!

If you have suggestions to change or improve, or even want to participate, you're very welcome to do so. See "Improvements for some distant future"


FEATURES
========

- all set up environment with index.html that includes some useful js-libs
- directory structure with template files to guide you creating the necessary artifacts for cordova, android and ios
- you can develop the whole app just using your favorite editor and a web-browser for local testing
- build-scripts that (under some premises) can rebuild the whole cordova (phonegap) infrastructure
- run and test using desktop / mobile browsers or simulators (these are provided from 3rd parties, not included here)
- environment detection (browser, app, platform) to be used for environment-specific code
- builtin i18n for multi-language apps
- builtin geolocation helper (provides better results than just using built-in html5 geolocation api)
- builtin knockout.js mvc (or mvvm)
- builtin hammer.js for touch-events (bound to knockout using knockouch.js)
- works with different cordova-versions (depends on your local setup), as long as the command-line tools haven't changed
- works with different android and ios versions (see cordova and platform configurations)


Prerequisites
=============
working installations of the following:
- phonegap (2.x or 3.x)
- java
- apache ant
- android sdk
- ios sdk (i.e. xcode, ios simulator)


How To Use (quick runthrough for android)
==========================================
- install cordova, java, android sdk (not explained here)
- open browser and navigate to the template project's index.html (like <project-home>/web-client/index.html ), enjoy the page
- edit buildscripts 0_0_config.conf to your likings
- run build-scripts/0_completebuild_android.sh 
- copy the project/build/platforms/android/bin/project-debug-unaligned.apk to your android phone (via adb, airdroid or other means) and start! You should see what you've seen on the desktop-browser: the template index.html this time rendered in a cordova webview.
- now change and enrich the sources under web-client according to your needs
- for better end-user experience change project name and icons / screens
- test and improve with the use of a local browser like firefox/firebug or chrome either via file:/// or local httpd
- repeatedly rebuild anytime using the provided 0_rebuild_web_resources.sh


Improvements for some distant future
====================================
- The scripts are known to work under osx and linux, windows / cygwin may not work properly.
- The scripts contain lots of stuff that could be parameterized and improved. 
- The whole half-bakedness of this project can be improved
