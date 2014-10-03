
import 'package:highcharts4dart/highcharts.dart';
import 'package:angular/angular.dart';
import 'constants.dart';
import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'application-details',
    templateUrl: 'packages/self_service/components/applications/application_details.html',
    useShadowDom: false,
    publishAs: 'details')
class ApplicationDetails {

  final Http _http;
  var application;
  StateService _stateService;
  String _applicationId, _mergeFrom, notification, notificationType, splash;

  ApplicationDetails(this._http, this._stateService) {
    //TODO remove this.
    _applicationId =_stateService.applicationId;
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
