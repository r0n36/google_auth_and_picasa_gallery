@photogallery.controller 'PhotoNewController', ['$scope', '$location', '
  $http', ($scope, $location, $http) ->
  $scope.photos = []
  $http.get('./photos/new.json').success((data) ->
    $scope.photos = data
  )
]