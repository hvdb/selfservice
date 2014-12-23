import 'package:angular/angular.dart';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';


@Component(
    selector: 'build-details',
    templateUrl: 'packages/self_service/components/applications/build_details.html',
    useShadowDom: false,
    publishAs: 'cmp')
class BuildDetails {

  final Http _http;
  Map failed = new Map();
  Map passed = new Map();
  StateService  _stateService;
  String env;

  @NgTwoWay('environment')
  set environment(String value) {
    env = value;
    _loadData(env);
  }



  BuildDetails(this._http, this._stateService) {

  }
  void _loadData(String environment) {
print('loading env $environment');



    _http.get('http://localhost:8080/latest.json')
    .then((HttpResponse response) {
      print('list');
      failed = response.data["modules"]["failed"];
      passed = response.data["modules"]["passed"];

    })
    .catchError((e) {

    });

  }


  showDetails(Map details) {
    print('details $details');
    _stateService.applicationDetails =  details;
  }


}
