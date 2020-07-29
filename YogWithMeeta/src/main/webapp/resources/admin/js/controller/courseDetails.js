app.controller('courseDetailCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	$scope.getLink = function(vidId){
		$scope.vidLink="//www.youtube.com/embed/"+vidId;
		$scope.vidLinkkk="<iframe src='https://www.youtube.com/embed/"+vidId+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
		document.getElementById(vidId).innerHTML = $scope.vidLinkkk;
	}
	$scope.getCourseDetail = function(courseId)
	{
		var link = baseUrl+'getCourseDetailById?Id='+courseId;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.courseDetail = data;
			if($scope.courseDetail)
			{
				document.title = $scope.courseDetail.courceTitle+" | Course Detail";
			}
			else{
				document.title ="Failed | Course Detail";
			}
		}).error(function(data, status, headers, config) {
			$scope.courseDetail = "Response Fail";
		});
	}
	
	$scope.shortenDays = function(scheduleDays){
		var arr = scheduleDays.split(',');
		$scope.ShortenDays = [];
		for (var i=0;i<arr.length;i++){
			console.log(arr[i].substring(0,3));
			$scope.ShortenDays.push(arr[i].substring(0,3));
		}
	}

});