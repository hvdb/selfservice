library self_service_test;
import 'package:unittest/unittest.dart' hide expect;

import 'package:guinness/guinness_html.dart';
import 'package:dartmocks/dartmocks.dart';

import 'dart:async';
import 'dart:html' as html;

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:angular/mock/test_injection.dart';

import 'package:self_service/components/applications/applications_list.dart';



part 'components/applications/applications_list_spec.dart';
part 'helper.dart';

main() {
  guinnessEnableHtmlMatchers();

  testApplication();

  guinness.initSpecs();

}