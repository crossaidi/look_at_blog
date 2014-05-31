angular.module('Lookatblog').factory('postService', ['$http', '$location', ($http, $location) ->
  postService =
    data: []

  postService.loadPosts = (deferred) ->
    $http.get('/posts').success( (data) ->
      postService.data.posts = data
      if deferred
        deferred.resolve()
    ).error( ->
      console.error('Failed to load posts.')
      if deferred
        deferred.reject('Failed to load posts.')
    )

  postService.createPost = (newPost) ->

    if newPost.postName == '' || newPost.postBody == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    data =
      post:
        name: newPost.postName
        body: newPost.postBody

    $http.post('/posts', data).success( (data) ->
      postService.data.posts.push(data)
      $location.url('/posts/' + data.id)
    ).error( ->
      console.error('Failed to create new post.')
    )

    return true

  postService.updatePost = (postId, updatePost) ->

    if updatePost.postName == '' || updatePost.postBody == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    data =
      post:
        name: updatePost.postName
        body: updatePost.postBody

    $http.put('/posts/' + postId, data).success( (data) ->
      $location.url('/posts/' + postId)
    ).error( ->
      console.error('Failed to update post.')
    )

    return true

  postService.deletePost = (postId) ->
    $http.delete('/posts/' + postId).success( (data) ->
      $location.url('/')
    ).error( ->
      console.error('Failed to delete post.')
    )

  postService.loadPost = (postId, deferred) ->
    $http.get('/posts/' + postId).success( (data) ->
      console.log(data)
      postService.data.post = data
      if deferred
        deferred.resolve()
    ).error( ->
      console.error('Failed to edit post.')
      if deferred
        deferred.reject('Failed to edit post.')
    )

  return postService
])