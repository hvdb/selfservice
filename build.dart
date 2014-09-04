
import 'package:logging/logging.dart';
import 'dart:io';
import 'dart:convert';



final Logger log = new Logger('Aapplications');

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });

  //Make sure application runs (pub serve)
  //Make sure selenium server runs


  //Run pub get
  _runProcess('Pub get', 'pub', ['get']);
  //run npm install
  _runProcess('Npm install', 'npm', ['install']);

  //Run unit tests.
  _runProcess('Unit tests','./node_modules/karma/bin/karma', ['start', 'karma-dart.conf.js', '--single-run']);

  //Run pub build
  _runProcess('Pub build', 'pub', ['build']);

  //Build docker
  _runProcess('Docker build', 'docker', [ 'build', '-t', 'selfservice', '.']);

  //start docker
  String dockerContainerId = _runProcess('Docker run', 'docker', [ 'run', '-p', '8889:80', '-d', 'selfservice'], docker:true);

  //Run protractor
  bool error = _runProcess('Protractor tests', './node_modules/.bin/protractor_dart', [ 'test/e2e/configDocker.js'], protractor:true);

  //if no problems, publish docker images.
  _runProcess('Docker stop','docker', ['stop', '$dockerContainerId']);
  if(!error) {

    log.fine('ok we are going to publish the docker image!');

  } else {
    log.severe('error during protractor tests!. Stop docker and remove,.');
    _runProcess('Docker remove','docker', ['rm', '$dockerContainerId']);

  }

}


_runProcess(String process, String processCommand, List<String> processCommandAttributes,{docker:false, protractor:false}) {
  log.fine('Running $process');
  ProcessResult res = Process.runSync(processCommand, processCommandAttributes);
  log.fine('$process results');
  log.fine(res.stdout);


  if (res.exitCode != 0) {
    log.severe('$process failed. Build aborted. See sterr:');
    log.severe(res.stderr);
    if (protractor) {
     return true;
    } else {
      throw new Exception('$process failed.');
    }
  }
  if(docker) {
    return (res.stdout.trim());
  }
}