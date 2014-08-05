import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import '../lib/components/applications/applications_list.dart';

class MyAppModule extends Module {
  MyAppModule() {
    bind(ApplicationsList);
  }
}

void main() {
  Binding.printInjectWarning = false;
  applicationFactory()
  .addModule(new MyAppModule())
  .run();
}
