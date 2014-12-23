import 'package:angular/angular.dart';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';


@Component(
    selector: 'build-details-application',
    templateUrl: 'packages/self_service/components/applications/build_details_application.html',
    useShadowDom: false,
    publishAs: 'cmp')
class BuildDetailsApplication {

  final Http _http;
  Map details = new Map();
  StateService  _stateService;


  BuildDetailsApplication(this._stateService ,this._http) {
    details = _stateService.applicationDetails;
  }


}
