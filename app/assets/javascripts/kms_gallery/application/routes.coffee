'use strict'

angular.module('KMS').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

    # Application routes
    $stateProvider
        .state('galleries', {
            url: '/kms/galleries',
            views:
              "header":
                template: "Галереи"
              "@":
                controller: 'GalleriesController',
                controllerAs: 'galleries',
                templateUrl: 'galleries/index.html',
        })
        .state('galleries.new', {
            url: '/new',
            views:
              "header@":
                template: "Новая галерея"
              "@":
                controller: 'GalleriesController',
                controllerAs: 'galleries',
                templateUrl: 'galleries/new.html',
        })
        .state('galleries.edit', {
            url: '/:id/edit',
            views:
              "header@":
                template: "Редактирование Галереи"
              "@":
                controller: 'GalleriesController',
                controllerAs: 'galleries',
                templateUrl: 'galleries/edit.html',
        })
]
