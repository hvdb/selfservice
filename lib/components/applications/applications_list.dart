import 'package:angular/angular.dart';
import '../constants.dart';

@Component(
    selector: 'applications-list',
    templateUrl: 'packages/self_service/components/applications/applications_list.html',
    useShadowDom: false,
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;

  Map apps = new Map();


  ApplicationsList(this._http) {


    _loadData();

  }


  void _loadData() {

    _http.get('http://${Constants.getJavaBackendUrl()}/applications')
    .then((HttpResponse response) {
      apps = response.data;

    })
    .catchError((e) {

    });

  }
}
