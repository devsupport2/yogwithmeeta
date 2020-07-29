app.controller('adminLoginCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	$scope.setflag = function(){
		$scope.emailError = 0;
		$scope.passwordError = 0;
		$scope.loginSpin = 0;
	}
	$scope.checkAdminLogin = function() {
		if (!$scope.email) {			
			$scope.emailError = 1;
			$scope.emailMsg = "Please enter your email!";
			document.getElementById("email").focus();			
		} else if (!$scope.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter your password!";
			document.getElementById("password").focus();
		} else {
			$scope.loginSpin = 1;
			var link = baseUrl+'checkLogin?email='+$scope.email+'&password='+$scope.password;			
			$http.post(link).success(function(data, status, headers, config) {
				$scope.checklogin = data;				
				$scope.loginSpin = 0;
				if ($scope.checklogin == "Success") {
					toastr.success('Login Successful');
					$timeout(function() {						
						$window.location.href = adminurl + 'dashboard';
					}, 2000);
				} 
				if($scope.checklogin == "Fail") {
					toastr.error('Invalid username or password.');					
				}
			}).error(function(data, status, headers, config) {
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
	}
	
});