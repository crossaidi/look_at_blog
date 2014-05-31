@createPostController = ($scope, $location, postService) ->

  $scope.data = postService.data

  postService.loadPosts(null)

  $scope.formData =
    postName: ''
    postBody: ''

  $scope.newPost = ->
    $location.url('/posts/new')

  $scope.createPost = ->
    postService.createPost($scope.formData)

  $scope.clearPost = ->
    $scope.formData.postName = ''
    $scope.formData.postBody = ''

@createPostController.$inject = ['$scope', '$location', 'postService']