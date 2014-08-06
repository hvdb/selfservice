part of self_service;
@Component(
    selector: 'application-details',
    templateUrl: '../lib/components/applications/application_details.html',
    cssUrl: '../web/css/bootstrap.min.css',
    publishAs: 'applicationDetails')
class ApplicationDetails {


  final Http _http;
  var application;

  ApplicationDetails(RouteProvider routeProvider, this._http) {
    var _applicationId = routeProvider.parameters['applicationId'];
    _loadData(_applicationId);

  }

  void _loadData(_applicationId) {

    _http.get('http://localhost:9090/application/'+_applicationId)
    .then((HttpResponse response) {

      application = response.data;

    })
    .catchError((e) {
      print(e);

    });


  }

}
