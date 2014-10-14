import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'application-pull-requests',
    templateUrl: 'packages/self_service/components/applications/application_pr.html',
    useShadowDom: false,
    publishAs: 'status')
class ApplicationPullRequest {

  final Http _http;
  var application;
  String _applicationId, _mergeFrom, notification, notificationType, splash;

  ApplicationPullRequest(this._http) {

  }




}
