
import 'package:angular/angular.dart';
import '../constants.dart';
import "package:json_object/json_object.dart";
import 'dart:async';
import 'package:spectingular_dart/services/authentication.dart';



import 'package:self_service/services/state_service.dart';

@Component(
    selector: 'team-details',
    templateUrl: 'packages/self_service/components/teams/team_details.html',
    useShadowDom: false,
    publishAs: 'details')
class TeamDetails {

  final Http _http;
  List members;
  AuthenticationService _authenticationService;
  StateService _stateService;
  String _teamId, notification, notificationType,  name, emailAddress, corpKey, teamName;
  String role = "1";


  TeamDetails(RouteProvider routeProvider, this._http,this._stateService, this._authenticationService) {
    String teamId = routeProvider.parameters['teamId'];

    if (teamId != null && teamId != ':teamId') {
      _teamId = teamId;
      _stateService.teamId = teamId;
    } else {
      _teamId = _stateService.teamId;
    }

    if (_authenticationService.loggedInUserLevel < 90 && _stateService.teamId != _teamId) {
        notification = 'not-allowed';
        notificationType = 'error';
    }

    _loadData();

  }


  removeMember(String id) {
    _http.delete('http://${Constants.getJavaBackendUrl()}/teammembers/$id').then((HttpResponse response) {
      notification = 'delete-member-notification-success';
      notificationType = 'success';
      _loadData();
    }).catchError((e) {
      notification = 'delete-member-notification-error';
      notificationType = 'error';
    });

  }

  addMember() {
    JsonObject teamMember = new JsonObject();

    teamMember.name = name;
    teamMember.emailAddress = emailAddress;
    teamMember.corpKey = corpKey;
    teamMember.role = role;
    teamMember.teamId = _teamId;

    print('add $teamMember');

    _http.post('http://${Constants.getJavaBackendUrl()}/teammembers', teamMember).then((HttpResponse response) {
      _loadData();
    }).catchError((e) {
      notification = 'update-team-notification-error';
      notificationType = 'error';
    });

  }




  void _loadData() {
    _http.get('http://${Constants.getJavaBackendUrl()}/teammembers/team/$_teamId')
    .then((HttpResponse response) {
      members = response.data;
      _getTeamName();
    })
    .catchError((e) {
      notification = 'get-team-notification-error';
      notificationType = 'error';
    });
  }



  void _getTeamName() {
    _http.get('http://${Constants.getJavaBackendUrl()}/contactinformation/$_teamId')
    .then((HttpResponse response) {
      teamName = response.data["teamName"];

    })
    .catchError((e) {
      notification = 'get-team-notification-error';
      notificationType = 'error';
    });
  }

}
