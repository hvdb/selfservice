import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/application_factory.dart';
import 'dart:async';
import "package:angular/core/parser/syntax.dart";

part 'components/applications/application.dart';
part 'components/applications/application_details.dart';
part 'components/applications/applications_list.dart';
part 'components/navigation/navigation_block.dart';
part 'components/navigation/navigation.dart';
part 'components/notification.dart';
part 'self_service_route_initializer.dart';


class SelfServiceApp extends Module {
  SelfServiceApp() {
    bind(ApplicationsList);
    bind(Applications);
    bind(ApplicationDetails);
    bind(NavigationBlock);
    bind(Navigation);
    bind(Notification);
    bind(RouteInitializerFn, toValue: SelfServiceRouterInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));

  }

}
  startSelfServiceApp() {
    Binding.printInjectWarning = false;
    applicationFactory()
    .addModule(new SelfServiceApp())
    .run();

  }

