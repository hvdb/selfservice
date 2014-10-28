import 'package:angular/angular.dart';
import '../constants.dart';

@Component(
    selector: 'application',
    templateUrl: 'packages/self_service/components/applications/application.html',
    useShadowDom: true,
    publishAs: 'applications')
class Applications {

  Router _router;
  final Http _http;

  String applicationName, repoAdmin, notification, notificationType, api_url;

  bool added, loading, error = false;

  String validationPattern = "^[p|z|o|g][A-Z][a-zA-Z]*\$";
  Applications(this._http, this._router) {}

  createNewRepo() {

    api_url = Constants.getStashUrl();
    notification = 'new-application-notification-module-wordt-toegevoegd';
    notificationType = 'info';

    _http.post('http://$api_url/applications/', {"name":applicationName, "repoAdmin":repoAdmin}).then((HttpResponse response) {

      notification = 'new-application-notification-module-is-toegevoegd';
      notificationType = 'success';

    }).catchError((e) {
      if (e.toString().contains('409')) {
        notification = 'new-application-notification-module-bestaat';
      } else if(e.toString().contains('417')) {
        notification = 'new-application-notification-module-repoadmin-bestaat-niet';
      } else {
        notification = 'new-application-notification-module-error';
      }

      notificationType = 'error';
    });
  }
}
