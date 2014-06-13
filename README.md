cordova template with shared source
===================================

This template project provides some infrastructure and scripts to JUMPSTART a shared source cordova (phonegap) project. You can instantly focus on developing the web-app, using the already woven together HTML5 and JavaScript components, a basic configuration and correctly sized and named placeholders for icons and screens. Build apps for multiple platforms ANYTIME by just running a script without changing any parameters. All platforms share the same source!

WARNING: currently this project is not in a state to be used by beginners, maybe it is even just nonsense to others. It exists mainly for my own purposes. If you still want to try: good luck!

If you have suggestions to change or improve, or even want to participate, you're very welcome to do so. See "Improvements for some distant future"


Features
========
- **shared HTML5 source** for all platforms in contrast to "normal" phonegap per-target-platform-sourcecode
- **demo application** showing use of cordova and some useful js-libs
- **directory structure with template files** to guide you creating the necessary artifacts for cordova, android and ios
- **build-scripts** that (under some premises) allow for instant complete (re)builds the whole cordova (phonegap) infrastructure
- **DEMO APP** that provides useful infrastructure that you could use:
-- **built-in environment detection** detects if app is running in browser or app and the os-platform, allows to write environment-aware code
-- **builtin i18n** for multi-language apps
-- **builtin geolocation helper** provides better results and easier to use api than just using built-in html5 geolocation api
-- **builtin knockout.js** mvc / mvvm framework for js and databinding in fronend
-- **builtin hammer.js** recognizes touch-events, already wired up to Knockout.js using knockouch.js
- works with different cordova-versions (depends on your local setup), as long as the command-line tools haven't changed
- works with different android and ios versions (see cordova and platform configurations)
- you can develop the whole app just using your favorite editor and a web-browser for local testing
- run and test using desktop / mobile browsers or simulators (these are provided from 3rd parties, not included here)


Prerequisites
=============
**For development:**
a random machine with a text editor and a halfway modern browser suffices.

**For testing:**
during development a browser (desktop / mobile) is enough, *however:* it's strongly recommended and easy to build mobile apps even during development. These can then be tested on the target devices / simulators.

**For building:**
You need a machine that natively runs bash (preferably Linux or OSX) with working installations of the following:
- java (needed for cordova / phonegap)
- apache ant (needed for cordova / phonegap)
- phonegap (2.x or 3.x)
- android sdk (use lates available)
- ios sdk (i.e. xcode, ios simulator), required for ios builds, requires a Mac / OSX



How To Use (runthrough for android)
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
- make nice demo app that shows all provided capabilities and sample code
- extend documentation so that beginners have at least a clue what's happening and where to turn the screws for changes
- The whole half-bakedness of this project can be improved
- The scripts contain lots of stuff that could be parameterized and improved.
- provide scripts for other target platforms (Tizen, Windows Mobile,...)
- scripts for other build platforms (Windows, what else?)