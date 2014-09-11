import 'package:angular/angular.dart';

class NavigationService {
  NavigationBlock getConfig(){}
}


class NavigationBlock {
  String id,title;
  List<NavigationBlockParent> parents;
}

class NavigationBlockParent {
  String title;
  bool active;
  List<NavigationBlockItem> items;
}

class NavigationBlockItem {
  String id;
  String title;
  String path;
  bool active;
  int neededUserLevel;
  NavigationBlockItem(this.id,this.title,this.path, this.active, this.neededUserLevel){}
}


@Component(
    selector: 'navigation-block',
    templateUrl: 'packages/self_service/components/navigation/navigation_block.html',
    useShadowDom: false,
    publishAs: 'navBlock')
class NavigationBlockComponent {

  NavigationService _navigationConfig;
  NavigationBlock config;

  Router _router;



  NavigationBlockComponent(this._navigationConfig, this._router) {
    config = _navigationConfig.getConfig();
  }


}


