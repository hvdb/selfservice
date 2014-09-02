module.exports = function(config) {
    config.set({
        basePath: '.',
        frameworks: ['dart-unittest'],

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
            'karma-junit-reporter'

        ],

        browsers: ['Dartium']
    });
};