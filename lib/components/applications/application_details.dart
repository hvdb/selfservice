

import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'application-details',
    templateUrl: 'packages/self_service/components/applications/application_details.html',
    useShadowDom: false,
    publishAs: 'applicationDetails')
class ApplicationDetails {

  final Http _http;
  var application;
  String _applicationId, _mergeFrom, notification, notificationType;

  ApplicationDetails(RouteProvider routeProvider, this._http) {
    _applicationId = routeProvider.parameters['applicationId'];
    _loadData();
  }


  mergeTo(String branchToMergeTo) {

    _determineFromBranch(branchToMergeTo);
    print('merge from: $_mergeFrom');
    print('to $branchToMergeTo' );

    notification = '<b>De brance $_mergeFrom wordt gemerged naar $branchToMergeTo, even geduld alstublieft. Alles gebeurd via pull requests zie stash.</b>';

    _http.post('http://${Constants.getStashUrl()}/application/$_applicationId/merge', {"from":_mergeFrom, "to":branchToMergeTo}).then((HttpResponse response) {

      print('links ${response.data["links"]}' );
      print('self ${response.data["links"]["self"]}');


      String prLink = response.data["links"]["self"][0]["href"];
print(' link $prLink');
      notification = 'Success! Pull request state is: ${response.data["state"]}, Pull request link : <a href="${response.data["links"]["self"][0]["href"]}">pull request ${response.data["id"]}</a>';
      notificationType = 'success';
      print('merged succesfull ' );
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

}
