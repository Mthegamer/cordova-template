cordova-skeleton 
================

Want to jumpstart a new cordova / phonegap project? You have multiple target platforms but want to maintain only (html5 web) source location? You want to use your app from desktop / mobile browser and a native app? Here is a skeleton / template that provides you with basic stuff needed! You don't have to mess around with phonegap build anymore. Includes some modernish HTML5 stuff for DOM-manipulation (jquery), mvc / mvvm & templating (Knockout.js), Geolocation

WARNING: currently this project is not in a state to be used by beginners, maybe it is even just nonsense to others. It exists mainly for my own purposes. If you still want to try: good luck and share your experiences!

If you have suggestions to change or improve, or even want to participate, you're very welcome to do so. See "Improvements for some distant future"


FEATURES
========

- all set up environment with index.html that includes javascript initialization and some useful js-libs
- directory structure to guide you creating the necessary artifacts for cordova, android and ios
- you can develop the whole app just using your favorite editor and a web-browser for local testing
- build-scripts that (under some premises) can rebuild the whole cordova infrastructure
- run and test using the simulators (that are provided from 3rd parties, not included here)
- environment detection (browser, app, platform) to be used for environment-specific code
- i18n for multi-language apps
- geolocation helper (provides better results than just using built-in html5 geolocation api)
- knockout.js mvc (or mvvm)
- hammer.js for touch-events (bound to knockout using knockouch.js)
- works with different cordova-versions
- works with different android and ios versions


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
- open browser and navigate to the projects index.html (like <project-home>/web-client/index.html ), enjoy the page
- run one of the initial build-scripts, e.g. 0_completebuild_android.sh 
- copy the project/build/platforms/android/bin/project-debug-unaligned.apk to your android phone (via adb, airdroid or other means), start! You should see what you've seen on the desktop-browser: the template index.html this time rendered in a cordova webview.
- now change and enrich the sources under web-client according to your needs
- test and improve with the use of a local browser like firefox/firebug or chrome either via file:/// or local httpd
- rebuild using the provided 0_rebuild_web_resources.sh


Improvements for some distant future
====================================
- The scripts are known to work under osx and linux, windows / cygwin may not work properly.
- The scripts contain lots of stuff that could be parameterized and improved. 
- The whole half-bakedness of this project can be improved
