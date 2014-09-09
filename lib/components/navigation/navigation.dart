import 'package:angular/angular.dart';
@Component(
    selector: 'navigation',
    templateUrl: 'packages/self_service/components/navigation/navigation.html',
    useShadowDom: false,
    publishAs: 'navigation')
class Navigation {

  Router _router;

  Navigation(this._router) {
    print('bla ' +_router.activePath.toString());

  }


  clicked(String route) {
    print('bla ' +_router.activePath.toString());
    _router.go(route ,{});
  }




}
