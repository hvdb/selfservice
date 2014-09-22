library  self_service;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/application_factory.dart';


import 'package:self_service/components/applications/application.dart';
import 'package:self_service/components/applications/application_details.dart';
import 'package:self_service/components/applications/applications_list.dart';

import 'package:self_service/components/navigation/navigation.dart';
import 'package:spectingular_dart/components/navigation/navigation_block.dart';
import 'package:spectingular_dart/components/notification.dart';
import 'package:self_service/components/authentication/authentication.dart';
import 'package:spectingular_dart/services/authentication.dart';
import 'package:spectingular_dart/services/navigation_service.dart' as NavService;
import 'package:spectingular_dart/services/routing_service.dart';
import 'package:self_service/services/routing_service.dart' as SelfServiceRouting;



import 'package:self_service/self_service_route_initializer.dart';

class SelfServiceApp extends Module {
  SelfServiceApp() {
    bind(RoutingService, toImplementation: SelfServiceRouting.RoutingService);
    bind(ApplicationsList);
    bind(Applications);
    bind(ApplicationDetails);
    bind(NavigationBlockComponent);
    bind(Navigation);
    bind(Notification);
    bind(Authentication);
    bind(AuthenticationService);
    bind(NavigationService, toImplementation: NavService.NavigationService);
    bind(RouteInitializerFn, toImplementation: SelfServiceRouterInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

  }

}

void main() {

  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  Binding.printInjectWarning = false;
  applicationFactory()
  .addModule(new SelfServiceApp())
  .run();

}
