@editPostController = ($scope, $location, $q, $routeParams, postService) ->

  $scope.formData =
    postId: $routeParams.postId
    postName: ''
    postBody: ''

  $scope.setCurrentData = ->
    post = postService.data.post
    $scope.formData.postName = post.name
    $scope.formData.postBody = post.body

  @deferred = $q.defer()
  @deferred.promise.then($scope.setCurrentData)

  postService.loadPost($routeParams.postId, @deferred)

  $scope.updatePost = ->
    postService.updatePost($routeParams.postId, $scope.formData)

  $scope.clearPost = ->
    $scope.formData.postName = ''
    $scope.formData.postBody = ''

@editPostController.$inject = ['$scope', '$location', '$q', '$routeParams', 'postService']