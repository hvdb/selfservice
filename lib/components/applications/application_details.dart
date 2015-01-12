
import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";
import 'dart:async';


import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'application-details',
    templateUrl: 'packages/self_service/components/applications/application_details.html',
    useShadowDom: false,
    publishAs: 'details')
class ApplicationDetails {

  final Http _http;
  JsonObject application;
  StateService _stateService;
  String _applicationId, _mergeFrom, notification, notificationType, splash, dependencyName, dependencyUrl, dependencyResolution, dependencyEnvironment;
  String dependencyEnv = "0";

  List dependencyEnvironments = new List();

  List dependencyList = new List();
  bool showAll = false;
  List<Map> platform = <Map>[
      {'name': 'restricted', 'selected': false},
      {'name': 'channels', 'selected': false},
      {'name': 'open', 'selected': false}
  ];

  @NgTwoWay('showAll')
  set showAllBool(bool boolean) {
    showAll = boolean;
  }


  ApplicationDetails(this._http, this._stateService) {
    _applicationId =_stateService.applicationId;

    _loadData();

    dependencyEnvironments.add("develop");
    dependencyEnvironments.add("test");
    dependencyEnvironments.add("acceptatie");
    dependencyEnvironments.add("productie");

  }


  removeDependency(Object dependency) {
    application["nonStandardDependencies"][int.parse(dependencyEnv)]["dependencies"].remove(dependency);
    loadDependencyList();
  }


  loadDependencyList() {
    dependencyList = new List();
    Map dependencies = application["nonStandardDependencies"][int.parse(dependencyEnv)]["dependencies"];
    for (var key in dependencies.keys) {
      dependencyList.add({"name":"$key", "url":dependencies['$key'], "resolution" : dependencyResolution});
    }


  }


  addDependency() {
    application["nonStandardDependencies"][int.parse(dependencyEnv)]["dependencies"][dependencyName] =  dependencyUrl;
    application["nonStandardDependencies"][int.parse(dependencyEnv)]["resolutions"][dependencyName] =  dependencyResolution;

    loadDependencyList();
  }

  changedEnvironment() {
    new Future(() {

      loadDependencyList();
    });
    //load different dependencies.

  }


  updateRepo() {
    print('update repo called.');

    application["targetPlatforms"] = selectedPlatforms();

    _http.put('http://${Constants.getJavaBackendUrl()}/applications', application).then((HttpResponse response) {

      notification = 'update-application-notification-module-geupdate';
      notificationType = 'success';

    }).catchError((e) {
      notification = 'update-application-notification-module-error';
      notificationType = 'error';
    });


  }

  void _loadData() {
    _http.get('http://${Constants.getJavaBackendUrl()}/applications/$_applicationId')
    .then((HttpResponse response) {
      application = response.data;
      print('data $application');
      loadDependencyList();
      setSelectedTargetPlatforms();
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
    _http.post('http://${Constants.getDartBackedUrl()}/application/${_applicationId.toLowerCase()}/merge', {"from":_mergeFrom, "to":branchToMergeTo}).then((HttpResponse response) {

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

  setSelectedTargetPlatforms() {
    List currectPlatforms = application["targetPlatforms"];

    for (final current in currectPlatforms) {
      print('current $current');
      for (final Map target in platform) {
        if (current == target["name"]) {
          print('same ');
          target["selected"] = true;
        }
      }
    }

  }

  List<String> selectedPlatforms() {
    List<String> toReturn = new List<String>();
    for (final item in platform) {
      if (item["selected"]) {
        toReturn.add(item["name"]);
      }
    }
    return toReturn;
  }

}
