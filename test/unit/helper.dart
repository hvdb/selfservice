part of self_service_test;

waitForHttp(future, callback) =>
scheduleMicrotask(() {
  inject((MockHttpBackend http) => http.flush());
  future.then(callback);
});