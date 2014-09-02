import 'package:angular/angular.dart';

@Component(
    selector: 'sp-notification',
    templateUrl: 'packages/self_service/components/notification.html',
    useShadowDom: false,
    publishAs: 'notification')
class Notification {

  String notificationType, alertClass, iconClass, color;
  bool show = true;

  @NgOneWay('type')
  set type(String value) {
    setType(value);
  }

  get type => notificationType;

  @NgOneWay('closeable')
  bool closeable;

  void closeNotification() {
    show = false;
  }

  void setType(String value) {
    if (value != null) {
      notificationType = value.toLowerCase();
    }
    _setCorrectCssClass();
  }

  _setCorrectCssClass() {

    switch (notificationType) {
      case 'warning':
        iconClass = 'warning';
        color = 'orange';
        alertClass = 'alert-warning';
      break;
      case 'error':
      case 'problem_report':
        iconClass = 'error';
        color = 'red';
        alertClass = 'alert-danger';
      break;
      case 'success':
        iconClass = 'success';
        color = 'green';
        alertClass = 'alert-success';
      break;
      case 'info':
      default:
        iconClass = 'information';
        color = 'gray';
        alertClass = 'alert-info';
      break;
    }

  }


}
