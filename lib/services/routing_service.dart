import 'package:angular/angular.dart';
import 'dart:async';
import 'package:spectingular_dart/services/authentication.dart';
import 'package:spectingular_dart/services/routing_service.dart';
import 'package:logging/logging.dart';

@Injectable()
class RoutingService  {
  AuthenticationService _authentication;
  Router _router;

  RoutingService(this._authentication, this._router) {}

  Logger _log = new Logger('RoutingService');

  Map<String, SpRouteCfg> getViewsConfig() {

    return {
          'root': spRoute(path: '/home', view: 'views/home.html', defaultRoute: true, neededUserLevel:-1),
        'build-details': spRoute(path: '/build/details', mount: {
            'develop': spRoute(path: '/develop', view: 'views/builddetails/develop.html', neededUserLevel: -1),
            'test': spRoute(path: '/test', view: 'views/builddetails/test.html', neededUserLevel: -1),
            'acceptance': spRoute(path: '/acceptance', view: 'views/builddetails/acceptance.html', neededUserLevel: -1),
            'production': spRoute(path: '/production', view: 'views/builddetails/production.html', neededUserLevel: -1),
            'app': spRoute(path: '/application', view: 'views/builddetails/application.html', neededUserLevel: -1),

    }, neededUserLevel: -1, sectionName: 'build-details-administration')

    };
  }


  SpRouteCfg spRoute({String path, String view, String viewHtml,
                           Map<String, NgRouteCfg> mount, modules(), bool defaultRoute: false,
                           RoutePreEnterEventHandler preEnter, RouteEnterEventHandler enter,
                           RoutePreLeaveEventHandler preLeave, RouteLeaveEventHandler leave,
                           dontLeaveOnParamChanges: false, int neededUserLevel: 0, String sectionName}) {


    preEnter = RoutePreEnterEventHandlerWrapper(preEnter, neededUserLevel);
    return new SpRouteCfg(path: path, view: view, viewHtml: viewHtml, mount: mount, modules: modules, defaultRoute: defaultRoute, preEnter: preEnter, preLeave: preLeave, enter: enter, leave: leave, dontLeaveOnParamChanges: dontLeaveOnParamChanges, neededUserLevel: neededUserLevel, sectionName:sectionName);
  }

  Function RoutePreEnterEventHandlerWrapper(RoutePreEnterEventHandler preEnter, int neededUserLevel) {

    void CustomRoutePreEnterEventHandler(RoutePreEnterEvent event) {
     // bool allowed = _authentication.isUserAllowed(neededUserLevel);
      bool allowed = true;
      event.allowEnter(new Future<bool>.value(allowed));

//      if(!allowed) {
//        if (_authentication.loggedIn) {
//          _log.fine('User logged in but not allowed. redirect to not allowed');
//          _router.go('notallowed',{});
//        } else {
//          _log.fine('User not logged-in, redirect to login page.');
//          _router.go('login',{});
//        }
//      }

    }

    return CustomRoutePreEnterEventHandler;
  }


}
