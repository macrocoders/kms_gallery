GalleriesController = ($scope, $state, $cookieStore, $timeout, Upload, Restangular, $stateParams, $http) ->
  $scope.store = Restangular.all('galleries')
  $scope.$state = $state

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

  $scope.create = ->
    fd = new FormData
    fd.append('gallery[title]', $scope.gallery.title)
    fd.append('gallery[poster]', $scope.gallery.poster)
    $scope.store.withHttpConfig({ transformRequest: angular.identity }).post(fd, null, {"Content-Type": undefined}).then ->
      $state.go('galleries')
    ,->
      console.log('bug')

  $scope.update = ->
    fd = new FormData
    fd.append('gallery[title]', $scope.gallery.title)
    if $scope.gallery.poster.constructor.name == "File"
      fd.append('gallery[poster]', $scope.gallery.poster)
    $scope.gallery.withHttpConfig({ transformRequest: angular.identity }).post('', fd, '', {"Content-Type": undefined}).then ->
      $state.go('galleries')
    ,->
      console.log('bug')

  $scope.uploadPictures = (files, gallery) ->
    if files and files.length
      $scope.files = files
      angular.forEach files, (file) ->
        file.upload = Upload.upload(
          url: 'kms/galleries/'+$scope.gallery.id+'/pictures'
          method: 'POST'
          fields: { 'picture[gallery_id]' : $scope.gallery.id }
          file: {'picture[picture]' : file})
        file.upload.then ((response) ->
          $timeout ->
            file.result = response.data
            if file == files[files.length - 1]
              $state.go $state.current, {}, reload: true
        ), ((response) ->
          if response.status > 0
            $scope.errorMsg = response.status + ': ' + response.data
        ), (evt) ->
          file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total))

  $scope.destroyPicture = (idx, gallery)->
    picture_to_delete = $scope.gallery.pictures[idx]
    if(confirm('Вы уверены?'))
      $http.delete('kms/galleries/pictures/'+picture_to_delete.id).then ->
        gallery.pictures.splice(idx, 1)

angular.module('KMS')
    .controller('GalleriesController', ['$scope', '$state', '$cookieStore', '$timeout', 'Upload', 'Restangular', '$stateParams', '$http', GalleriesController])
