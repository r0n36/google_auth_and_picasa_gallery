@photogallery = angular.module('photogallery', [])


@photogallery.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/photos', {
    templateUrl: '../templates/photos/index',
    controller: 'Photos'
  }).when('/photos/:id', {
    templateUrl: '../templates/photos/show',
    controller: 'Photos'
  }).
  otherwise({
      templateUrl: '../templates/photos/index',
      controller: 'Photos'
    })
])