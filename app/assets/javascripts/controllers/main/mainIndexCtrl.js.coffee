@indexController = ($scope, $location, $http, postService) ->

  $scope.data = postService.data
  postService.loadPosts(null)

 @indexController.$inject = ['$scope', '$location', '$http', 'postService']