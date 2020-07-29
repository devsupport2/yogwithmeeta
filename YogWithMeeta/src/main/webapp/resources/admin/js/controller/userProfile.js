app.controller('userProfileCtrl', ['$scope', '$filter', '$http', '$window', '$location', '$timeout' ,
	function ($scope, $filter, $http, $window, $location, $timeout) {
	var baseUrl = $location.protocol()+"://"+location.host+url;
	
	var link = baseUrl+'getCountry';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getCountry = data;
	}).error(function(data, status, headers, config) {
		$scope.getCountry = "Response Fail";
	});
	
	$scope.userError = 0;
	$scope.userSuccess = 0;
	
	var link = baseUrl+'getState';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getState = data;
	}).error(function(data, status, headers, config) {
		$scope.getState = "Response Fail";
	});
	
	$scope.onCountryChange= function(countryid){
		if(countryid != "" && countryid != null ){
			var link = baseUrl+'GetRelatedState?countryid='+countryid;    
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getState = data;
			}).error(function(data, status, headers, config) {
				$scope.getState = "Response Fail";
			});
		}
		else{
			$scope.getState = [];
		}
	}
	
	$scope.GetUserDetail = function(userid)
	{
		var link = baseUrl+'getUserDetailById?userid='+userid;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.userDetail = data;
			$scope.userId =  $scope.userDetail.userId;
		}).error(function(data, status, headers, config) {
			$scope.userDetail = "Response Fail";
		});
	}
	
	
	$scope.setFlag = function(){
		$scope.firstNameError = 0;
		$scope.emailError = 0;
		$scope.mobileNoError = 0;
		$scope.passwordError = 0;
	}
	
	$scope.updateUserProfile = function(userid) {
		$scope.userDetail.userTypeId = 3;
		if (!$scope.userDetail.lastName) {
			$scope.userDetail.lastName = "";
		}
		if (!$scope.userDetail.gender) {
			$scope.userDetail.gender = "";
		}
		if (!$scope.userDetail.address) {
			$scope.userDetail.address = "";
		}
		if (!$scope.userDetail.city) {
			$scope.userDetail.city = "";
		}
		if (!$scope.userDetail.pincode) {
			$scope.userDetail.pincode = "";
		}
		if (!$scope.userDetail.dateOfBirth) {
			$scope.userDetail.dateOfBirth = "10/01/2020";
		}
		
		if(!$scope.userDetail.countryId){
			$scope.userDetail.countryId=0;
		}
		if(!$scope.userDetail.stateId){
			$scope.userDetail.stateId=0;
		}
		
		if(!$scope.userDetail.firstName) {			
			$scope.firstNameError = 1;
			$scope.firstNameMsg = "Please enter first name";
			document.getElementById("firstname").focus();
		} else if (!$scope.userDetail.email) {			
			$scope.emailError = 1;
			$scope.emailMsg = "Please enter email";
			document.getElementById("email").focus();
		} else if (!$scope.userDetail.mobileNo) {			
			$scope.mobileNoError = 1;
			$scope.mobileNoMsg = "Please enter mobile number";
			document.getElementById("mobileno").focus();
		} else if (!$scope.userDetail.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter password!";
			document.getElementById("passwordedit").focus();
		} else {
			$scope.spinUser = 1;
			$scope.a = 0;
			
			var link = baseUrl+'editUser?userid='+userid+'&usertypeid='+$scope.userDetail.userTypeId+'&userpicture='+$scope.userDetail.userImage+'&firstname='+$scope.userDetail.firstName+'&lastname='+$scope.userDetail.lastName+'&mobileno='+$scope.userDetail.mobileNo+'&gender='+$scope.userDetail.gender+'&dateofbirth='+$scope.userDetail.dateOfBirth+'&email='+$scope.userDetail.email+'&address='+$scope.userDetail.address+'&stateid='+$scope.userDetail.stateId+'&countryid='+$scope.userDetail.countryId+'&city='+$scope.userDetail.city+'&pincode='+$scope.userDetail.pincode;			
			var formData = new FormData();
			formData.append("userimage",userimage1.files[0]);			
			$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) { return data; }}).success(function(data, status, headers, config) {
				$scope.edituser = data;
				
				if($scope.edituser == "Success") {
					$scope.spinUser = 0;
					$scope.userSuccess = 1;
					$scope.errorMsg = 'Profile updated successfully!';
					$timeout(function(){						
						//$('#editModal').modal('hide');
						$window.location.reload();
						$scope.getUserByCall();
						$scope.getUserDetailById(userid);
					}, 2000);
				} else {
					$scope.spinUser = 0;
					$scope.userError = 1;
					$scope.errorMsg = 'Unable to update the profile';							
				}
			}).error(function(data, status, headers, config) {
				$scope.edituser = data;
				$scope.userError = 1;
				$scope.errorMsg = 'Unable to update the profile';			
			});
		}
		
	}
	
	
}]);