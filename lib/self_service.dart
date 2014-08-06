import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:angular/animate/module.dart';
import 'package:angular/application_factory.dart';


part 'components/applications/application.dart';
part 'components/applications/applications_list.dart';
part 'self_service_route_initializer.dart';


class SelfServiceApp extends Module {
  SelfServiceApp() {
    bind(ApplicationsList);
    bind(Applications);
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

