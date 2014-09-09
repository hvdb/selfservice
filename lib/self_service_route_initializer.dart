import 'package:angular/angular.dart';
import 'package:self_service/services/authentication.dart';
import 'dart:async';


@Injectable()
class SelfServiceRouterInitializer {

  AuthenticationService _authentication;

  Router _router;

  SelfServiceRouterInitializer(this._authentication) {}

  void call(Router router, RouteViewFactory views) {
    _router = router;
    views.configure({
        'root': customNgRoute(path: '/home', view: 'views/home.html', defaultRoute: true, neededUserLevel:-1),
        'notallowed': customNgRoute(path: '/notallowed', view: 'views/security/notallowed.html', neededUserLevel:-1),
        'login': customNgRoute(path: '/login', view: 'views/security/login.html', neededUserLevel:-1),
        'logout': customNgRoute(path: '/logout', view: 'views/security/logout.html', neededUserLevel:-1),
        'applications-list': customNgRoute(path: '/applications/list', view: 'views/applications/index.html', neededUserLevel: 1),
        'applications-add': customNgRoute(path: '/applications/add', view: 'views/applications/new.html', neededUserLevel: 2),
        'application': customNgRoute(path: '/application/:applicationId', mount: {
            'view': customNgRoute(path: '/view', view: 'views/applications/view.html'),
            'edit': customNgRoute(path: '/edit', view: 'views/applications/edit.html')
        })
    });
  }

  NgRouteCfg customNgRoute({String path, String view, String viewHtml,
                           Map<String, NgRouteCfg> mount, modules(), bool defaultRoute: false,
                           RoutePreEnterEventHandler preEnter, RouteEnterEventHandler enter,
                           RoutePreLeaveEventHandler preLeave, RouteLeaveEventHandler leave,
                           dontLeaveOnParamChanges: false, int neededUserLevel: 0}) {

    preEnter = RoutePreEnterEventHandlerWrapper(preEnter, neededUserLevel);
    return new NgRouteCfg(path: path, view: view, viewHtml: viewHtml, mount: mount, modules: modules, defaultRoute: defaultRoute, preEnter: preEnter, preLeave: preLeave, enter: enter, leave: leave, dontLeaveOnParamChanges: dontLeaveOnParamChanges);
  }

  Function RoutePreEnterEventHandlerWrapper(RoutePreEnterEventHandler preEnter, int neededUserLevel) {

    void CustomRoutePreEnterEventHandler(RoutePreEnterEvent event) {
      bool allowed = _authentication.isUserAllowed(neededUserLevel);

      event.allowEnter(new Future<bool>.value(allowed));
      print('allowed $allowed');
      print('route ' +event.route.toString());

      if(!allowed) {
        print('router go');
        if (_authentication.loggedIn) {
          _router.go('notallowed',{});
        } else {
          _router.go('login',{});
        }


      }
    }

    return CustomRoutePreEnterEventHandler;
  }
}