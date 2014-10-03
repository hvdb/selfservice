
import 'package:highcharts4dart/highcharts.dart';
import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'application-status',
    templateUrl: 'packages/self_service/components/applications/application_status.html',
    useShadowDom: false,
    publishAs: 'status')
class ApplicationStatus {

  final Http _http;
  var application;
  String _applicationId, _mergeFrom, notification, notificationType, splash;

  ApplicationStatus(this._http) {
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
