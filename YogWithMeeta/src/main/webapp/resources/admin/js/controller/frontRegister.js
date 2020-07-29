app.controller('frontRegisterCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	$scope.user = new Object();
	var link = baseUrl+'getCountry';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getCountry = data;
	}).error(function(data, status, headers, config) {
		$scope.getCountry = "Response Fail";
	});
	
	$scope.onCountryChange= function(countryid){
		var link = baseUrl+'GetRelatedState?countryid='+countryid;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getState = data;
		}).error(function(data, status, headers, config) {
			$scope.getState = "Response Fail";
		});
	}
	
	$scope.setFlag = function(){
		$scope.firstNameError = 0;
		$scope.emailError = 0;
		$scope.mobileNoError = 0;
		$scope.passwordError = 0;
		$scope.confirmPasswordError = 0;
		$scope.userError = 0;
		$scope.userError1 = 0;
	}
	
	$scope.checkEmailaddress = function()
	{
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($scope.user.email))
		  {
		    return (true)
		  }
		$scope.emailError = 1;
		$scope.emailMsg = "Please enter valid Email";
		document.getElementById("email").focus();
	}
	
	$scope.user;
	$scope.registerUser = function() {	
		const urlParams = new URLSearchParams(window.location.search);
		
		if(urlParams.has('courseId')){
			$scope.courseID = urlParams.get('courseId');
		}
		$scope.user.loginBy = "WebApp";
		$scope.user.userTypeId = 3;
		
		if(!$scope.user.lastName) {
			$scope.user.lastName = null;
		}
		
		if(!$scope.user.dateOfBirth) {
			$scope.user.dateOfBirth = null;
		}
		if(!$scope.user.healthProblem) {
			$scope.user.healthProblem = null;
		}
		if(!$scope.user.specificRequirement) {
			$scope.user.specificRequirement = null;
		}
		
		if(!$scope.user.firstName) {			
			$scope.firstNameError = 1;
			$scope.firstNameMsg = "Please enter first name";
			document.getElementById("firstname").focus();
		} else if (!$scope.user.email) {			
			$scope.emailError = 1;
			$scope.emailMsg = "Please enter email";
			document.getElementById("email").focus();
		} else if (!$scope.user.mobileNo) {			
			$scope.mobileNoError = 1;
			$scope.mobileNoMsg = "Please enter mobile number";
			document.getElementById("mobileno").focus();
		} else if (!$scope.user.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter password";
			document.getElementById("password").focus();
		} else if (!$scope.user.confirmPassword) {			
			$scope.confirmPasswordError = 1;
			$scope.confirmPasswordMsg = "Please enter password again";
			document.getElementById("confirmpassword").focus();
		} else if ($scope.user.password != $scope.user.confirmPassword) {			
			$scope.confirmPasswordError = 1;
			$scope.confirmPasswordMsg = "Please enter same password";
			document.getElementById("confirmpassword").focus();
		} else {			
			$scope.spinUser = 1;		
			var link = baseUrl+'addUser';			
			$http({url: link, method: "POST", data: $scope.user}).success(function(data, status, headers, config) {
				$scope.adduser = data;				
    			if($scope.adduser == "Success"){
    				$scope.spinUser = 0;
    				$scope.successMsg = "Login Successful.";
    				if($scope.courseID)
    				{
    					$window.location.href = url + 'confirm-registration?courseId='+$scope.courseID;
    				}else{
    					$window.location.href = url;
    				}
    			} 
				if($scope.adduser != "Success") {
    				$scope.spinUser = 0;
    				$scope.userError = 1;
    				$scope.userError1 = 1;
    			} 			
			}).error(function(data, status, headers, config) {
				$scope.adduser = data;
				$scope.spinUser = 0;
				$scope.userError = 1;
				$scope.errorMsg = "Something went wrong! Please try again after sometime!";
				document.getElementById("email").focus();
			});	    			
		}
	}
	
	$scope.loginUser = function(){
		if($scope.rememberMe)
			{
				$scope.loggedin = 'y';
			}
		else{$scope.loggedin = 'n';}
		if (!$scope.email) {			
			$scope.emailError = 1;
			$scope.emailMsg = "Please enter valid email";
			document.getElementById("email").focus();
		} else if (!$scope.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter the password associated with "+$scope.email;
			document.getElementById("password").focus();
		}else {
			$scope.loginSpin = 1;
			var link = baseUrl+'checkLogin?email='+$scope.email+'&password='+$scope.password+'&loggedin='+$scope.loggedin;
			$http.post(link).success(function(data, status, headers, config) {
				$scope.checklogin = data;				
				$scope.loginSpin = 0;
				if ($scope.checklogin == "Success") {						
						$window.location.href = baseUrl;
				} 
				if($scope.checklogin == "Fail") {
					$scope.userError = 1;
					$scope.errorMsg = 'Invalid username or password.';					
				}
			}).error(function(data, status, headers, config) {
				$scope.userError = 1;
				$scope.errorMsg = 'Something wrong! Please try after sometime!';			
			});
		}
	}
	
	$scope.passwordReset = function()
	{
		const urlParams = new URLSearchParams(window.location.search);
		const myParam = urlParams.get('email');
		$scope.user.email = myParam;
		if (!$scope.user.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter password";
			document.getElementById("password").focus();
		} else if (!$scope.user.confirmPassword) {			
			$scope.confirmPasswordError = 1;
			$scope.confirmPasswordMsg = "Please enter password again";
			document.getElementById("confirmpassword").focus();
		} else if ($scope.user.password != $scope.user.confirmPassword) {
			$scope.confirmPasswordError = 1;
			$scope.confirmPasswordMsg = "Please enter same password";
			document.getElementById("confirmpassword").focus();
		} else {
			/*if(strongRegex.test(document.getElementById("password").value) || mediumRegex.test(document.getElementById("password").value)){*/
			var link = baseUrl+'updatePass';
			$scope.spinUser = 1;
			$http({url: link, method: "POST", data: $scope.user}).success(function(data, status, headers, config) {
				$scope.updateuserPass = data;	
				/*$window.alert($scope.updateuserPass);*/
				if($scope.updateuserPass == "Success"){
    				$scope.loginSuccess = 1;
    				$scope.successMsg = "Password updated successfully";
    				$timeout(function() {
    					$scope.loginSuccess = 0;
    					$window.location.href = baseUrl+"login";
    				}, 3000);
    			} 
				if($scope.updateuserPass == "NotAllowed"){
    				$scope.loginError = 1;
    				$scope.errorMsg = "You are not allowed to change password";
    				$timeout(function() {
    					$scope.loginSuccess = 0;
        				$window.location.href = url;
    				}, 3000);
    			}
			}).error(function(data, status, headers, config) {
				$scope.updateuserPass = data;
				$scope.loginError = 1;
				$scope.errorMsg = "Something went wrong! Please try again after sometime!";
			});	
			/*}
			else{
				$scope.passwordError = 1;
				$scope.passwordMsg = "Password is not strong enough";
				document.getElementById("password").focus();
			}*/
			
		}
	}
	
	$scope.forgotPass = function(){
		if(!$scope.email)
    	{
    		$scope.emailError = 1;
    		$scope.emailMsg = "Please enter email";
    		document.getElementById("email").focus();
    	}
		else
		{
			$scope.loginSpin = 1;
			var link = baseUrl+'ForgotPassword?&email='+$scope.email; 
			$http.post(link).success(function(data, status, headers, config) {
				$scope.logindata = data;
				if($scope.logindata == "Success"){
					$scope.loginSpin = 0;
					$scope.userSuccess = 1;
            		$scope.errorMsg="Please check your email address to reset password";	    			    			
    			} else {
    				$scope.userError = 1;
            		$scope.errorMsg="No user available with us for the above entered email";
    				$timeout(function(){
    					$scope.loginError = 0;    					
    				}, 5000);
    			}				
			}).error(function(data, status, headers, config) {
				$scope.userError = 1;
				$scope.errorMsg = "something went wrong contact dev support";
				$timeout(function(){
					$scope.userError = 0;    					
				}, 5000);
			});
			
		}
	}

});