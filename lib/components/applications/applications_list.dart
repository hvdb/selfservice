library recipe_book_controller;

import 'package:angular/angular.dart';
import 'dart:convert';
import "package:json_object/json_object.dart";

@Component(
    selector: 'applications-list',
    templateUrl: '../lib/components/applications/applications_list.html',
    cssUrl: '../web/css/bootstrap.min.css',
    publishAs: 'cmp')
class ApplicationsList {

  final Http _http;

  Map apps = new Map();

  ApplicationsList(this._http) {
    _loadData();
  }

  void _loadData() {

    _http.get('http://localhost:9090/applications/')
    .then((HttpResponse response) {
      print(response);
      apps = response.data;

    })
    .catchError((e) {
      print(e);

    });


  }
}
