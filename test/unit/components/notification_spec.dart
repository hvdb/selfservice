part of self_service_test;



testNotification() {

  Notification notification;

  describe("test the notification", (){

    describe("default behavior", (){

      beforeEach((){
        notification = new Notification();
      });

      it("is should set the correct defaults", (){
        expect(notification.show).toBeTruthy();
        expect(notification.notificationType).toBeNull();
        expect(notification.alertClass).toBeNull();
        expect(notification.iconClass).toBeNull();
        expect(notification.color).toBeNull();
      });

      it("it should set the default classes when no type is given", () {
        notification.setType('');
        expect(notification.notificationType).toBe('');
        expect(notification.alertClass).toBe('alert-info');
        expect(notification.iconClass).toBe('information');
        expect(notification.color).toBe('gray');

      });

      it("it should be closable",() {

      });

    });


    describe("different notification types", () {

      it("should set the corret values for warning notification" ,() {

      });

      it("should set the corret values for error notification" ,() {

      });

      it("should set the corret values for problem report notification" ,() {

      });

      it("should set the corret values for info notification" ,() {

      });

      it("should set the corret values for success notification" ,() {

      });

    });


  });



}