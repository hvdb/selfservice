import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('index page', () {
    var nameByModel, nameByBinding;

    beforeEach(() {
      protractor.getInstance().get('selfservice/web/index.html');
    });

    it('should display the subtitle', () {
      expect(element(by.id('subTitle')).getText()).toContain('you');
    });

    it('should set mustache value to initial value of model', () {
      nameByBinding = element(by.binding('ctrl.name'));
      expect(nameByBinding.getText()).toEqual('Hello world!');
    });

  });
}