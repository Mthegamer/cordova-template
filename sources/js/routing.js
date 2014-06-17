/*
 * part of the cordova template at https://github.com/sk3l3t0r/cordova-template
 * author: android0x17@gmail.com
 *
 * Copyright 2014 android0x17
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

var routing = $.sammy(function () {

    this.viewStateHistory = new Array();

    var that = this;

    ViewState = function (location, header, content, footer) {
        this.location = location;
        this.header = header;
        this.content = content;
        this.footer = footer;

    }

    // Override this function so that Sammy doesn't mess with forms
    this._checkFormSubmission = function (form) {
        return (false);
    };

    // START ROUTES: below are definitions of routes that are reachable via # urls, so virtually any possible gui changes!

    this.get ('#/', function(){
        vs = new ViewState('#/', "defaultHeader", "defaultContent", "defaultFooter");
        setNewViewState(vs);

    });

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

        console.log('D: setting footer to:' + viewstate.footer);
        viewModel.viewState.footer(viewstate.footer);
    }


    function saveCurrentViewState() {

        var location = window.location.hash;
        var header = viewModel.viewState.header();
        var content = viewModel.viewState.content();
        var footer = viewModel.viewState.footer();
        that.viewStateHistory.push(new ViewState(location, header, content, footer));
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
