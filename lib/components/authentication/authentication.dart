import 'package:angular/angular.dart';
import 'package:self_service/services/authentication.dart';
@Component(
    selector: 'sp-authentication',
    templateUrl: 'packages/self_service/components/authentication/authentication.html',
    useShadowDom: false,
    publishAs: 'auth')
class Authentication {

  AuthenticationService _authService;

  Authentication(this._authService) {}

  String username, password, notification, notificationType;


  @NgTwoWay('logout')
  set logout(bool value) {
    if (value) {
      notification = 'U bent uitgelogd.';
      notificationType ='info';
      _authService.loggedIn = false;
      _authService.loggedInUserLevel = 0;
    }
  }




  login() {
    if (username == 'henk' && password == 'henk') {
      _authService.loggedIn = true;
      _authService.loggedInUserLevel = 99;
      notification = 'U bent ingelogd.';
      notificationType = 'info';
    } else {
      //Fout.
    }

  }


}
