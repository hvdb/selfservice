import 'package:angular/angular.dart';
import '../constants.dart';

@Component(
    selector: 'view-har',
    templateUrl: 'packages/self_service/components/applications/application.html',
    useShadowDom: true,
    publishAs: 'har')
class ViewHar {

  final Http _http;

String totalNumberOfRequests, applicationRequests, totalSize, totalLoadTime, onloadTime, applicationSize;
  bool added, loading, error = false;


  ViewHar(this._http) {
    String applicationId = '1';
      loadVar(applicationId);
  }


  loadVar(String applicationId) {
    //Get the values from database.
    //For now just show some random figures.

    totalNumberOfRequests = '40';
    applicationRequests = '1';
    totalSize = '1,40MB';
    totalLoadTime = '1,69s';
    onloadTime = '998,2332';
    applicationSize = '65kb';

  }

}
