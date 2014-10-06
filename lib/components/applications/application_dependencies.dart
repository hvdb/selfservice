import 'package:angular/angular.dart';
import 'dart:convert';


@Component(
    selector: 'application-dependencies',
    templateUrl: 'packages/self_service/components/applications/application_dependencies.html',
    useShadowDom: false,
    publishAs: 'dependencies')
class ApplicationDependencies {

  final Http _http;

  Map config;

  ApplicationDependencies(this._http) {

    config = JSON.decode('{"develop" : [{"name" : "Spectingular-Core", "url" :"http://www.nu.nl"}] }');

  }





}
