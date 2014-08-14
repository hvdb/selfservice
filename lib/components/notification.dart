part of self_service;

@Component(
    selector: 'sp-notification',
    templateUrl: '../lib/components/notification.html',
    cssUrl: '../web/css/theguide.css',
    publishAs: 'notification')
class Notification {


  @NgOneWay('type')
  String type;

  String get alertTypeAsString => "alert-${type != null ? type : 'danger'}";




}
