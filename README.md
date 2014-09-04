selfservice BETA
===========

#preconditions.
Installed dart-sdk.
Installed dartium, make sure to configure the following env variables:
DARTIUM
DARTIUM_BIN

Those need to point to the dartium app.
For mac osx:
export DARTIUM="/Users/shared/dart/chromium/Chromium.app/Contents/MacOS/Chromium"
export DARTIUM_BIN="/Users/shared/dart/chromium/Chromium.app/Contents/MacOS/Chromium"

#Install dependencies
pub get

#If something went wrong you need to rebuild the cache
pub cache repair
pub get/update

#Install npm dependencies. (used for running tests)
npm install

#Running karma unit tests:
In the root:
 ./node_modules/karma/bin/karma start karma-dart.conf.js

#Running e2e tests
Start a selenium server (local) if you installed protractor global.
 -> webdriver-manager start.

Start a server.
-> pub serve --hostname=0.0.0.0

./node_modules/.bin/protractor_dart test/e2e/configDartium.js



#Building the docker image.
You can run all tests and then publish an image with the tested application.


Mac osx:
Start boot2docker

dart build.dart

This will get all dependencies,  run unit tests.
Build image and start.
Run protractor tests.

Stop image.
If there are failed protractor tests the image will be removed.
Otherwise it will be published. (not working yet)


#TODO's

Make the URL configurable via the env properties.
Make more unit tests
Make more e2e test.

Make integration tests.
(need to make docker image for api and stash)





[ ![Codeship Status for hvdb/selfservice](https://www.codeship.io/projects/fad7b5a0-fa3f-0131-9eeb-3aac33d676db/status)](https://www.codeship.io/projects/29029)

