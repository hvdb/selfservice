
import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";

@Component(
    selector: 'add-team',
    templateUrl: 'packages/self_service/components/teams/add_team.html',
    useShadowDom: false,
    publishAs: 'add')
class AddTeam {

  final Http _http;
  String notification, notificationType, teamId, teamName;



  AddTeam(this._http) {


  }

  saveTeam() {
    JsonObject team = new JsonObject();
    team.teamId = teamId;
    team.teamName = teamName;
    _http.post('http://${Constants.getJavaBackendUrl()}/contactinformation', team)
    .then((HttpResponse response) {
      notification = 'save-team-notification-ok';
      team = new JsonObject();
    })
    .catchError((e) {
      notification = 'save-team-notification-error';
      notificationType = 'error';
    });
  }

}
