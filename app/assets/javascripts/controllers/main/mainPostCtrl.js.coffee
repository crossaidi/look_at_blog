@postController = ($scope, $location, $q, $routeParams, postService) ->
  $scope.postId = $routeParams.postId

  $scope.setCurrentData = ->
    $scope.current = postService.data.post

  @deferred = $q.defer()
  @deferred.promise.then($scope.setCurrentData)

  postService.loadPost($routeParams.postId, @deferred)

  $scope.deletePost = (postId) ->
    postService.deletePost(postId)

@postController.$inject = ['$scope', '$location', '$q', '$routeParams', 'postService']