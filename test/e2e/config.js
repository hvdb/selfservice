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

    specs: [
        '*/*_spec.dart'
    ],

    splitTestsBetweenCapabilities: true,

    multiCapabilities: [{
        'browserName': 'chrome',
        'chromeOptions': configQuery.getChromeOptions(),
        count: 4
    }],

    baseUrl: configQuery.getBaseUrl(),

    jasmineNodeOpts: {
        isVerbose: true, // display spec names.
        showColors: true, // print colors to the terminal.
        includeStackTrace: true, // include stack traces in failures.
        defaultTimeoutInterval: 80000 // wait time in ms before failing a test.
    },
};

// Saucelabs case.
if (process.env.SAUCE_USERNAME != null) {
    config.sauceUser = process.env.SAUCE_USERNAME;
    config.sauceKey = process.env.SAUCE_ACCESS_KEY;
    config.seleniumAddress = null;

    config.multiCapabilities.forEach(function(capability) {
        capability['tunnel-identifier'] = process.env.TRAVIS_JOB_NUMBER;
        capability['build'] = process.env.TRAVIS_BUILD_NUMBER;
        capability['name'] = 'AngularDart E2E Suite';
    });
}

exports.config = config;