angular.module('KMS').requires.push('ngFileUpload')    

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
    fd.append('gallery[title]', $scope.gallery.title || 'Галерея')
    fd.append('gallery[poster]', $scope.gallery.poster)
    fd.append('gallery[h1]', $scope.gallery.h1 || '')
    fd.append('gallery[meta_title]', $scope.gallery.meta_title || '')
    fd.append('gallery[meta_keywords]', $scope.gallery.meta_keywords || '')
    fd.append('gallery[meta_description]', $scope.gallery.meta_description || '')
    $scope.store.withHttpConfig({ transformRequest: angular.identity }).post(fd, null, {"Content-Type": undefined}).then ->
      $state.go('galleries')
    ,->
      console.log('bug')

  $scope.update = ->
    fd = new FormData
    fd.append('gallery[title]', $scope.gallery.title)
    fd.append('gallery[h1]', $scope.gallery.h1)
    fd.append('gallery[meta_title]', $scope.gallery.meta_title)
    fd.append('gallery[meta_keywords]', $scope.gallery.meta_keywords)
    fd.append('gallery[meta_description]', $scope.gallery.meta_description)
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
          fields: { 'picture[gallery_id]' : $scope.gallery.id, 'picture[picture]' : file }
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

  $scope.galleriesSortableOptions =
    orderChanged: (event)->
      for gallery, index in event.dest.sortableScope.modelValue
        gallery_copy =
          id: gallery.id
          position: index
        Restangular.restangularizeElement($scope.model, gallery_copy, 'galleries').put()
        

angular.module('KMS')
    .controller('GalleriesController', ['$scope', '$state', '$cookieStore', '$timeout', 'Upload', 'Restangular', '$stateParams', '$http', GalleriesController])
