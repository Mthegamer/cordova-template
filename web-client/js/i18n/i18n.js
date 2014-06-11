/**
 * provides localized texts. in fact, currently jquery.i18n.js does all the work.
 * configure texts in jquery.XX.json to support languages and texts in project.i18n.XX.json for the supported languages
 */

function I18n() {
    var userLang = navigator.language || navigator.userLanguage;
    if (typeof userLang === 'string')
        userLang = userLang.split('-')[0];

        console.log("i18n: using language: " + userLang);
    $.i18n.setLocale(userLang);

    

};
