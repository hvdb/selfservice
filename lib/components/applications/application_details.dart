
import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";
import 'dart:async';
import 'dart:convert';


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
  String _applicationId, _mergeFrom, notification, notificationType, splash, dependencyName, dependencyUrl, dependencyResolution, dependencyEnvironment, teamName;
  String dependencyEnv = "develop";

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


  removeDependency(String id) {

    _http.delete('http://${Constants.getJavaBackendUrl()}/applications/$_applicationId/dependencies/$id').then((HttpResponse response) {
      notification = 'update-application-notification-module-geupdate';
      notificationType = 'success';

    }).catchError((e) {
      notification = 'update-application-notification-module-error';
      notificationType = 'error';
    });

    _loadDependencyList();
  }


  _loadDependencyList() {
    dependencyList = new List();

    _http.get('http://${Constants.getJavaBackendUrl()}/applications/$_applicationId/dependencies/$dependencyEnv')
    .then((HttpResponse response) {
      dependencyList = response.data;
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });


  }


  addDependency() {

    JsonObject dependency = new JsonObject();
    dependency.name = dependencyName;
    dependency.url = dependencyUrl;
    dependency.resolution = dependencyUrl;
    dependency.environment = dependencyEnv;
    dependency.applicationId = _applicationId;
    dependency.dev = false;

    _http.post('http://${Constants.getJavaBackendUrl()}/applications/$_applicationId/dependencies', dependency).then((HttpResponse response) {
      notification = 'update-application-notification-module-geupdate';
      notificationType = 'success';

    }).catchError((e) {
      notification = 'update-application-notification-module-error';
      notificationType = 'error';
    });


    _loadDependencyList();
  }

  changedEnvironment() {
    new Future(() {

      _loadDependencyList();
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
      _loadDependencyList();
      setSelectedTargetPlatforms();
      _getTeamName();
    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }


  void _getTeamName() {
    _http.get('http://${Constants.getJavaBackendUrl()}/contactinformation/${application["teamId"]}')
    .then((HttpResponse response) {
      teamName = response.data["teamName"];

    })
    .catchError((e) {
      notification = 'technical-error';
      notificationType = 'error';
    });
  }


  //OLD! need to fix.


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
      for (final Map target in platform) {
        if (current == target["name"]) {
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
