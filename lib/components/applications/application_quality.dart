import 'package:angular/angular.dart';
import 'constants.dart';


@Component(
    selector: 'application-quality',
    templateUrl: 'packages/self_service/components/applications/application_quality.html',
    useShadowDom: false,
    publishAs: 'quality')
class ApplicationQuality {

  final Http _http;
  var application;
  String _applicationId, _mergeFrom, notification, notificationType, splash;

  ApplicationQuality(this._http) {

  }




}
