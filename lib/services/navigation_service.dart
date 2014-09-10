import 'package:angular/angular.dart';
import 'package:self_service/components/navigation/navigation_block.dart';
import 'package:self_service/services/authentication.dart';

@Injectable()
class NavigationService  {

  AuthenticationService _authService;

  NavigationService(this._authService){}


  NavigationBlock getConfig() {

    NavigationBlock navBlock = new NavigationBlock();

      navBlock.title = 'Administration';
      navBlock.id = 'administration';

      NavigationBlockParent parent = new NavigationBlockParent();
      List<NavigationBlockParent> parents = new List<NavigationBlockParent>();

      parent.title = 'Application';
      parent.active = true;

      parents.add(parent);

      List<NavigationBlockItem> items = new List<NavigationBlockItem>();

      items.add(new NavigationBlockItem('list','List of Applications','#/applications/list',false,1));
    items.add(new NavigationBlockItem('add','Add a new applications','#/applications/add',false,1));


      parent.items = items;
      navBlock.parents = parents;
      return  navBlock;

  }
}
