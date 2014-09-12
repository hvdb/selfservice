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
    //seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    seleniumAddress: 'http://bl00041.nl.europe.intranet:5555/wd/hub',
    specs: [
        '**/*_spec.dart'
    ],

    splitTestsBetweenCapabilities: true,

    multiCapabilities: [{
        'browserName': 'chrome'
        //version: 'dartium',
        //count: 4
    },
        {
            'browserName': 'firefox'
        },
        {
            'browserName': 'internet explorer'
        },
        {
            'browserName': 'safari'
        }
    ],

    baseUrl: configQuery.getBaseUrl(),

    jasmineNodeOpts: {
        isVerbose: true, // display spec names.
        showColors: true, // print colors to the terminal.
        includeStackTrace: true, // include stack traces in failures.
        defaultTimeoutInterval: 80000 // wait time in ms before failing a test.
    }



};

if (process.env.SAUCE_USERNAME != null) {
    config.sauceUser = process.env.SAUCE_USERNAME;
    config.sauceKey = process.env.SAUCE_ACCESS_KEY;
    config.seleniumAddress = null;

    config.multiCapabilities.forEach(function(capability) {
        capability['tunnel-identifier'] = CI_BUILD_NUMBER;
        capability['build'] = CI_BUILD_NUMBER;
        capability['name'] = 'AngularDart E2E Suite';
    });
}


exports.config = config;