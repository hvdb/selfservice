import 'package:angular/angular.dart';
import 'dart:convert';

@Component(
    selector: 'application-builds',
    templateUrl: 'packages/self_service/components/applications/application_builds.html',
    useShadowDom: false,
    publishAs: 'builds')
class ApplicationBuilds {

  Map results;


  bool showEnvironmentStatus;

  @NgTwoWay('showEnvironmentStatus')
  set showEnvStatus(bool boolean) {
    print('hier');
     showEnvironmentStatus = boolean;
     results = JSON.decode('{"builds": [{ "environment":"develop","status" :"warning" },{ "environment":"test","status" :"ok" },{ "environment":"acceptance","status" :"error" },{"environment":"production","status" :"ok" }]}');

  }


  @NgTwoWay('limit')
  set limit(int limit) {
    print('limit $limit');
    if (!showEnvironmentStatus) {
      results = JSON.decode('{"builds": [{"number":"1238" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"error" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" }]}');
    }
  }

  ApplicationBuilds() {
    results = JSON.decode('{"builds": [{"number":"1238" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"error" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"error" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"ok" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"warning" },{"number":"1239" ,"applicationName":"gDemo","branch": "origin/master", "environment":"acceptance","status" :"progress" }]}');
  }


}
