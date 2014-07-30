import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:self_service/components/applications/applications.dart';


class MyAppModule extends Module {
  MyAppModule() {
    bind(Applications);
  }
}

void main() {
  applicationFactory()
  .addModule(new MyAppModule())
  .run();
}
