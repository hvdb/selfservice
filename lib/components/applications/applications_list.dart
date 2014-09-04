import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'applications-list',
    templateUrl: 'packages/self_service/components/applications/applications_list.html',
    useShadowDom: false,
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;
  String _nextQuery = 'limit=10&start=20';
  String _previousQuery;

  int _nextPageStart;
  int _limit = 10;

  Map apps = new Map();
  bool disableNext = false;
  bool disablePrevious = true;

  ApplicationsList(this._http) {
    _loadData('limit='+_limit.toString());
  }

  getNextPage() {
      _loadData(_nextQuery);
  }

  getPreviousPage() {
      _loadData(_previousQuery);
  }

  void _loadData(query) {

    _http.get('http://$api_url/applications?'+query)
    .then((HttpResponse response) {

      apps = response.data["applications"];

      if (response.data["nextPageStart"] != null) {
        _nextPageStart = response.data["nextPageStart"];
        disableNext = false;
      } else {
        disableNext = true;
      }

      if (!disableNext) {
        if (_nextPageStart - _limit == 0) {
          disablePrevious = true;
        } else {
          disablePrevious = false;
          _previousQuery = 'limit=' + _limit.toString() + '&start=' + (_nextPageStart - _limit*2).toString();
        }
        _nextQuery = 'limit=' + _limit.toString() + '&start=' + _nextPageStart.toString();
      } else {
        _previousQuery = 'limit=' + _limit.toString() + '&start=' + (_nextPageStart - _limit).toString();;
        _nextQuery = '';
      }


    })
    .catchError((e) {
      print(e);

    });

  }
}
