@editPostController = ($scope, $location, $q, $routeParams, postService) ->
  $scope.initFlow = (flow) ->
    $scope.flow = flow

  $scope.postId = $routeParams.postId
  $scope.formData = {}
  $scope.unvalidate = false

  $scope.setCurrentData = ->
    $scope.formData = postService.data.post

  @deferred = $q.defer()
  @deferred.promise.then($scope.setCurrentData)

  postService.loadPost($scope.postId, @deferred)

  $scope.updatePost = ->
    return false unless postService.validateFields($scope)

    if $scope.flow.files.length
      file = $scope.flow.files[0].file
      reader = new FileReader()

      reader.onload = (event) ->
        contents = event.target.result
        $scope.formData.postImage =
          data: btoa(contents)
          path: file.name
          type: file.type

        postService.updatePost($scope.postId, $scope.formData)

      reader.readAsBinaryString(file);
    else
      postService.updatePost($scope.postId, $scope.formData)

    postService.updatePost($scope.postId, $scope.formData)

  $scope.clearPost = ->
    $scope.formData = {}
    $scope.formData.postImage = 'cleared'

@editPostController.$inject = ['$scope', '$location', '$q', '$routeParams', 'postService']