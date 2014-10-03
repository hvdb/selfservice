
import 'package:highcharts4dart/highcharts.dart';
import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'application-dependencies',
    templateUrl: 'packages/self_service/components/applications/application_dependencies.html',
    useShadowDom: false,
    publishAs: 'dependencies')
class ApplicationDependencies {

  final Http _http;
  var application;
  String _applicationId, _mergeFrom, notification, notificationType, splash;

  ApplicationDetails(RouteProvider routeProvider, this._http) {
    //TODO remove this.
    _applicationId ='gDemo';
    splash = 'dit';
    //_applicationId = routeProvider.parameters['applicationId'];
    _loadData();
  }


  mergeTo(String branchToMergeTo) {

    _determineFromBranch(branchToMergeTo);
    print('merge from: $_mergeFrom');
    print('to $branchToMergeTo' );

    notification = '<b>De brance $_mergeFrom wordt gemerged naar $branchToMergeTo, even geduld alstublieft. Alles gebeurd via pull requests zie stash.</b>';

    _http.post('http://${Constants.getStashUrl()}/application/$_applicationId/merge', {"from":_mergeFrom, "to":branchToMergeTo}).then((HttpResponse response) {

      notification = 'Success! Pull request state is: ${response.data["state"]}, See pull-request with id: ${response.data["id"]}';
      notificationType = 'success';
    }).catchError((HttpResponse response) {
      notificationType = 'error';
      notification = 'OEPS! Er is iets fout gegaan. Check Stash (pull-requests). Neem contact op en vermeld het volgende: <br/> $response';
    });


  }

  _determineFromBranch(String mergeTo) {
    switch (mergeTo) {
      case 'master':
        _mergeFrom = 'develop';
        break;
      case 'release-a':
        _mergeFrom = 'master';
        break;
      case 'release-prd':
        _mergeFrom = 'release-a';
        break;
    }
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


  var basicLineChart  = new HighChart()
  ..credits = (new Credits()
  ..enabled = false)
  ..chart = (new Chart()
  ..backgroundColor = 'rgba(0,0,0,0)')
  ..tooltip = (new Tooltip()..pointFormat = '{series.name}: <b>{point.percentage:.1f}%</b>')
  ..plotOptions = (new PlotOptions()..moreOptions = {
  'pie': {
  'allowPointSelect': true,
  'cursor': 'pointer',
  'startAngle' : '-90',
  'endAngle': '90',
  'dataLabels': {
  'enabled': true,
  'format': '<b>{point.name}</b>: {point.percentage:.1f} %',
  'style': {
  'color': 'black'
  }
  }
  }
  })
  ..series = [
  (new Series ()
  ..type = 'pie'
  ..name = 'Unit tests'
  ..moreOptions = {
    'innerSize' : '80%'
  }
  ..data = [
  (new Point()
  ..name = 'Unit tests'
  ..y = 88.9
    ..moreOptions = {
      'selected': true
  }),
  (new Point ()
  ..name = ''
  ..y = 10.4),

  ]
  )
  ];



}
