
import 'package:highcharts4dart/highcharts.dart';
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
    //TODO remove this.
    _applicationId ='gDemo';
    splash = 'dit';
    //_applicationId = routeProvider.parameters['applicationId'];
    _loadData();
  }


  void _loadData() {
    _http.get('http://${Constants.getStashUrl()}/application/$_applicationId')
    .then((HttpResponse response) {
      application = response.data;
    })
    .catchError((e) {
      print(e);

    });

  }



}
