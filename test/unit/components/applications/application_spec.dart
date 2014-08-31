part of self_service_test;

class RouterTestDouble extends TestDouble implements Router {}
class HttpTestDouble extends TestDouble implements Http {}

testApplication(){
 var http, router;

describe("Application", (){
    describe("default", (){
      it("is should set the correct defaults", (){

        http = new HttpTestDouble();
        router = new RouterTestDouble();

        final app = new Application(http, router);

        expect(app.added).toBeFalshy();
      });
    });
});




}