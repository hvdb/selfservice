import 'package:angular/angular.dart';


@Component(
    selector: 'application-details',
    templateUrl: 'packages/self_service/components/applications/application_details.html',
    useShadowDom: false,
    publishAs: 'applicationDetails')
class ApplicationDetails {


  final Http _http;
  var application;

  ApplicationDetails(RouteProvider routeProvider, this._http) {
    var _applicationId = routeProvider.parameters['applicationId'];
    _loadData(_applicationId);

  }

  void _loadData(_applicationId) {

    _http.get('http://192.168.59.103:8888/application/'+_applicationId)
    .then((HttpResponse response) {

      application = response.data;

    })
    .catchError((e) {
      print(e);

    });


  }

}
