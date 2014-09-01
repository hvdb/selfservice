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

        notification.closeable = true;
        expect(notification.show).toBeTruthy();
        notification.closeNotification();
        expect(notification.show).toBeFalsy();

        });

    });


    describe("different notification types", () {

      it("should set the corret values for warning notification" ,() {
        notification.setType('warning');
        expect(notification.notificationType).toBe('warning');
        expect(notification.alertClass).toBe('alert-warning');
        expect(notification.iconClass).toBe('warning');
        expect(notification.color).toBe('orange');
      });

      it("should set the corret values for error notification" ,() {
        notification.setType('error');
        expect(notification.notificationType).toBe('error');
        expect(notification.alertClass).toBe('alert-danger');
        expect(notification.iconClass).toBe('error');
        expect(notification.color).toBe('red');
      });

      it("should set the corret values for problem report notification" ,() {
        notification.setType('problem_report');
        expect(notification.notificationType).toBe('problem_report');
        expect(notification.alertClass).toBe('alert-danger');
        expect(notification.iconClass).toBe('error');
        expect(notification.color).toBe('red');
      });

      it("should set the corret values for info notification" ,() {
        notification.setType('info');
        expect(notification.notificationType).toBe('info');
        expect(notification.alertClass).toBe('alert-info');
        expect(notification.iconClass).toBe('information');
        expect(notification.color).toBe('gray');
      });

      it("should set the corret values for success notification" ,() {
        notification.setType('success');
        expect(notification.notificationType).toBe('success');
        expect(notification.alertClass).toBe('alert-success');
        expect(notification.iconClass).toBe('success');
        expect(notification.color).toBe('green');
      });

    });


  });



}