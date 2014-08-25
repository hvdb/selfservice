part of self_service;


@Component(
    selector: 'sp-notification',
    templateUrl: '../lib/components/notification.html',
    cssUrl: '../web/css/theguide.css',
    publishAs: 'notification')
class Notification {

  String notificationType;
  String alertClass = '';
  String iconClass = '';
  String color = '';

  bool show = true;

  @NgOneWay('type')
  set type(String value) {
   notificationType = value.toLowerCase();
   alertClass = '';
   _setCorrectCssClass();
  }

  get type => notificationType;

  @NgOneWay('closeable')
  bool closeable;


  void closeNotification() {
    show = false;
  }

  _setCorrectCssClass() {


  switch (notificationType) {
    case 'warning':
      iconClass = 'warning';
      color = 'orange';
      alertClass = 'alert-$notificationType $alertClass';
    break;
    case 'error':
    case 'problem_report':
      iconClass = 'error';
      color = 'red';
      alertClass = 'alert-danger $alertClass';
    break;
    case 'success':
      iconClass = 'success';
      color = 'gray';
      alertClass = 'alert-$notificationType $alertClass ';
    break;
    case 'info':
      iconClass = 'information';
      color = 'gray';
      alertClass = 'alert-$notificationType $alertClass ';
    break;
  }

  }


}
