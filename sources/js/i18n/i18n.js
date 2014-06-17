/**
 * provides localized texts. in fact, currently jquery.i18n.js does all the work.
 * configure texts in jquery.XX.json to support languages and texts in project.i18n.XX.json for the supported languages
 *
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

function I18n() {
    var userLang = navigator.language || navigator.userLanguage;
    if (typeof userLang === 'string')
        userLang = userLang.split('-')[0];

        console.log("i18n: using language: " + userLang);
    $.i18n.setLocale(userLang);

    

};
