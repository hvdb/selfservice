import 'package:angular/angular.dart';
import 'dart:convert';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'application-builds',
    templateUrl: 'packages/self_service/components/applications/application_builds.html',
    useShadowDom: false,
    publishAs: 'builds')
class ApplicationBuilds {

  Map results;
  final Http _http;
  StateService _stateService;
  String applicationId, notification, notificationType;

  bool showEnvironmentStatus;

  @NgTwoWay('showEnvironmentStatus')
  set showEnvStatus(bool boolean) {
     showEnvironmentStatus = boolean;



  }


  @NgTwoWay('limit')
  set limit(int limit) {

  }

  ApplicationBuilds(this._http, this._stateService) {
    _loadData();
  }


  _loadData() {
    applicationId = _stateService.applicationId.toLowerCase();
    _http.get('http://${Constants.getStashUrl()}/build/information/application/$applicationId', withCredentials:true)
    .then((HttpResponse response) {
      results = response.data;
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }

}


