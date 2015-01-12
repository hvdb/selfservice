import 'package:angular/angular.dart';
import 'dart:convert';
import 'package:self_service/services/state_service.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";


@Component(
    selector: 'application-branch-config',
    templateUrl: 'packages/self_service/components/applications/application_branchconfig.html',
    useShadowDom: false,
    publishAs: 'conf')
class ApplicationBranchConfig {

  final Http _http;
  StateService _stateService;
  Map currentConfig;
  String applicationId, notification, notificationType, develop, test, acceptance, production;

  @NgTwoWay('readonly')
  bool readonly;

  ApplicationBranchConfig(this._http, this._stateService) {
    _loadData();
  }


  _loadData() {
    applicationId = _stateService.applicationId;
    _http.get('http://${Constants.getJavaBackendUrl()}/applications/$applicationId')
    .then((HttpResponse response) {
      currentConfig = response.data;
      develop = currentConfig['branchConfiguration']['develop'];
      test = currentConfig['branchConfiguration']['test'];
      acceptance = currentConfig['branchConfiguration']['acceptatie'];
      production = currentConfig['branchConfiguration']['productie'];
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }




}
