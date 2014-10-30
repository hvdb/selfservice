import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('index page', () {

    beforeEach(() {
      protractor.getInstance().get('index-e2e.html');
    });

    it('should have the correct title', () {
      expect(browser.getTitle()).toEqual('Buddy');
    });

    xit('should have the correct navigation block', () {
      expect(element(by.id('navigationBlock')).isDisplayed()).toBe(true);
      expect(element(by.id('addApplication')).getText()).toBe('Add new application');


    });

  });
}