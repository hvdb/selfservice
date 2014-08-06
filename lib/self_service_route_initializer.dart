part of  self_service;


void SelfServiceRouterInitializer(Router router, RouteViewFactory views) {

    views.configure({
        'view_default': ngRoute(
            defaultRoute: true,
            enter: (RouteEnterEvent e) =>
            router.go('list', {},
            startingFrom: router.root.getRoute('applications'),
            replace: true)),

        'applications': ngRoute(path: '/applications', mount: {
            'list': ngRoute(path: '/view', view: 'views/applications/index.html'),
            'add': ngRoute(path: '/add', view: 'views/applications/new.html')
        }),
        'application': ngRoute(path: '/application/:applicationId', mount: {
            'view': ngRoute(path: '/view', view: 'views/applications/view.html'),
            'edit': ngRoute(path: '/edit', view: 'views/applications/edit.html')
        })
    });

}
