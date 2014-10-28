import 'package:angular/angular.dart';
import '../constants.dart';
import 'package:self_service/services/state_service.dart';


@Component(
    selector: 'application-pull-requests',
    templateUrl: 'packages/self_service/components/applications/application_pr.html',
    useShadowDom: false,
    publishAs: 'pr')
class ApplicationPullRequest {

  final Http _http;
  Map pullRequests;
  String _applicationId, _mergeFrom, notification, notificationType, splash;
  StateService _stateService;

  ApplicationPullRequest(this._http, this._stateService) {
    _loadData();
  }

  _loadData() {
    _applicationId = _stateService.applicationId.toLowerCase();
    _http.get('http://${Constants.getStashUrl()}/application/$_applicationId/pullrequests')
    .then((HttpResponse response) {
      pullRequests = response.data;
      print('pr found');
    })
    .catchError((e) {
      if (e.toString().contains('404')) {
        notification = 'application-pull-requests-not-found';
        notificationType = 'info';
      } else {
        notification = 'technical-error';
        notificationType = 'error';
      }
    });
  }



}
