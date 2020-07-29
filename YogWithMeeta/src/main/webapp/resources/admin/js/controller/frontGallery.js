app.controller('galleryCtrl', function($scope, $http, $window, $filter,
			$location, $timeout) {	
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	var link = baseUrl+'getAllAlbumWithImages';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAlbums = data;
	}).error(function(data, status, headers, config) {
		$scope.getAlbums = "Response Fail";
	});
});