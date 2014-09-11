library selfservice_authentication;
import 'package:angular/angular.dart';

@Injectable()
class AuthenticationService {

  bool loggedIn = false;
  int loggedInUserLevel = -1;

  bool isUserAllowed(int neededUserLevel) {

    if (neededUserLevel == -1) {
      print('user level is less then 0. no authentication is needed');
      return true;
    } else if (loggedIn) {
      print('User is logged in.');
      return _handleLoggedInClient(neededUserLevel);
    } else {
      print('User not loggedin. and authentication is needed. Userlevel $neededUserLevel');
      return false;
    }

  }

  bool logIn(String username, String password){
    if (username == 'henk' && password == 'henk') {
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
    print('neededuserlevel test $neededUserLevel');

    if (loggedInUserLevel >= neededUserLevel) {
      return true;
    } else {
      return false;
    }
  }


}