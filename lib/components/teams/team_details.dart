
import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";
import 'dart:async';


import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'team-details',
    templateUrl: 'packages/self_service/components/teams/team_details.html',
    useShadowDom: false,
    publishAs: 'details')
class TeamDetails {

  final Http _http;
  JsonObject team;
  StateService _stateService;
  String _teamId, notification, notificationType,  name, emailAddress, corpKey;
  String role = "1";


  TeamDetails(RouteProvider routeProvider, this._http,this._stateService) {
    String teamId = routeProvider.parameters['teamId'];

    if (teamId != null && teamId != ':teamId') {
      _teamId = teamId;
      _stateService.teamId = teamId;
    } else {
      _teamId = _stateService.teamId;
    }

    _loadData();


  }


  removeMember(String index) {

//    _http.delete('http://${Constants.getJavaBackendUrl()}/teamMembers', team).then((HttpResponse response) {
//      notification = 'update-team-notification-success';
//      notificationType = 'success';
//
//    }).catchError((e) {
//      notification = 'update-team-notification-error';
//      notificationType = 'error';
//    });


    //Remove from database. Fetch data again.
    _loadData();
  }

  addMember() {
    JsonObject teamMember = new JsonObject();

    teamMember.name = name;
    teamMember.emailAddress = emailAddress;
    teamMember.corpKey = corpKey;
    teamMember.role = role;

    if (team["teamMembers"] == null) {
      team["teamMembers"] = new List();
    }
    //TODO save to database.
    _http.put('http://${Constants.getJavaBackendUrl()}/contactinformation', team).then((HttpResponse response) {
      teamMember = response.data;
    }).catchError((e) {
      notification = 'update-team-notification-error';
      notificationType = 'error';
    });



    team["teamMembers"].add(teamMember);
    //fetch data again
    _loadData();

  }


  updateTeam() {

    _http.put('http://${Constants.getJavaBackendUrl()}/contactinformation', team).then((HttpResponse response) {
      notification = 'update-team-notification-success';
      notificationType = 'success';

    }).catchError((e) {
      notification = 'update-team-notification-error';
      notificationType = 'error';
    });


  }

  void _loadData() {
    _http.get('http://${Constants.getJavaBackendUrl()}/contactinformation/$_teamId')
    .then((HttpResponse response) {
      team = response.data;
      print("team $team ");

    })
    .catchError((e) {
      notification = 'application-details-technical-error';
      notificationType = 'error';
    });
  }


}
