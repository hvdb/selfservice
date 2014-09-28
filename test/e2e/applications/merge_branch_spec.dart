import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('Merge application between branches', () {

    var ptor = protractor.getInstance();

    beforeEach(() {
      ptor.get('index-e2e.html#/application/gDocker/view');
      //login
      element(by.id('login')).click();
      element(by.id('username')).sendKeys('user');
      element(by.id('password')).sendKeys('pass');
      element(by.id('loginForm')).submit();

      element(by.id('applications')).click();


    });

    xit('should show the application details', () {
      expect(element(by.id('submitMergeTest')).isDisplayed()).toBeTruthy();
      //expect(element(by.id('applicationDetails')).isDisplayed()).toBeTruthy();




    });

    //add application.

    //Merge branches dev -> test -> a -> prd

    //Check stash

    //Remove repo.


  });
}