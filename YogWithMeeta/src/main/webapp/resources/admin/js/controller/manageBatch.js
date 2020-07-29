app.controller('batchCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	var link = baseUrl+'getAllCounts';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCounts = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCounts = "Response Fail";
	});
	
	$scope.BatchStartTime = "06:00";
	$scope.BatchEndTime = "07:00";
	$scope.currentPage = 0;
	$scope.pageSize = 10;
	$scope.search = '';
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500];
	
	var link = baseUrl+'getBatchByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getBatchList = data;
	}).error(function(data, status, headers, config) {
		$scope.getBatchList = "Response Fail";
	});
	
	$scope.getBatchListByCall = function(){
		var link = baseUrl+'getBatchByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getBatchList = data;
		}).error(function(data, status, headers, config) {
			$scope.getBatchList = "Response Fail";
		});
	}
	
	$scope.setflag = function(){
		$scope.batchNameError = 0;
		$scope.startTimeError = 0;
		$scope.endTimeError = 0;
		$scope.batchSpin = 0;
	}
	
	
	$scope.addBatch = function(){
		$scope.description = CKEDITOR.instances.editor1.getData();
		if(!$scope.description){
			$scope.description = "";
		}
		if (!$scope.BatchName) {			
			$scope.batchNameError = 1;
			$scope.batchNameMsg = "Please enter Batch Name";
			document.getElementById("BatchName").focus();			
		} else if (!$scope.BatchStartTime) {			
			$scope.startTimeError = 1;
			$scope.startTimeMsg = "Please enter Time";
			document.getElementById("BatchStartTime").focus();
		} else if (!$scope.BatchEndTime) {			
			$scope.endTimeError = 1;
			$scope.endTimeMsg = "Please enter Time";
			document.getElementById("BatchEndTime").focus();
		} else {
			$scope.batchSpin = 1;
			var str1 = $scope.description.replace(/&/g, "$");
			var str2 = str1.replace(/#/g, "~");
			var str3 = str2.replace(/%/g, "!");
			$scope.description = str3;
			var link = baseUrl+'addBatch?batchName='+$scope.BatchName+'&startTime='+$scope.BatchStartTime+'&endTime='+$scope.BatchEndTime+'&description='+$scope.description;	
			$http.post(link).success(function(data, status, headers, config) {
				$scope.addBatch = data;				
				$scope.batchSpin = 0;
				if ($scope.addBatch == "Success") {
					toastr.success('Batch added successfully');
					$timeout(function() {						
						$window.location.href = adminurl + 'add-batch';
					}, 2000);
				} 
				if($scope.addBatch == "Fail") {
					toastr.error('Unfortunately Something went Wrong');				
				}
			}).error(function(data, status, headers, config) {
				$scope.batchSpin = 0;
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
		
	}
	
	$scope.getBatchDetailById = function(batchid) {
		var link = baseUrl+'getBatchDetailById?batchid='+batchid;		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.batchDetail = data;
			$scope.id = $scope.batchDetail.batchId; 
			$scope.BatchNameEdit = $scope.batchDetail.batchName;
			$scope.BatchStartTimeEdit = $scope.batchDetail.batchStartTime;
			$scope.BatchEndTimeEdit = $scope.batchDetail.batchEndTime;
			CKEDITOR.instances.editor1Edit.setData($scope.batchDetail.batchDescription);
			
		}).error(function(data, status, headers, config) {
			$scope.batchDetail = "Response Fail";
		});
	}
	
	$scope.editBatch = function(){
		$scope.descriptionEdit = CKEDITOR.instances.editor1Edit.getData();
		if(!$scope.descriptionEdit){
			$scope.descriptionEdit = "";
		}
		if (!$scope.BatchNameEdit) {			
			$scope.batchNameError = 1;
			$scope.batchNameMsg = "Please enter Batch Name";
			document.getElementById("BatchNameEdit").focus();			
		} else if (!$scope.BatchStartTimeEdit) {			
			$scope.startTimeError = 1;
			$scope.startTimeMsg = "Please enter Time";
			document.getElementById("BatchStartTimeEdit").focus();
		} else if (!$scope.BatchEndTimeEdit) {			
			$scope.endTimeError = 1;
			$scope.endTimeMsg = "Please enter Time";
			document.getElementById("BatchEndTimeEdit").focus();
		} else {
			$scope.batchSpin = 1;
			var str1 = $scope.descriptionEdit.replace(/&/g, "$");
			var str2 = str1.replace(/#/g, "~");
			var str3 = str2.replace(/%/g, "!");
			$scope.descriptionEdit = str3;
			var link = baseUrl+'editBatch?batchId='+$scope.id+'&batchName='+$scope.BatchNameEdit+'&startTime='+$scope.BatchStartTimeEdit+'&endTime='+$scope.BatchEndTimeEdit+'&description='+$scope.descriptionEdit;	
			$http.post(link).success(function(data, status, headers, config) {
				$scope.editBatch = data;				
				$scope.batchSpin = 0;
				if ($scope.editBatch == "Success") {
					toastr.success('Batch Updated successfully');
					$timeout(function() {						
						$window.location.href = adminurl + 'add-batch';
					}, 2000);
				} else{
					toastr.error($scope.editBatch);				
				}
			}).error(function(data, status, headers, config) {
				$scope.batchSpin = 0;
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
		
	}
	
	
	$scope.delete = function(batchid) {
		var link = baseUrl+'deleteBatch?batchid='+batchid;
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deletebatch = data;
			$('#deleteModal').modal('hide');
			toastr.success('Batch deleted!');
			$scope.getBatchListByCall();
		}).error(function(data, status, headers, config) {
			$scope.deletebatch = "Response Fail";
			toastr.error('Something went wrong!');
		});
	}
	
});