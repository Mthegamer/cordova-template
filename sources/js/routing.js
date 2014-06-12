var routing = $.sammy(function () {

    this.viewStateHistory = new Array();

    var that = this;

    that.intervalRegistry = new Array();

    function startInterval(intervalFunction, timeout) {
        if ((typeof timeout === 'undefined') || (timeout == '')) {
            timeout = 30000;
        }
        intervalFunction();
        var interval = setInterval(intervalFunction, timeout);
        if (config.debugMode)
            console.log("started interval:" + interval);

        that.intervalRegistry.push(interval);
    }

    function stopLastInterval() {
        var current = that.intervalRegistry.pop();
        clearInterval(current);
        if (config.debugMode)
            console.log("cleared interval:" + current);
    }

    function stopAllIntervals() {

        that.intervalRegistry.forEach(function (current) {
            clearInterval(current);
            if (config.debugMode)
                console.log("cleared interval:" + current);
        });
    }

    this.stopNetworkUpdates = function () {
        stopAllIntervals();
        console.log("stopped all recurring updates");
    }

    ViewState = function (location, mainview, content, header) {
        this.location = location;
        this.mainview = mainview;
        this.content = content;
        this.header = header;
    }

    // Override this function so that Sammy doesn't mess with forms
    this._checkFormSubmission = function (form) {
        return (false);
    };

    // START ROUTES: below are definitions of routes that are reachable via # urls, so virtually any possible gui changes!


    this.notFound = function () {
        routing.setLocation('#/');
    }

    // END ROUTES


    //BEGIN private functions

    function setNewViewState(viewstate) {


        console.log('D: setting header to: ' + viewstate.header);
        viewModel.viewState.header(viewstate.header);

        console.log('D: setting content to: ' + viewstate.content);
        viewModel.viewState.content(viewstate.content);

        console.log('D: setting mainview to:' + viewstate.mainview);
        viewModel.viewState.mainview(viewstate.mainview);
    }


    function saveCurrentViewState(direction) {
        if (typeof direction === 'undefined') direction = 'viewStateHistory';
        var location = window.location.hash;
        var mainview = viewModel.viewState.mainview();
        var nav = viewModel.viewState.content();
        var longPressMenu = viewModel.viewState.longPressMenu();
        var header = viewModel.viewState.header();
        that[direction].push(new ViewState(location, mainview, nav, longPressMenu, header));
    }

    function restoreLastViewState() {
        var to = that.viewStateHistory.pop();

        if (typeof to === 'undefined') {
            routing.setLocation('#/');
            return;
        }
        routing.setLocation(to.location);

    }


    this.navigateTo = function navigateTo(target) {
        saveCurrentViewState();
        if (config.debugMode) {
            console.log('navigating to:' + target);
        }

        routing.setLocation(target);
        if (config.debugMode) {
            console.log('done: set location to:' + target);
        }

    }

    this.navigateBack = function () {
        restoreLastViewState();
    }


    // END private functions


});
