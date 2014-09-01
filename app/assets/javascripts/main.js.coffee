@photogallery = angular.module('photogallery', [])


@photogallery.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/photos', {
    templateUrl: '../templates/photos/index',
    controller: 'PhotoIndexController'
  }).when('/photos/:id', {
    templateUrl: '../templates/photos/show',
    controller: 'PhotoShowController'
  }).when('/photos/new', {
    templateUrl: '../templates/photos/new',
    controller: 'PhotoNewController'
  }).
  otherwise({
      templateUrl: '../templates/photos/index',
      controller: 'PhotoIndexController'
    })
])