module.exports = function(config) {
    // Example set of browsers to run on Sauce Labs
    // Check out https://saucelabs.com/platforms for all browser/platform combos
    var customLaunchers = {
        sl_chrome: {
            base: 'SauceLabs',
            browserName: 'chrome',
            platform: 'Windows 7',
            version: '35'
        },
        sl_firefox: {
            base: 'SauceLabs',
            browserName: 'firefox',
            version: '30'
        }
    };

    config.set({

        // The rest of your karma config is here
        // ...

        basePath: '.',
        frameworks: ['dart-unittest'],

        hostname: '127.0.0.1',

        files: [
            {pattern: 'test/unit/self_service_spec.dart',  included: true},
            {pattern: '**/*.dart', 				          included: false},
            {pattern: '**/*.html', 				          included: false}
        ],



        exclude: [
        ],

        autoWatch: true,
        captureTimeout: 60000,
        browserNoActivityTimeout: 300000,

        plugins: [
            'karma-dart',
            'karma-chrome-launcher',
            'karma-sauce-launcher',
            'karma-firefox-launcher',
            'karma-script-launcher',
            'karma-junit-reporter'

        ],

        junitReporter: {
            outputFile: 'test_out/unit.xml',
            suite: 'unit'
        },



        sauceLabs: {
            testName: 'Selfservice'
        },
        customLaunchers: customLaunchers,
        browsers: Object.keys(customLaunchers),
        reporters: ['dots', 'saucelabs'],
        singleRun: true
    });
};