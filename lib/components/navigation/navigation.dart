import 'package:angular/angular.dart';
import 'package:spectingular_dart/services/authentication.dart';

@Component(
    selector: 'navigation',
    templateUrl: 'packages/self_service/components/navigation/navigation.html',
    useShadowDom: false,
    publishAs: 'navigation')
class Navigation {

  Router _router;
  AuthenticationService authService;


  Navigation(this._router, this.authService) {

  }


  clicked(String route) {

    _router.go(route ,{});
  }




}
