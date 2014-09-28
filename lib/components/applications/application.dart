
import 'package:angular/angular.dart';
import 'constants.dart';

@Component(
    selector: 'application',
    templateUrl: 'packages/self_service/components/applications/application.html',
    useShadowDom: false,
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
    notification = 'De module wordt nu toegevoegd, dit kan even duren.';
    notificationType = 'info';

    _http.post('http://$api_url/applications/', {"name":applicationName, "repoAdmin":repoAdmin}).then((HttpResponse response) {

      notification = 'Uw module is toegevoegd, kijk voor de details :<a href="#/application/'+applicationName+'/view">hier</a>';
      notificationType = 'success';

    }).catchError((e) {
      if (e.toString().contains('409')) {
        notification = 'De modulenaam bestaat al.';
      } else if(e.toString().contains('417')) {
        notification = 'De ingevoerde repo admin bestaat niet, repo is toegevoegd. Zie stash om een repoadmin toe te voegen.';
      } else {
        notification = 'Er is iets fout gegaan sorry';
      }

      notificationType = 'error';
    });
  }
}
