import 'dart:html';
import 'package:js/js.dart';
import 'package:protractor/protractor_api.dart';

main() {
  describe('add new application page', () {

    beforeEach(() {
      protractor.getInstance().get('index-e2e.html');
      //login
      element(by.id('login')).click();
      element(by.id('username')).sendKeys('henk');
      element(by.id('password')).sendKeys('henk');
      element(by.id('loginForm')).submit();

      element(by.id('applications')).click();
      //click
      element(by.id('add')).click();
    });

    it('should show the form to add a new application', () {
      expect(element(by.id('newApplicationForm')).isDisplayed()).toBeTruthy();
      expect(element(by.id('applicationNameLabel')).getText()).toBe('Application name:');
      expect(element(by.id('repoAdminLabel')).getText()).toBe('Repo admin');
      expect(element(by.id('submitButton')).isEnabled()).toBeFalsy();

    });


    it('should show pattern validation message for application name', () {
      expect(element(by.id('applicationNamePatternMessage')).isPresent()).toBeFalsy();
      element(by.id('applicationName')).sendKeys('ditisfout');
      expect(element(by.id('applicationNamePatternMessage')).isDisplayed()).toBeTruthy();
      expect(element(by.id('applicationNamePatternMessage')).getText()).toContain('De naam moet beginnen met een van deze letters: p,z,o,g gevolgd door een hoofdletter en er mogen geen vreemde tekens en/of cijfers in zitten.');

    });


    it('should show required validation message for application  name', () {
      expect(element(by.id('applicationNameRequiredMessage')).isPresent()).toBeFalsy();
      element(by.id('applicationName')).sendKeys('pGoed');
      element(by.id('applicationName')).clear();
      expect(element(by.id('applicationNameRequiredMessage')).isDisplayed()).toBeTruthy();
      expect(element(by.id('applicationNameRequiredMessage')).getText()).toBe('Dit veld is verplicht.');
    });


    it('should show required validation message for repoadmin', () {
      expect(element(by.id('repoAdminRequiredMessage')).isPresent()).toBeFalsy();
      element(by.id('repoAdmin')).sendKeys('a');
      element(by.id('repoAdmin')).clear();
      expect(element(by.id('repoAdminRequiredMessage')).isDisplayed()).toBeTruthy();
      expect(element(by.id('repoAdminRequiredMessage')).getText()).toBe('Dit veld is verplicht.');
    });

    it('should enable submit button when all validation are met', () {
      element(by.id('repoAdmin')).sendKeys('admin');
      element(by.id('applicationName')).sendKeys('gProtractorTestApp');
      expect(element(by.id('submitButton')).isEnabled()).toBeTruthy();

    });


    it('should submit and show waiting message', () {
      expect(element(by.id('statusNotification')).isPresent()).toBeFalsy();
      element(by.id('newApplicationForm')).submit();
      expect(element(by.id('statusNotification')).isDisplayed()).toBeTruthy();
    });


    it('should show error message "Repo already exists"', () {

    });


    it('should show error message "User unknown"', () {

    });

    it('should show error message "General exception"', () {

    });


    it('should show success notification', () {

    });



  });
}