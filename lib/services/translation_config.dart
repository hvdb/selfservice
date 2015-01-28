import 'package:angular/angular.dart';
import 'package:spectingular_dart/services/translation_service.dart';

@Injectable()
class TranslationConfig  {

  String defaultLanguage = 'nl';

  Map<String, TranslatedContent> getTranslations(){
    Map<String, TranslatedContent> content = new Map<String, TranslatedContent>();

    content['homepage'] = new TranslatedContent(nl_NL:'Welkom bij My Angular Self Services!', en_EN: 'Welcome to selfService!');

    content['technical-error'] = new TranslatedContent(nl_NL:'Sorry er is iets fout gegaan.');
    content['not-alowed'] = new TranslatedContent(nl_NL:'Niet toegestaan');

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


    content['new-application-description-label'] = new TranslatedContent(nl_NL:'Beschrijving');
    content['new-application-team-label'] =new TranslatedContent(nl_NL:'Team');
    content['new-application-targetplatforms-label'] = new TranslatedContent(nl_NL:'Selecteer waar de module heen gaat.');
    content['new-application-select-team']  = new TranslatedContent(nl_NL:'Selecteer een team.');
    content['new-application-submit-button'] =  new TranslatedContent(nl_NL:'Toevoegen');

  //login
    content['login-title'] = new TranslatedContent(nl_NL: 'Login formulier');
    content['login-label-username'] = new TranslatedContent(nl_NL: 'Gebruikersnaam');
    content['login-label-password'] = new TranslatedContent(nl_NL: 'Wachtwoord');
    content['login-submit'] = new TranslatedContent(nl_NL: 'Login');

//navbar
    content['navbar-header-welcome'] = new TranslatedContent(nl_NL:'Welkom ');
    content['navbar-toggle-navigation'] = new TranslatedContent(nl_NL:'Klap navigatie uit');
    content['navbar-label-home'] = new TranslatedContent(nl_NL:'My Angular Self Service');
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


    content['navigation-block-app-administration-application-view'] = new TranslatedContent(nl_NL:'Overview');
    content['navigation-block-app-administration-application-details'] = new TranslatedContent(nl_NL:'Details');
    content['navigation-block-app-administration-application'] = new TranslatedContent(nl_NL:'Applicatie');
    content['navigation-block-app-administration-application-config'] = new TranslatedContent(nl_NL:'Branch config');
    content['navigation-block-app-administration-application-quality'] = new TranslatedContent(nl_NL:'Kwaliteit');
    content['navigation-block-app-administration'] = new TranslatedContent(nl_NL:'Administratie');
    content['navigation-block-app-administration-application-builds'] = new TranslatedContent(nl_NL:'Builds');


    content['navbar-label-teams'] = new TranslatedContent(nl_NL:'Teams');
    content['navigation-block-team-administration'] = new TranslatedContent(nl_NL:'Administratie');
    content['navigation-block-team-administration-teams'] = new TranslatedContent(nl_NL:'teams');
    content['navigation-block-team-administration-teams-list'] = new TranslatedContent(nl_NL:'Lijst');
    content['navigation-block-team-administration-teams-add'] = new TranslatedContent(nl_NL:'Toevoegen');
    content['navigation-block-team-administration-teams-details'] = new TranslatedContent(nl_NL:'Details');

    //application config
    content['application-config-merge-test'] = new TranslatedContent(nl_NL:'Merge applicatie naar test');
    content['application-config-merge-acc'] = new TranslatedContent(nl_NL:'Merge applicatie naar acceptatie');
    content['application-config-merge-prd'] = new TranslatedContent(nl_NL:'Merge applicatie naar PRODUCTIE');


    //application details
    content['update-application-notification-module-geupdate'] = new TranslatedContent(nl_NL: 'Applicatie is succesvol geupdate.');
    content['update-application-notification-module-error'] = new TranslatedContent(nl_NL: 'De update van de module is gefaald.');



    //dependencies
    content['application-dependencies-resolution'] = new TranslatedContent(nl_NL:'Resolutie');
    content['application-dependencies-url'] = new TranslatedContent(nl_NL:'URL');
    content['application-dependencies-name'] = new TranslatedContent(nl_NL:'Naam');
    content['application-dependencies-actions'] = new TranslatedContent(nl_NL:'Acties');


    //app overview
    content['application-overview-issues'] = new TranslatedContent(nl_NL:'Problemen');
    content['application-overview-status'] = new TranslatedContent(nl_NL:'Status');
    content['application-overview-builds'] = new TranslatedContent(nl_NL:'Builds');
    content['application-overview-quality-develop'] = new TranslatedContent(nl_NL:'Kwaliteit (develop)');
    content['application-overview-dependencies-develop'] = new TranslatedContent(nl_NL:'Dependencies (Develop)');
    content['application-overview-open-pr'] = new TranslatedContent(nl_NL:'Open Pull-requests');
    content['application-overview-jira-issues'] = new TranslatedContent(nl_NL:'Jira taken');
    content['application-overview-prd-stats'] = new TranslatedContent(nl_NL:'Productie stats');

    content['not-implemented'] = new TranslatedContent(nl_NL:'Nog niet beschikbaar');

    //app list
    content['applications-list-application-name'] = new TranslatedContent(nl_NL:'Naam');
    content['applications-list-application-team'] = new TranslatedContent(nl_NL:'Team');
    content['applications-list-title'] = new TranslatedContent(nl_NL:'Lijst van applicaties');


    //team details
    content['delete-member-notification-success'] = new TranslatedContent(nl_NL:'Naam');
    content['delete-member-notification-error'] = new TranslatedContent(nl_NL:'Naam');
    content['update-team-notification-error'] = new TranslatedContent(nl_NL:'Naam');
    content['get-team-notification-error'] = new TranslatedContent(nl_NL:'Naam');


    content['update-team-title'] = new TranslatedContent(nl_NL:'Update team details');
    content['team-member-name'] = new TranslatedContent(nl_NL:'Naam');
    content['team-member-email'] = new TranslatedContent(nl_NL:'Email');
    content['team-member-key'] = new TranslatedContent(nl_NL:'Corporate key');
    content['team-member-role'] = new TranslatedContent(nl_NL:'Rol');
    content['team-member-actions'] = new TranslatedContent(nl_NL:'Acties');
    content['team-member-add'] = new TranslatedContent(nl_NL:'Toevoegen');
    content['new-teammember-name-label'] = new TranslatedContent(nl_NL:'Naam');
    content['new-teammember-emailAddress-label'] = new TranslatedContent(nl_NL:'Email');
    content['new-teammember-corpKey-label'] = new TranslatedContent(nl_NL:'Corporate key');


  //team list
    content['teams-list-title'] = new TranslatedContent(nl_NL:'Lijst van teams');
    content['teams-list-teamId'] = new TranslatedContent(nl_NL:'Team id');
    content['teams-list-teamName'] = new TranslatedContent(nl_NL:'Team naam');

    //update app
    content['update-application-targetplatorm'] = new TranslatedContent(nl_NL:'Selecter target');
    content['update-application-title'] = new TranslatedContent(nl_NL:'Applicatie dependencies');
    content['add-customdependency-name-label'] = new TranslatedContent(nl_NL:'Naam');
    content['add-customdependency-url-label'] = new TranslatedContent(nl_NL:'URL');
    content['add-customdependency-resolution-label'] = new TranslatedContent(nl_NL:'Resolutie');
    content['application-details-applicationId'] = new TranslatedContent(nl_NL:'Applicatie ID');
    content['application-details-cloneUrl'] = new TranslatedContent(nl_NL:'Clone url');
    content['application-details-description'] = new TranslatedContent(nl_NL:'Beschrijving');
    content['application-details-platforms'] = new TranslatedContent(nl_NL:'Platformen');
    content['application-details-teamId'] = new TranslatedContent(nl_NL:'Team ID');
    content['update-application-save'] = new TranslatedContent(nl_NL:'Opslaan');
    content['update-application-members-add'] = new TranslatedContent(nl_NL:'Toevoegen');

    //add app
    content['save-team-notification-ok'] = new TranslatedContent(nl_NL:'Team is toegevoegd');
    content['save-team-notification-error'] = new TranslatedContent(nl_NL:'Er ging iets fout tijdens het toevoegen van het team');
    content['new-team-teamId-label'] = new TranslatedContent(nl_NL:'Team ID');
    content['new-team-teamName-label'] = new TranslatedContent(nl_NL:'Team Naam');
    content['new-team-save'] = new TranslatedContent(nl_NL:'Toevoegen');

    //Application-details
    content['application-details-technical-error'] = new TranslatedContent(nl_NL:'Sorry er is iets fout gegaan met het ophalen van de data.');

    //Application-pull-requests
    content['application-pull-requests-not-found'] = new TranslatedContent(nl_NL:'Er zijn geen openstaande pull requests.');

    //application branch config
    content['application-branch-config-notification-post-success'] = new TranslatedContent(nl_NL:'De branches zijn aangepast.');

    return content;
  }


}