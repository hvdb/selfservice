import 'package:angular/angular.dart';

@Component(
    selector: 'sp-control-group',
    templateUrl: 'packages/self_service/components/form/control_group.html',
    cssUrl: '../web/css/theguide.css',
    useShadowDom: false,
    publishAs: 'controlGroup')
class ControlGroup {

  String message = 'Dit veld is verplicht.';

  @NgOneWay('id')
  String id;



}
