app.controller('confirmPay', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	
	$scope.getCourseDetailForPay = function(courseId, userid)
	{
		if(!courseId || !userid)
		{
			$window.location.href = url;
		}
		var link = baseUrl+'getCourseDetailById?Id='+courseId;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.courseDetail = data;
			if($scope.courseDetail)
			{
				document.title = $scope.courseDetail.courceTitle+" | Pay Now";
			}
			else{
				$window.location.href = url;
			}
		}).error(function(data, status, headers, config) {
			$scope.courseDetail = "Response Fail";
		});
	}
	
	$scope.PayNow = function(courseId,userid){
		$scope.spin = 1;
		var link = baseUrl+'payPaymentOnline?courseId='+courseId+'&userid='+userid+'&amount='+$scope.courseDetail.courseFee;			
		$http.post(link).success(function(data, status, headers, config) {
			$scope.addorder = data;
			if($scope.addorder == "Success")
			{
				$scope.spin =0;
				$window.location.href = url+'dataform';
			}else if($scope.addorder == "Paid")
			{
				$scope.spin =0;
				$window.location.href = url+'order_confirmation';
			}
		}).error(function(data, status, headers, config) {
			$scope.addorder = data;
			$scope.spin = 0;
			$scope.userSubmitError = 1;
			$scope.msgError = $scope.addorder;				
		});
	}
	

});