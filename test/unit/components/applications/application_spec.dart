part of self_service_test;

class RouterTestDouble extends TestDouble implements Router {}


testApplication(){
  var routerTest;
  MockHttpBackend backend;
  Application app;

describe("Application", (){

    describe("default", (){

      beforeEach((){
        backend = new MockHttpBackend();
        routerTest= new RouterTestDouble();
        app = new Application();
        app
        ..value(HttpBackend, backend)
        ..value(Router, routerTest);
      });

      afterEach(() {
        backend.verifyNoOutstandingRequest();
      });
      it("is should set the correct defaults", (){


        expect(app.added).toBeFalshy();
      });
    });
});




}