part of self_service;

@Component(
    selector: 'applications-list',
    templateUrl: '../lib/components/applications/applications_list.html',
    cssUrl: '../web/css/bootstrap.min.css',
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;

  Map apps = new Map();

  ApplicationsList(this._http) {
    _loadData();
  }

  void _loadData() {

    _http.get('http://localhost:9090/applications/')
    .then((HttpResponse response) {

      apps = response.data;

    })
    .catchError((e) {
      print(e);

    });


  }
}
