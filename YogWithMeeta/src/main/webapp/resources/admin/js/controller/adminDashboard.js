app.controller('adminDashboardCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	var link = baseUrl+'getAllCounts';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCounts = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCounts = "Response Fail";
	});
	
});