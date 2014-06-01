angular.module('Lookatblog').factory('postService', ['$http', '$location', ($http, $location) ->
  postService =
    data: []

  postService.loadPosts = (deferred) ->
    $http.get('/api/posts').success( (data) ->
      iterator = (e) ->
        e.thumb = if e.image_file_name
                    '/uploads/images/thumb/' + e.image_file_name
                  else
                    ''
      _.each(data, iterator)

      postService.data.posts = data

      if deferred
        deferred.resolve()
    ).error( ->
      console.error('Failed to load posts.')
      if deferred
        deferred.reject('Failed to load posts.')
    )

  postService.createPost = (newPost) ->

    data = getFormData(newPost)

    $http.post('/api/posts', data).success( (data) ->
      postService.data.posts.push(data)
      $location.url('/posts/' + data.id)
    ).error( ->
      console.error('Failed to create new post.')
    )

    return true

  postService.updatePost = (postId, updatePost) ->

    data = getFormData(updatePost)

    $http.put('/api/posts/' + postId, data).success( (data) ->
      $location.url('/posts/' + postId)
    ).error( ->
      console.error('Failed to update post.')
    )

    return true

  postService.deletePost = (postId) ->
    $http.delete('/api/posts/' + postId).success( (data) ->
      $location.url('/')
    ).error( ->
      console.error('Failed to delete post.')
    )

  postService.loadPost = (postId, deferred) ->
    $http.get('/api/posts/' + postId).success( (data) ->
      data.medium = if data.image_file_name
        '/uploads/images/medium/' + data.image_file_name
      else
        ''
      postService.data.post = data
      if deferred
        deferred.resolve()
    ).error( ->
      console.error('Failed to edit post.')
      if deferred
        deferred.reject('Failed to edit post.')
    )

  postService.validateFields = ($scope) ->
    if !$scope.formData.name || !$scope.formData.body
      $scope.unvalidate = true
      return false
    else
      return true

  getFormData = (formData) ->
    data =
      post:
        name: formData.name
        body: formData.body

    if formData.postImage
      data.post.image =
        imagePath: formData.postImage.path
        imageContent: formData.postImage.type
        imageData: formData.postImage.data

    if formData.postImage == 'cleared'
      data.post.image = null

    data

  return postService
])