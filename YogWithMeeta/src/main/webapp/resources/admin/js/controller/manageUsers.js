app.controller('userCtrl', ['$scope', '$filter', '$http', '$window', '$location', '$timeout' ,
	function ($scope, $filter, $http, $window, $location, $timeout) {
	var baseUrl = $location.protocol()+"://"+location.host+url;
	
	$scope.currentPage = 0;
	$scope.pageSize = 10;
	$scope.search = '';
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500];
	
	var link = baseUrl+'getUsersByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getUserList = data;
	}).error(function(data, status, headers, config) {
		$scope.getUserList = "Response Fail";
	});
	
	var link = baseUrl+'getCountry';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getCountry = data;
	}).error(function(data, status, headers, config) {
		$scope.getCountry = "Response Fail";
	});
	
	var link = baseUrl+'getState';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getState = data;
	}).error(function(data, status, headers, config) {
		$scope.getState = "Response Fail";
	});
	
	$scope.getUserListByCall =function(){
		var link = baseUrl+'getUsersByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getUserList = data;
		}).error(function(data, status, headers, config) {
			$scope.getUserList = "Response Fail";
		});
	}
	
	$scope.onCountryChange= function(countryid){
		var link = baseUrl+'GetRelatedState?countryid='+countryid;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getState = data;
		}).error(function(data, status, headers, config) {
			$scope.getState = "Response Fail";
		});
	}
	
	$scope.getUserDetailById = function(userid){
		var link = baseUrl+'getUserDetailById?userid='+userid;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.userDetail = data;
			$scope.userId =  $scope.userDetail.userId;
		}).error(function(data, status, headers, config) {
			$scope.userDetail = "Response Fail";
		});
	}
	
	$scope.searchUser = function() {		
		if(!$scope.search) {
			link = baseUrl+'getUserByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getUserList = data;
			}).error(function(data, status, headers, config) {
				$scope.getUserList = "Response Fail";
			});
		} else {
			var link = baseUrl+'searchUser?keyword='+$scope.search;			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getUserList = data;
			}).error(function(data, status, headers, config) {
				$scope.getUserList = "Response Fail";
			});
		}
	}
	
	$scope.editUserByAdmin = function(userid) {
		$scope.userDetail.userTypeId = 3;
		if (!$scope.userDetail.firstName) {
			$scope.userDetail.firstName = "";
		}
		if (!$scope.userDetail.lastName) {
			$scope.userDetail.lastName = "";
		}
		if (!$scope.userDetail.mobileNo) {
			$scope.userDetail.mobileNo = "";
		}
		if (!$scope.userDetail.gender) {
			$scope.userDetail.gender = "";
		}
		if (!$scope.userDetail.dateOfBirth) {
			$scope.userDetail.dateOfBirth = "10/01/2020";
		}
		
		if (!$scope.userDetail.email) {			
			$scope.emailError = 1;
			$scope.emailMsg = "Please enter email!";
			document.getElementById("emailedit").focus();
		} else if (!$scope.userDetail.password) {			
			$scope.passwordError = 1;
			$scope.passwordMsg = "Please enter password!";
			document.getElementById("passwordedit").focus();
		} else {
			$scope.spinUser = 1;
			$scope.a = 0;
			
			var link = baseUrl+'editUserByAdmin?userid='+userid+'&usertypeid='+$scope.userDetail.userTypeId+'&userpicture='+$scope.userDetail.userImage+'&firstname='+$scope.userDetail.firstName+'&lastname='+$scope.userDetail.lastName+'&mobileno='+$scope.userDetail.mobileNo+'&gender='+$scope.userDetail.gender+'&dateofbirth='+$scope.userDetail.dateOfBirth+'&email='+$scope.userDetail.email+'&address='+$scope.userDetail.address+'&stateid='+$scope.userDetail.stateId+'&countryid='+$scope.userDetail.countryId+'&city='+$scope.userDetail.city+'&pincode='+$scope.userDetail.pincode;			
			var formData = new FormData();
			formData.append("userimage",userimage1.files[0]);			
			$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) { return data; }}).success(function(data, status, headers, config) {
				$scope.edituser = data;
				
				if($scope.edituser == "Success") {
					$scope.spinUser = 0;
					toastr.success('Data updated successfully!');
					$timeout(function(){						
						//$('#editModal').modal('hide');
						$scope.getUserByCall();
						$scope.getUserDetailById(userid);
					}, 2000);
				} else {
					$scope.spinUser = 0;
					toastr.error('Something went wrong!');							
				}
			}).error(function(data, status, headers, config) {
				$scope.edituser = data;
				toastr.error('Something went wrong!');				
			});
		}
		
	}
	
	$scope.delete = function() {
		var link = baseUrl+'deleteUser?userid='+$scope.userId;
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deleteCourse = data;
			$('#deleteModal').modal('hide');
			toastr.success('User deleted!');
			$scope.getUserListByCall();
		}).error(function(data, status, headers, config) {
			$scope.deleteCourse = "Response Fail";
			toastr.error('Something went wrong!');
		});
	}
	
}]);
