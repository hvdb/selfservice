import 'package:angular/angular.dart';
import 'dart:async';
import 'package:self_service/services/authentication.dart';

@Injectable()
class RoutingService {

  AuthenticationService _authentication;
  Router _router;
  RoutingService(this._authentication, this._router) {}

  Map<String, SpRouteCfg> getViewsConfig() {

    return {
          'root': spRoute(path: '/home', view: 'views/home.html', defaultRoute: true, neededUserLevel:-1),
      'notallowed': spRoute(path: '/notallowed', view: 'views/security/notallowed.html', neededUserLevel:-1),
      'login': spRoute(path: '/login', view: 'views/security/login.html', neededUserLevel:-1),
      'logout': spRoute(path: '/logout', view: 'views/security/logout.html', neededUserLevel:-1),
      'applications': spRoute(path: '/applications', mount: {
          'list': spRoute(path: '/list', view: 'views/applications/index.html', neededUserLevel: 1),
          'add': spRoute(path: '/add', view: 'views/applications/new.html', neededUserLevel: 2)
       }, neededUserLevel: 1, sectionName: 'administration'),
      'application': spRoute(path: '/application/:applicationId', mount: {
          'view': spRoute(path: '/view', view: 'views/applications/view.html'),
          'edit': spRoute(path: '/edit', view: 'views/applications/edit.html')
      }, sectionName: 'administration')
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
      bool allowed = _authentication.isUserAllowed(neededUserLevel);
      event.allowEnter(new Future<bool>.value(allowed));
      if(!allowed) {
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


class SpRouteCfg extends NgRouteCfg {

  final String path;
  final String view;
  final String viewHtml;
  final Map<String, SpRouteCfg> mount;
  final Function modules;
  final bool defaultRoute;
  final bool dontLeaveOnParamChanges;
  final RouteEnterEventHandler enter;
  final RoutePreEnterEventHandler preEnter;
  final RoutePreLeaveEventHandler preLeave;
  final RouteLeaveEventHandler leave;
  final String sectionName;
  final int neededUserLevel;


  SpRouteCfg({this.view, this.viewHtml, this.path, this.mount, this.modules, this.defaultRoute,
             this.enter, this.preEnter, this.preLeave, this.leave, this.dontLeaveOnParamChanges, this.neededUserLevel, this.sectionName});


}
