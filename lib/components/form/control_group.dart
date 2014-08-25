part of self_service;


@Component(
    selector: 'sp-control-group',
    templateUrl: '../lib/components/form/control_group.html',
    cssUrl: '../web/css/theguide.css',
    publishAs: 'controlGroup')
class ControlGroup {

  String message = 'Dit veld is verplicht.';

  @NgOneWay('id')
  String id;



}
