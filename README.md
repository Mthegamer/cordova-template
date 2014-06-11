cordova-skeleton 
================

You want to start with cordova / phonegap? Here is a skeleton or template that provides you with basic stuff needed!

WARNING: currently this project is not in a state to be used by beginners, maybe it is even just nonsense to others. It exists mainly for my own purposes. If you still want to try: good luck!

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


Improvements for some distant future
====================================
- The scripts are known to work under osx and linux, windows / cygwin may not work properly.
- The scripts contain lots of stuff that could be parameterized and improved. 
- The whole half-bakedness of this project can be improved
