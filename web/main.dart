library  self_service;
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';
import 'package:angular/routing/module.dart';


import 'package:self_service/components/applications/application.dart';
import 'package:self_service/components/applications/application_details.dart';
import 'package:self_service/components/applications/application_overview.dart';
import 'package:self_service/components/applications/applications_list.dart';
import 'package:self_service/components/applications/application_quality.dart';
import 'package:self_service/components/applications/application_status.dart';

import 'package:self_service/components/applications/build_details.dart';

import 'package:self_service/components/applications/build_details_application.dart';
import 'package:self_service/components/applications/application_pr.dart';
import 'package:self_service/components/applications/application_dependencies.dart';
import 'package:self_service/components/applications/application_branchconfig.dart';
import 'package:self_service/components/applications/application_builds.dart';
import 'package:self_service/components/applications/application_build.dart';


import 'package:self_service/components/navigation/navigation.dart';
import 'package:spectingular_dart/components/navigation/navigation_block.dart';
import 'package:spectingular_dart/components/notification.dart' as Noti;
import 'package:self_service/components/authentication/authentication.dart';
import 'package:spectingular_dart/components/translation/translation.dart';
import 'package:spectingular_dart/services/translation_service.dart';
import 'package:spectingular_dart/services/authentication.dart';
import 'package:spectingular_dart/services/navigation_service.dart' as NavService;
import 'package:spectingular_dart/services/routing_service.dart';
import 'package:self_service/services/state_service.dart';
import 'package:self_service/services/routing_service.dart' as SelfServiceRouting;
//import 'package:highcharts4dart/highcharts.dart' as HighCharts;
import 'package:self_service/services/translation_config.dart' as TransConf;
import 'dart:html';


import 'package:self_service/self_service_route_initializer.dart';

class SelfServiceApp extends Module {
  SelfServiceApp() {
    bind(RoutingService, toImplementation: SelfServiceRouting.RoutingService);
    bind(StateService);
    bind(ApplicationsList);
    bind(Applications);
    bind(ApplicationDetails);
    bind(NavigationBlockComponent);
    bind(Navigation);
    bind(Noti.Notification);
    bind(Authentication);
    bind(AuthenticationService);
    bind(Translation);
    bind(TranslationService);
    bind(ApplicationBranchConfig);
    bind(ApplicationBuilds);
    bind(ApplicationBuild);
    bind(ApplicationOverview);
    bind(ApplicationQuality);
    bind(ApplicationDependencies);
    bind(ApplicationStatus);
    bind(BuildDetails);
    bind(BuildDetailsApplication);
    bind(ApplicationPullRequest);
    // bind(HighCharts.HighChartComponent);
    bind(HttpDefaultHeaders, toImplementation: MyDefaultHeaders);
    bind(TranslationConfig, toImplementation: TransConf.TranslationConfig);
    bind(NavigationService, toImplementation: NavService.NavigationService);
    bind(RouteInitializerFn, toImplementation: SelfServiceRouterInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}



void main() {

  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((LogRecord r) {
    print(r.message);
  });
  Binding.printInjectWarning = false;
  applicationFactory().addModule(new SelfServiceApp()).run();

}

@Injectable()
class MyDefaultHeaders extends HttpDefaultHeaders {
  @override
  setHeaders(Map<String, String> headers, String method) {
    super.setHeaders(headers, method);
    headers['authorization'] = window.localStorage['jwt'];
  }
}