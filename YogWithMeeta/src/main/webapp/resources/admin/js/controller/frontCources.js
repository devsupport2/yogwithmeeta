app.controller('CourseCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	$scope.todaydate = $filter('date')(new Date(),'yyyy-MM-dd');
	
	var link = baseUrl+'getAllCourseFront';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCourseFront = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCourseFront = "Response Fail";
	});
	
	
	$scope.shortenDays = function(scheduleDays){
		var arr = scheduleDays.split(',');
		$scope.ShortenDays = [];
		for (var i=0;i<arr.length;i++){
			console.log(arr[i].substring(0,3));
			$scope.ShortenDays.push(arr[i].substring(0,3));
		}
		
	}

});