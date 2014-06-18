cordova template with shared source
===================================

JUMPSTART a shared source cordova (phonegap) project! Focus on developing the app, using the already woven together HTML5 and JavaScript components. Build native apps for multiple platforms ANYTIME by just running a script without changing anything. All platforms share the same source!

While being aimed at experienced users, also Beginners in app-development may profit. Or maybe it is just nonsense to others. If you have suggestions to change or improve, or even want to participate, you're very welcome to do so. See "Improvements for some distant future"


Features
========
* **shared HTML5 source** for all platforms in contrast to "normal" phonegap per-target-platform-sourcecode
* **build-scripts** that (under some premises) allow for complete or partial (re)builds of the app for mutiple platforms at any time out of the shared source
* **directory structure with template files** to guide you creating the necessary artifacts for cordova, android and ios
* **DEMO APP** showing use of cordova and provides useful infrastructure that you could use:
    * **environment detection** detects if app is running in browser or app and the os-platform, allows to write environment-aware code
    * **i18n** for multi-language apps
    * **geolocation helper** provides better results and easier to use api than just using built-in html5 geolocation api
    * **knockout.js** mvc / mvvm framework for js and databinding in fronend
    * **hammer.js** recognizes touch-events, already wired up to Knockout.js using knockouch.js
- works with different cordova-versions (depends on your local setup), as long as the command-line tools haven't changed
- works with different android and ios versions (see cordova and platform configurations)
- develop just using your favorite editor
- run and test using desktop / mobile browsers or simulators (these are provided from 3rd parties, not included here)


Prerequisites
=============
**For development:**
a random machine with a text editor and a halfway modern browser suffices.

**For testing:**
during development a browser (desktop / mobile) is enough, *however:* it's strongly recommended and easy to build mobile apps even during development. These can then be tested on the target devices / simulators.

**For building:** see build.txt for detailed explanation
You need a machine that natively runs bash (preferably Linux or OSX) with working installations of the following:
- cordova / phonegap (> 3.3), this includes java, apache ant and of course cordova itself
- target platforms sdks, like android sdk, ios sdk (i.e. xcode, ios simulator, requires a Mac / OSX)



How To Use (runthrough for android)
==========================================
- open browser and navigate to the template project's index.html (like <project-home>/web-client/index.html ), enjoy the page
- edit buildscripts 0_0_config.conf to your likings
- run build-scripts/0_completebuild_android.sh 
- copy the project/build/platforms/android/bin/project-debug-unaligned.apk to your android phone (via adb, airdroid or other means) and start! You should see what you've seen on the desktop-browser: the template index.html this time rendered in a cordova webview.
- change and enrich the sources under web-client according to your needs
- test and improve with the use of a local browser like firefox/firebug or chrome either via file:/// or local httpd
- repeatedly rebuild anytime (using the provided 0_rebuild_web_resources.sh or 0_completebuild_all_platforms.sh)


Improvements for some distant future
====================================
- The build scripts contain lots of stuff that could be parameterized and improved.
- create / extend documentation so that beginners have at least a clue what's happening and where to turn the screws for changes
- provide scripts for other target platforms (Tizen, Windows Mobile,...)
- scripts for other build platforms (Windows, what else?)
