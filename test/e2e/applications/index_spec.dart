import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('index page', () {

    beforeEach(() {
      protractor.getInstance().get('index.html');
    });

    it('should display the subtitle', () {

     var subTitle = element(by.id('subTitle'));
      expect(subTitle.isDisplayed()).toBe(true);


    });

    it('should have the correct title', () {
      expect(browser.getTitle()).toEqual('Buddy');

    });

  });
}