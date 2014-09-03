import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('index page', () {

    beforeEach(() {
      protractor.getInstance().get('index-e2e.html');
    });

    it('should display the subtitle', () {

      expect(element(by.id('subTitle')).isDisplayed()).toBe(true);

    });

    it('should have the correct title', () {
      expect(browser.getTitle()).toEqual('Buddy');

    });

  });
}