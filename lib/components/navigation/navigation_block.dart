import 'package:angular/angular.dart';
import 'package:self_service/services/authentication.dart';

class NavigationBlockModule extends Module {

  NavigationBlockModule() {
    bind(NavigationBlockItem);
    bind(NavigationBlock);
    bind(NavigationBlockParent);
    bind(NavigationBlockComponent);
  }
}

class NavigationBlock {
  List<NavigationBlockParent> parents;
}

class NavigationBlockParent {
  String title;
  bool active;
  List<NavigationBlockItem> items;
}

class NavigationBlockItem {
  String id;
  String path;
  bool active;
  int neededUserLevel;
}

@Component(
    selector: 'navigation-block',
    templateUrl: 'packages/self_service/components/navigation/navigation_block.html',
    useShadowDom: false,
    publishAs: 'navBlock')
class NavigationBlockComponent {

  @NgOneWay("id")
  String id;
  @NgOneWay("title")
  String title;

  AuthenticationService _authService;
  bool show = true;

  NavigationBlockComponent(this._authService) {
    _constructNavigationBlock();
  }

  NavigationBlock navBlock = new NavigationBlock();


  NavigationBlock config;


  bool _userAllowed(int userLevel) {
    return _authService.isUserAllowed(userLevel);
  }

  NavigationBlock _constructNavigationBlock() {
    NavigationBlock navBlock = new NavigationBlock();

    NavigationBlockParent parent = new NavigationBlockParent();
    List<NavigationBlockParent> parents = new List<NavigationBlockParent>();

    parent.title = 'title';
    parent.active = true;

    parents.add(parent);


    List<NavigationBlockItem> items = new List<NavigationBlockItem>();

    NavigationBlockItem item = new NavigationBlockItem();
    item.active = true;
    item.neededUserLevel = 1;
    item.path = '/bla';

    items.add(item);
    parent.items = items;

    navBlock.parents = parents;

    config = navBlock;

  }


}


