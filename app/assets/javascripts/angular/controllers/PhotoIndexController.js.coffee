@photogallery.controller 'PhotoIndexController', ['$scope', '$location', '
  $http', ($scope, $location, $http) ->
  $scope.photos = []
  $http.get('./photos.json').success((data) ->
    $scope.photos = data
  )

  $scope.viewPhoto = (id) ->
  $location.url "/photos/#{id}"
]