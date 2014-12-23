import 'package:angular/angular.dart';
import 'dart:convert';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'application-build',
    templateUrl: 'packages/self_service/components/applications/application_build.html',
    useShadowDom: false,
    publishAs: 'build')
class ApplicationBuild {

  Map results;
  final Http _http;
  StateService _stateService;
  String applicationId, notification, notificationType;

  ApplicationBuild(RouteProvider routeProvider, this._stateService, this._http) {
    //_loadData();
    //requested build:
    String buildId = routeProvider.parameters['buildId'];


  }


  _loadData() {
    applicationId = _stateService.applicationId.toLowerCase();
    _http.get('http://${Constants.getStashUrl()}/build/information/application/$applicationId')
    .then((HttpResponse response) {
      results = response.data;
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }

}


