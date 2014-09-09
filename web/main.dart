library  self_service;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/application_factory.dart';

import 'package:self_service/components/applications/application.dart';
import 'package:self_service/components/applications/application_details.dart';
import 'package:self_service/components/applications/applications_list.dart';
import 'package:self_service/components/navigation/navigation_block.dart';
import 'package:self_service/components/navigation/navigation.dart';
import 'package:self_service/components/notification.dart';
import 'package:self_service/components/authentication/authentication.dart';
import 'package:self_service/services/authentication.dart';


import 'package:self_service/self_service_route_initializer.dart';

class SelfServiceApp extends Module {
  SelfServiceApp() {
    bind(ApplicationsList);
    bind(Applications);
    bind(ApplicationDetails);
    bind(NavigationBlock);
    bind(Navigation);
    bind(Notification);
    bind(Authentication);
    bind(AuthenticationService);
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
