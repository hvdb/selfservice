part of self_service;

@Component(
    selector: 'application',
    templateUrl: '../lib/components/applications/application.html',
    cssUrl: '../web/css/theguide.css',
    publishAs: 'applications')
class Applications {

  Router _router;
  final Http _http;

  String applicationName;
  bool added = false;
  bool loading = false;
  bool error = false;

  String notification;
  String notificationType;

  String validationPattern = "^[p|z|o|g][A-Z]";

  Applications(this._http, this._router) {

  }

  createNewRepo() {

     notification = 'De module wordt nu toegevoegd, dit kan even duren.';
     notificationType = 'info';

    _http.post('http://localhost:9090/applications/', {"name":applicationName, "scmId":"git", "forkable":true}).then((HttpResponse response) {

      notification = 'Uw module is toegevoegd, kijk voor de details :<a href="#/application/'+applicationName+'/view">hier</a>';
      notificationType = 'success';

    }).catchError((e) {
      if (e.toString().contains('409')) {
        notification = 'De modulenaam bestaat al.';
      } else {
        notification = 'Er is iets fout gegaan sorry';
      }


      notificationType = 'error';
    });
  }
}
