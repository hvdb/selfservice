library sp_authentication;
import 'package:angular/angular.dart';
import 'package:logging/logging.dart';


@Injectable()
class AuthenticationService {

  bool loggedIn = false;
  int loggedInUserLevel = -1;

  Logger _log = new Logger('RoutingService');

  bool isUserAllowed(int neededUserLevel) {

    if (neededUserLevel == -1) {
      _log.finest('user level is less then 0. no authentication is needed');
      return true;
    } else if (loggedIn) {
      _log.finest('User is logged in.');
      return _handleLoggedInClient(neededUserLevel);
    } else {
      _log.finest('User not loggedin. and authentication is needed. Userlevel $neededUserLevel');
      return false;
    }

  }

  bool logIn(String username, String password){
    if (username == 'user' && password == 'pass') {
      loggedIn = true;
      loggedInUserLevel = 99;
      return true;
    }
    return false;
  }


  void logOut() {
    loggedIn = false;
    loggedInUserLevel = 0;
  }

  bool _handleLoggedInClient(int neededUserLevel) {
    _log.finest('neededuserlevel test $neededUserLevel');

    if (loggedInUserLevel >= neededUserLevel) {
      return true;
    } else {
      return false;
    }
  }


}