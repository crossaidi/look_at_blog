# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./services/main
#= require_tree ./controllers/main

Lookatblog = angular.module('Lookatblog', ['ngRoute', 'flow'])

Lookatblog.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true);

  $routeProvider
  .when('/posts/:postId/edit', { templateUrl: '/assets/mainEditPost.html', controller: 'editPostController' } )
  .when('/posts/new', { templateUrl: '/assets/mainCreatePost.html', controller: 'createPostController' } )
  .when('/posts/:postId', { templateUrl: '/assets/mainPost.html', controller: 'postController' } )
  .otherwise({ templateUrl: '/assets/mainIndex.html', controller: 'indexController' } )
])

Lookatblog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])