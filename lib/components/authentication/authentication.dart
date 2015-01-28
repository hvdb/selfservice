import 'package:angular/angular.dart';
import 'package:spectingular_dart/services/authentication.dart';
import 'dart:html';
import '../constants.dart';
import 'dart:convert';
import "package:json_object/json_object.dart";
import 'package:dart_jwt/dart_jwt.dart';



@Component(
    selector: 'sp-authentication',
    templateUrl: 'packages/self_service/components/authentication/authentication.html',
    useShadowDom: false,
    publishAs: 'auth')
class Authentication {

  AuthenticationService _authService;
  Router _router;
  Http _http;

  Authentication(this._authService, this._router, this._http) {}

  String username, password, notification;


  @NgTwoWay('logout')
  set logout(bool value) {
    if (value) {
      notification = 'authentication-notification-logout';
      _authService.logOut();
    }
  }

  login() {

    if (username.length != 6 || password != 'geheim') {
      notification = 'authentication-notification-login-not-correct';
    } else {

      //Get user information
      _http.get('http://${Constants.getJavaBackendUrl()}/teammembers/$username')
      .then((HttpResponse response) {

        JsonObject userInformation = response.data;
        _authService.loggedIn = true;
        _authService.teamId = userInformation["teamId"];
//          if (_authService.teamId == 'Fruitloops') {
//            _authService.loggedInUserLevel = 90;
//          } else {
//            _authService.loggedInUserLevel = userInformation["role"];
//          }
        _authService.loggedInUserLevel = 90;

        _authService.loggedInUser = userInformation["corpKey"];
        _authService.loggedInUserFullName = userInformation["name"];
        notification = 'authentication-notification-loggedin';
        _router.go('root', {
        });
      });


    //check jwt if that is still correct.

//    _http.post('http://${Constants.getDartBackedUrl()}/login', {"username":username,"password": password})
//    .then((HttpResponse response) {
//      String jwt = response.headers('authorization');
//      if (jwt != null) {
//        Storage localStorage = window.localStorage;
//        localStorage['jwt'] = jwt;
//
//        JsonObject userInformation;
//
//        }).catchError((e) {
//          notification = 'User not found.';
//        });
//      } else {
//        notification = 'Password incorrect';
//      }
//    })
//    .catchError((e) {
//      notification = 'Invalid credentials. or service exception';
//    });

    }
  }


}
