import 'package:angular/angular.dart';
import 'dart:convert';

@Component(
    selector: 'configure-branches',
    templateUrl: 'packages/self_service/components/applications/configure_application.html',
    useShadowDom: false,
    publishAs: 'conf')
class ConfigureBranches {

  Map currentConfig;

  ConfigureBranches() {
    currentConfig = JSON.decode('{"develop":"henk" ,"master": "master", "release-a":"release-a","release-prd" :"release-prd" }');
  }






}
