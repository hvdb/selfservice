import 'package:angular/angular.dart';
import '../constants.dart';

@Component(
    selector: 'applications-list',
    templateUrl: 'packages/self_service/components/applications/applications_list.html',
    useShadowDom: false,
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;
  String _nextQuery = 'limit=10&start=20';
  String _previousQuery, _api_url;

  int _nextPageStart;
  int _limit = 10;

  Map apps = new Map();
  bool disableNext = false;
  bool disablePrevious = true;


  ApplicationsList(this._http) {


    _loadData('limit=$_limit');

  }

  getNextPage() {
      _loadData(_nextQuery);
  }

  getPreviousPage() {
      _loadData(_previousQuery);
  }






  //TODO should be a service.

  void _loadData(query) {



    _api_url = Constants.getStashUrl();


    _http.get('http://$_api_url/applications?='+query)
    .then((HttpResponse response) {
      print('list');
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
          _previousQuery = 'limit=$_limit&start=' + (_nextPageStart - _limit*2).toString();
        }
        _nextQuery = 'limit=$_limit&start=' + _nextPageStart.toString();
      } else {
        if (_nextPageStart != null) {
          _previousQuery = 'limit=$_limit&start=' + (_nextPageStart - _limit).toString();;
        } else {
          disablePrevious = true;
        }

        _nextQuery = '';
      }


    })
    .catchError((e) {

    });

  }
}
