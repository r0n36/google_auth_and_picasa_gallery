@restauranteur.controller 'PhotoShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./photos/#{$routeParams.id}.json").success((data) ->
    $scope.photo = data
  )
]