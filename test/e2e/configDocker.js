/**
 * Environment Variables affecting this config.
 * --------------------------------------------
 *
 * DARTIUM: The full path to the Dartium binary.
 *
 * NGDART_EXAMPLE_BASEURL: Overrides the default baseUrl to one of your
 *     choosing.  (The default is http://localhost:8080 which is the
 *     correct if you simply run "pub serve" inside the example folder
 *     of the AngularDart repo.)
 */

var configQuery = require('./configQuery.js');

var config = {
    seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    //seleniumAddress: 'http://bl00041.nl.europe.intranet:5555/wd/hub',
    specs: [
        '**/*_spec.dart'
    ],

    splitTestsBetweenCapabilities: true,

    multiCapabilities: [{
        'browserName': 'chrome',
        //'chromeOptions': configQuery.getChromeOptions(),
        count: 4
    }
    ],

    baseUrl: 'http://192.168.59.103:8889',

    jasmineNodeOpts: {
        isVerbose: true, // display spec names.
        showColors: true, // print colors to the terminal.
        includeStackTrace: true, // include stack traces in failures.
        defaultTimeoutInterval: 80000 // wait time in ms before failing a test.
    }
};

exports.config = config;