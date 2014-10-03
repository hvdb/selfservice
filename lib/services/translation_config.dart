import 'package:angular/angular.dart';
import 'package:spectingular_dart/services/translation_service.dart';

@Injectable()
class TranslationConfig  {

  String defaultLanguage = 'nl';

  Map<String, TranslatedContent> getTranslations(){
    Map<String, TranslatedContent> content = new Map<String, TranslatedContent>();

    content['homepage'] = new TranslatedContent(nl_NL:'Welkom bij selfService!', en_EN: 'Welcome to selfService!');


    //Validation message
    content['validation-messages'] = new TranslatedContent(nl_NL:'Er zijn validatiemeldingen');
    content['validation-required'] = new TranslatedContent(nl_NL: 'Dit veld is verplicht', en_EN: 'This field is mandantory');
    content['validation-pattern-applicationname'] = new TranslatedContent(nl_NL : '<span>De naam moet beginnen met een van deze letters: p,z,o,g gevolgd door een hoofdletter en er mogen geen vreemde tekens en/of cijfers in zitten.</span><br/><span><b>Voorbeeld: pApplicatieNaam</b></span>');

    //New application
    content['new-application-title'] = new TranslatedContent(nl_NL: '<strong>Vul hier de gegevens in van de nieuwe module. <b>Repo admin</b> moet een bekende corp key zijn in stash.</strong>');
    content['new-application-label'] =  new TranslatedContent(nl_NL: 'Application name:');
    content['new-application-repoadmin'] =  new TranslatedContent(nl_NL: 'Repo admin:');
    content['new-application-notification-module-wordt-toegevoegd'] = new TranslatedContent(nl_NL:'De module wordt nu toegevoegd, dit kan even duren.');
    content['new-application-notification-module-is-toegevoegd'] = new TranslatedContent(nl_NL:'Uw module is toegevoegd.');
    content['new-application-notification-module-bestaat'] = new TranslatedContent(nl_NL:'De modulenaam bestaat al.');
    content['new-application-notification-module-error'] = new TranslatedContent(nl_NL:'Er is iets fout gegaan sorry.');
    content['new-application-notification-module-repoadmin-bestaat-niet'] = new TranslatedContent(nl_NL:'De ingevoerde repo admin bestaat niet, repo is toegevoegd. Zie stash om een repoadmin toe te voegen.');

  //login
    content['login-title'] = new TranslatedContent(nl_NL: 'Login formulier');
    content['login-label-username'] = new TranslatedContent(nl_NL: 'Gebruikersnaam');
    content['login-label-password'] = new TranslatedContent(nl_NL: 'Wachtwoord');
    content['login-submit'] = new TranslatedContent(nl_NL: 'Login');

//navbar
    content['navbar-toggle-navigation'] = new TranslatedContent(nl_NL:'Klap navigatie uit');
    content['navbar-label-home'] = new TranslatedContent(nl_NL:'Home');
    content['navbar-label-applications'] = new TranslatedContent(nl_NL:'Applicaties');
    content['navbar-label-account'] = new TranslatedContent(nl_NL:'Gebruiker');
    content['navbar-label-account-login'] = new TranslatedContent(nl_NL:'Inloggen');
    content['navbar-label-account-logout'] = new TranslatedContent(nl_NL:'Uitloggen');


    //Navigation block
    content['navigation-block-apps-administration'] = new TranslatedContent(nl_NL:'Administratie');
    content['navigation-block-apps-administration-applications'] = new TranslatedContent(nl_NL:'Applicaties');
    content['navigation-block-apps-administration-applications-list'] = new TranslatedContent(nl_NL:'Lijst');
    content['navigation-block-apps-administration-applications-add'] = new TranslatedContent(nl_NL:'Toevoegen');

    content['navigation-block-apps-administration-applications-add'] = new TranslatedContent(nl_NL:'Toevoegen');


    content['navigation-block-app-administration-application-view'] = new TranslatedContent(nl_NL:'Details');
    content['navigation-block-app-administration-application'] = new TranslatedContent(nl_NL:'Applicatie');
    content['navigation-block-app-administration-application-config'] = new TranslatedContent(nl_NL:'Branch config');
    content['navigation-block-app-administration-application-quality'] = new TranslatedContent(nl_NL:'Kwaliteit');
    content['navigation-block-app-administration'] = new TranslatedContent(nl_NL:'Administratie');
    content['navigation-block-app-administration-application-builds'] = new TranslatedContent(nl_NL:'Builds');

    //application config
    content['application-config-merge-test'] = new TranslatedContent(nl_NL:'Merge applicatie naar test');
    content['application-config-merge-acc'] = new TranslatedContent(nl_NL:'Merge applicatie naar acceptatie');
    content['application-config-merge-prd'] = new TranslatedContent(nl_NL:'Merge applicatie naar PRODUCTIE');



    return content;
  }


}