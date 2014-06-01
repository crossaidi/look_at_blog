@createPostController = ($scope, $location, postService) ->
  $scope.initFlow = (flow) ->
    $scope.flow = flow

  $scope.formData = {}
  $scope.unvalidate = false

  $scope.createPost = ->
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

        postService.createPost($scope.formData)

      reader.readAsBinaryString(file);
    else
      postService.createPost($scope.formData)

  $scope.clearPost = ->
    $scope.formData = {}
    $scope.formData.postImage = 'cleared'

@createPostController.$inject = ['$scope', '$location', 'postService']