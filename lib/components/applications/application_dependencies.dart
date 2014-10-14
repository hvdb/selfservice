import 'package:angular/angular.dart';
import 'dart:convert';
import 'package:self_service/services/state_service.dart';
import 'constants.dart';
import 'dart:async';

@Component(
    selector: 'application-dependencies',
    templateUrl: 'packages/self_service/components/applications/application_dependencies.html',
    useShadowDom: false,
    publishAs: 'dependencies')
class ApplicationDependencies {

  final Http _http;
  StateService _stateService;

  Map config;
  List deps = new List();
  String applicationId, notification, notificationType;


  ApplicationDependencies(this._http, this._stateService) {
    _loadData();
  }

  _loadData() {
    applicationId = _stateService.applicationId.toLowerCase();
    _http.get('http://${Constants.getStashUrl()}/application/$applicationId/dependencies/develop')
    .then((HttpResponse response) {
      config = response.data;
      Map dependencies = config['dependencies'];
      for (var key in dependencies.keys) {
        deps.add({"name":"$key", "value":dependencies['$key']});
      }

    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }




}
