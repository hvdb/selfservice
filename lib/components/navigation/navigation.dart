import 'package:angular/angular.dart';
@Component(
    selector: 'navigation',
    templateUrl: 'packages/self_service/components/navigation/navigation.html',
    useShadowDom: false,
    publishAs: 'navigation')
class Navigation {

  Router _router;

  Navigation(this._router) {

  }


  clicked(String route) {

    _router.go(route ,{});
  }




}
