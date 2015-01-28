import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";
import 'package:self_service/services/state_service.dart';


@Component(
    selector: 'application',
    templateUrl: 'packages/self_service/components/applications/application.html',
    useShadowDom: false,
    publishAs: 'applications')
class Applications {

  Router _router;
  final Http _http;
  StateService _stateService;

  String applicationName, teamId, applicationDescription, repoAdmin, notification, notificationType, api_url;

  List teams;

  List<Map> platform = <Map>[
      {'name': 'restricted', 'selected': true},
      {'name': 'channels', 'selected': false},
      {'name': 'open', 'selected': false}
  ];

  bool added, loading, error = false;

  String validationPattern = "^[p|z|o|g][A-Z][a-zA-Z]*\$";
  Applications(this._http, this._router, this._stateService) {
    fetchTeams();
    selectedPlatforms();
  }


  fetchTeams() {
    _http.get('http://${Constants.getJavaBackendUrl()}/contactinformation').then((HttpResponse response) {
      teams = response.data;
    }).catchError((e) {
      print('error $e');
    });

  }

  createNewRepo() {

    api_url = Constants.getDartBackedUrl();
    notification = 'new-application-notification-module-wordt-toegevoegd';
    notificationType = 'info';

    JsonObject mod = new JsonObject();
    mod.applicationId = applicationName;
    mod.applicationDescription = applicationDescription;

    mod.branchConfiguration = createBranchConfig();
    mod.targetPlatforms = selectedPlatforms();

    mod.teamId = teamId;


    _http.post('http://$api_url/applications/', {"name":applicationName, "repoAdmin":repoAdmin}).then((HttpResponse response) {

      //If added to stash we also add it to selfservice database.


          //First create the git repo. then get the url and add it.
          mod.gitUrl = "ssh://bla.git";


          _http.post('http://${Constants.getJavaBackendUrl()}/applications', mod).then((HttpResponse response) {

            notification = 'new-application-notification-module-is-toegevoegd';
            notificationType = 'success';

          }).catchError((e) {
            notification = 'new-application-notification-module-error';
            notificationType = 'error';
          });



        }).catchError((e) {
      if (e.toString().contains('409')) {
        notification = 'new-application-notification-module-bestaat';
      } else if(e.toString().contains('417')) {
        notification = 'new-application-notification-module-repoadmin-bestaat-niet';
      } else {
        notification = 'new-application-notification-module-error';
      }

      notificationType = 'error';
    });



  }

  JsonObject createBranchConfig() {
    JsonObject config = new JsonObject();

    config.productie = "release-prd";
    config.acceptatie = "release-a";
    config.test = "master";
    config.develop = "develop";

    return config;
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
