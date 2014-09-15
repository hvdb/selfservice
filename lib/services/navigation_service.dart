import 'package:angular/angular.dart';
import 'package:spectingular_dart/components/navigation/navigation_block.dart';
import 'package:self_service/services/authentication.dart';
import 'package:self_service/services/routing_service.dart';

@Injectable()
class NavigationService  {
  Router _router;

  AuthenticationService _authService;
  RoutingService _routingConfig;
  NavigationService(this._authService, this._router, this._routingConfig){}


  NavigationBlock getConfig() {

      NavigationBlock navBlock = new NavigationBlock();

      Map<String, SpRouteCfg> routeConfig = _routingConfig.getViewsConfig();
      int userLevel = _routingConfig.getViewsConfig()['root'].neededUserLevel;


      //Determine the current route.
      SpRouteCfg config;
      String activePath;
      if (_router.activePath.isNotEmpty) {
        activePath = _router.activePath[0].name;
        config = routeConfig[activePath];

        navBlock.title = config.sectionName;
        navBlock.id = config.sectionName;
      }

      NavigationBlockParent parent = new NavigationBlockParent();
      List<NavigationBlockParent> parents = new List<NavigationBlockParent>();

      parent.title = activePath;
      parent.active = true;
      parents.add(parent);

      List<NavigationBlockItem> items = new List<NavigationBlockItem>();
      if (config.mount.isNotEmpty) {
        for (var key in config.mount.keys) {
          SpRouteCfg child = config.mount[key];

          items.add(new NavigationBlockItem(key,parent.title+'-'+key, '#'+config.path+child.path,false,child.neededUserLevel));
        }

      }

      parent.items = items;
      navBlock.parents = parents;
      return  navBlock;

  }
}
