import 'package:angular/angular.dart';
import 'package:self_service/services/authentication.dart';
@Component(
    selector: 'sp-authentication',
    templateUrl: 'packages/self_service/components/authentication/authentication.html',
    useShadowDom: false,
    publishAs: 'auth')
class Authentication {

  AuthenticationService _authService;
  Router _router;
  Authentication(this._authService, this._router) {}

  String username, password, notification;


  @NgTwoWay('logout')
  set logout(bool value) {
    if (value) {
      notification = 'U bent uitgelogd.';

      _authService.logOut();

    }
  }

  login() {
    if (_authService.logIn(username,password)) {
      notification = 'U bent ingelogd.';
      _router.go('root',{});
    } else {
      notification = 'Invalid credentials.';
    }

  }


}
