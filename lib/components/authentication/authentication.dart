import 'package:angular/angular.dart';
import 'package:spectingular_dart/services/authentication.dart';
import '../constants.dart';


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
      notification = 'U bent uitgelogd.';
      _authService.logOut();
    }
  }

  login() {


    _http.post('http://${Constants.getStashUrl()}/login', {"username":username,"password": password}, withCredentials:true)
    .then((HttpResponse response) {

      _authService.loggedIn = true;
      _authService.loggedInUserLevel = 99;
      _authService.loggedInUser = username;

      notification = 'U bent ingelogd.';
      _router.go('root',{});
    })
    .catchError((e) {
      notification = 'Invalid credentials. or service exception';
    });


  }


}
