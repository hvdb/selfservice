
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
    _applicationId =_stateService.applicationId;
    _loadData();
  }

  void _loadData() {
    _http.get('http://${Constants.getStashUrl()}/application/$_applicationId')
    .then((HttpResponse response) {
      application = response.data;
    })
    .catchError((e) {
      notification = 'application-details-technical-error';
      notificationType = 'error';
    });

  }



  mergeTo(String branchToMergeTo) {

    _determineFromBranch(branchToMergeTo);
    print('merge from: $_mergeFrom');
    print('to $branchToMergeTo' );

    notification = '<b>De brance $_mergeFrom wordt gemerged naar $branchToMergeTo, even geduld alstublieft. Alles gebeurd via pull requests zie stash.</b>';
    notificationType = 'info';
    _http.post('http://${Constants.getStashUrl()}/application/$_applicationId/merge', {"from":_mergeFrom, "to":branchToMergeTo}).then((HttpResponse response) {

      notification = 'Success! Pull request state is: ${response.data["state"]}, See pull-request with id: ${response.data["id"]}';
      notificationType = 'success';
    }).catchError((HttpResponse response) {
      notificationType = 'problem_report';
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


}
