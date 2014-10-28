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
    applicationId = _stateService.applicationId.toLowerCase();
    _http.get('http://${Constants.getStashUrl()}/application/$applicationId/branchconfig')
    .then((HttpResponse response) {
      currentConfig = response.data;
      develop = currentConfig['develop'];
      test = currentConfig['test'];
      acceptance = currentConfig['acceptatie'];
      production = currentConfig['productie'];
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }

  save() {
    JsonObject config = new JsonObject();
    config.applicationId = applicationId;
    config.develop = develop;
    config.test = test;
    config.acceptatie = acceptance;
    config.productie = production;

    _http.post('http://${Constants.getStashUrl()}/application/$applicationId/branchconfig', JSON.encode(config)).then((HttpResponse response) {
      print('ok');
      notification = 'application-branch-config-notification-post-success';
      notificationType = 'success';
    }).catchError((e) {
      print('error');
      notification = 'technical-error';
      notificationType = 'error';
    });

  }


}
