import 'package:angular/angular.dart';
import 'package:self_service/services/routing_service.dart';


@Injectable()
class SelfServiceRouterInitializer {

  RoutingService _routingService;

  SelfServiceRouterInitializer(this._routingService) {}


  void call(Router router, RouteViewFactory views) {
    views.configure(_routingService.getViewsConfig());
    }


}