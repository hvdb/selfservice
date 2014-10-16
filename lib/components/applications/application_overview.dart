import 'package:angular/angular.dart';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';


@Component(
    selector: 'application-overview',
    templateUrl: 'packages/self_service/components/applications/application_overview.html',
    useShadowDom: false,
    publishAs: 'overview')
class ApplicationOverview {

  StateService _stateService;
  String  splash;

  ApplicationOverview(RouteProvider routeProvider,this._stateService) {
    String applicationId = routeProvider.parameters['applicationId'];
    if (applicationId != null && applicationId != ':applicationId') {
      _stateService.applicationId = applicationId;
    }

  }



}
