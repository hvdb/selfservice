library recipe_book_controller;

import 'package:angular/angular.dart';
import 'dart:convert';
import "package:json_object/json_object.dart";

@Component(
    selector: 'applications',
    templateUrl: '../lib/components/applications/applications.html',
    //cssUrl: 'packages/angular_dart_demo/rating/rating_component.css',
    publishAs: 'cmp')
class Applications {

  final Http _http;

  Map apps = new Map();

  Applications(this._http) {
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
