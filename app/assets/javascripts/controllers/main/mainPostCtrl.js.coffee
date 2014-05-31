@postController = ($scope, $location, $q, $routeParams, postService) ->
  $scope.data =
    postId: $routeParams.postId
    current: {}

  $scope.setCurrentData = ->
    post = postService.data.post
    $scope.data.current.id = post.id
    $scope.data.current.name = post.name
    $scope.data.current.body = post.body

  @deferred = $q.defer()
  @deferred.promise.then($scope.setCurrentData)

  postService.loadPost($routeParams.postId, @deferred)

  $scope.deletePost = (postId) ->
    postService.deletePost(postId)

@postController.$inject = ['$scope', '$location', '$q', '$routeParams', 'postService']