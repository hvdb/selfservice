import 'package:angular/angular.dart';
import '../constants.dart';
import 'package:spectingular_dart/services/authentication.dart';


@Component(
    selector: 'applications-list',
    templateUrl: 'packages/self_service/components/applications/applications_list.html',
    useShadowDom: false,
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;

  Map apps = new Map();
  AuthenticationService _authService;


  ApplicationsList(this._http, this._authService) {
    _loadData();
  }


  void _loadData() {
    String extraUrl ='';
    if (_authService.loggedInUserLevel != 90) {
      extraUrl = 'teams/${_authService.teamId}';
    }

    _http.get('http://${Constants.getJavaBackendUrl()}/applications/$extraUrl')
    .then((HttpResponse response) {
      apps = response.data;
    })
    .catchError((e) {

    });

  }
}
