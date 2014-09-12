#!/bin/bash

set -e -o pipefail
. "$(dirname $0)/../env.sh"

echo '==========='
echo '== BUILD =='
echo '==========='


pub get
npm install
./node_modules/karma/bin/karma start karma-dart.conf.js --single-run

pub serve
./node_modules/.bin/protractor_dart test/e2e/configDocker.js