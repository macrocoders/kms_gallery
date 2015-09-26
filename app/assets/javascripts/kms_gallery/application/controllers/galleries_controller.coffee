GalleriesController = ($scope, $state, $cookieStore, Upload, Restangular, $stateParams) ->
  $scope.store = Restangular.all('galleries')

  $scope.store.getList().then (galleries)->
    $scope.galleries = galleries

  if $stateParams.id
    $scope.store.get($stateParams.id).then (gallery)->
      $scope.gallery = gallery
  else
    $scope.gallery = {}

  $scope.destroy = (gallery)->
    if(confirm('Вы уверены?'))
      gallery.remove().then ->
        $scope.galleries = _.without($scope.galleries, gallery)

  $scope.create = (files) ->
    if files and files.length
      $scope.upload = Upload.upload(
        url: 'kms/galleries'
        method: 'POST'
        fields: { 'gallery[title]' : $scope.gallery.title }
        file: {'gallery[images]':files, 'gallery[poster]': $scope.gallery.poster}).then ->
          $state.go('galleries')
        ,->
          console.log('error')

  $scope.update = (files) ->
    updateUrl = 'kms/galleries/'+$scope.gallery.id
    $scope.upload = Upload.upload(
      url: updateUrl
      method: 'PUT'
      fields: { 'id' : $scope.gallery.id, 'gallery[title]': $scope.gallery.title, 'gallery[poster]': $scope.gallery.poster}
      file: {'gallery[images]':files}).then ->
        $state.go('galleries')
      ,->
        console.log('error')

angular.module('KMS')
    .controller('GalleriesController', ['$scope', '$state', '$cookieStore', 'Upload', 'Restangular', '$stateParams', GalleriesController])
