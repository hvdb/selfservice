import 'package:angular/angular.dart';
import '../constants.dart';

@Component(
    selector: 'teams-list',
    templateUrl: 'packages/self_service/components/teams/teams_list.html',
    useShadowDom: false,
    publishAs: 'teams')
class TeamsList {

  final Http _http;

  Map teams = new Map();


  TeamsList(this._http) {
    _loadData();
  }


  void _loadData() {

    _http.get('http://${Constants.getJavaBackendUrl()}/contactinformation')
    .then((HttpResponse response) {
      teams = response.data;
    })
    .catchError((e) {

    });

  }
}
