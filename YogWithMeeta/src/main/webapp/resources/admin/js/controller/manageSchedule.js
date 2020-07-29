app.controller('scheduleCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;
	
	var link = baseUrl+'getAllCounts';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCounts = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCounts = "Response Fail";
	});
	
	
	$scope.currentPage = 0;
	$scope.pageSize = 10;
	$scope.search = '';
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500];
	 $scope.daysList = [
		    {name:'Sunday', value:'Sunday'},
		    {name:'Monday', value:'Monday'},
		    {name:'Tuesday', value:'Tuesday'},
		    {name:'Wednesday', value:'Wednesday'},
		    {name:'Thursday', value:'Thursday'},
		    {name:'Friday', value:'Friday'},
		    {name:'Saturday', value:'Saturday'},
		  ];
	 $scope.BatchStartTime = "06:00";
	 $scope.BatchEndTime = "07:00";
	 
	var link = baseUrl+'getAllBatchName';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getBatchNameList = data;
	}).error(function(data, status, headers, config) {
		$scope.getBatchNameList = "Response Fail";
	});
	
	var link = baseUrl+'getScheduleByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getScheduleList = data;
	}).error(function(data, status, headers, config) {
		$scope.getScheduleList = "Response Fail";
	});
	
	$scope.getScheduleListByCall = function(){
		var link = baseUrl+'getScheduleByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getScheduleList = data;
		}).error(function(data, status, headers, config) {
			$scope.getScheduleList = "Response Fail";
		});
	}
	
	$scope.getBatchTimingsById = function(batchid){
		var link = baseUrl+'getBatchTimingsById?batchId='+batchid;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.batchTimings = data;
		}).error(function(data, status, headers, config) {
			$scope.batchTimings = "Response Fail";
		});
	}

	
	$scope.setDays = function(days){
		if($scope.days){
			console.log($scope.days);
			if($scope.days.length == 7)
			{
				$scope.daysList = [{name:'Everyday', value:'Everyday'}];
				$scope.days = ["Everyday"];
			}else if($scope.days.length == 0){
				$scope.daysList = [
				    {name:'Sunday', value:'Sunday'},
				    {name:'Monday', value:'Monday'},
				    {name:'Tuesday', value:'Tuesday'},
				    {name:'Wednesday', value:'Wednesday'},
				    {name:'Thursday', value:'Thursday'},
				    {name:'Friday', value:'Friday'},
				    {name:'Saturday', value:'Saturday'},
				  ];
			}
		}
		if($scope.daysEdit){
		if($scope.daysEdit.length == 7)
		{
			$scope.daysList = [{name:'Everyday', value:'Everyday'}];
			$scope.daysEdit = ["Everyday"];
		}else if($scope.daysEdit.length == 0){
			$scope.daysList = [
			    {name:'Sunday', value:'Sunday'},
			    {name:'Monday', value:'Monday'},
			    {name:'Tuesday', value:'Tuesday'},
			    {name:'Wednesday', value:'Wednesday'},
			    {name:'Thursday', value:'Thursday'},
			    {name:'Friday', value:'Friday'},
			    {name:'Saturday', value:'Saturday'},
			  ];
		}
		/*else if($scope.days == $scope.weekends){
			$scope.daysList = [{name:'Monday', value:'Monday'},
			    {name:'Tuesday', value:'Tuesday'},
			    {name:'Wednesday', value:'Wednesday'},
			    {name:'Thursday', value:'Thursday'},
			    {name:'Friday', value:'Friday'},
			    {name:'Weekends', value:'Weekends'}];
			$scope.days = ["Weekends"];
		}*/
		}
	}

	
	$scope.setflag = function(){
		$scope.batchNameError = 0;
		$scope.startTimeError = 0;
		$scope.endTimeError = 0;
		$scope.batchSpin = 0;
		$scope.scheduleNameError = 0;
		$scope.startDateError = 0;
		$scope.endDateError = 0;
	}
	
	$scope.getBatchListByCall = function(){
			var link = baseUrl+'getAllBatchName';    
        	$http.get(link).success(function(data, status, headers, config) {
        		$scope.getBatchNameList = data;
        	}).error(function(data, status, headers, config) {
        		$scope.getBatchNameList = "Response Fail";
        	});
	}
	
	$scope.addBatch = function(){
		$scope.description = CKEDITOR.instances.editor2.getData();
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
					        $scope.getBatchListByCall();
							$('#addBatch').modal('hide');
							
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
	
	$scope.addSchedule = function(){
		$scope.fromdatetimepicker=document.getElementById("fromdatetimepicker").value;
		$scope.todatetimepicker=document.getElementById("todatetimepicker").value;
		if(!$scope.description){
			$scope.description = "";
		}
		if(!$scope.days){$scope.days = "";}
		if (!$scope.scheduleName) {			
			$scope.scheduleNameError = 1;
			$scope.scheduleNameMsg = "Please enter Schedule Name";
			document.getElementById("scheduleName").focus();			
		} else if (!$scope.BatchID) {			
			$scope.batchIDError = 1;
			$scope.batchIDMsg = "Please Select Batch";
			document.getElementById("BatchID").focus();
		} else if (!$scope.fromdatetimepicker) {			
			$scope.startDateError = 1;
			$scope.startDateMsg = "Please enter Date";
			document.getElementById("fromdatetimepicker").focus();
		} else if (!$scope.todatetimepicker) {			
			$scope.endDateError = 1;
			$scope.endDateMsg = "Please enter Date";
			document.getElementById("todatetimepicker").focus();
		} else {
			$scope.batchSpin = 1;
			var link = baseUrl+'addSchedule?scheduleName='+$scope.scheduleName+'&startDate='+$scope.fromdatetimepicker+'&endDate='+$scope.todatetimepicker+'&days='+$scope.days+'&batchId='+$scope.BatchID;
			$http.post(link).success(function(data, status, headers, config) {
				$scope.addBatch = data;				
				$scope.batchSpin = 0;
				if ($scope.addBatch == "Success") {
					toastr.success('Schedule added successfully');
					$timeout(function() {						
						$window.location.href = adminurl + 'add-schedule';
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
	
	$scope.getScheduleDetailById = function(scheduleId)
	{
		var daysEdit = new SlimSelect({
			select: '#demo1Edit'
			});
		var link = baseUrl+'getScheduleDetailById?scheduleid='+scheduleId;		
		$http.get(link).success(function(data, status, headers, config) {
			$scope.ScheduleDetail = data;
			$scope.id = $scope.ScheduleDetail.scheduleId; 
			$scope.scheduleNameEdit = $scope.ScheduleDetail.scheduleName;
			$scope.fromdatetimepickeredit = $scope.ScheduleDetail.scheduleStartDate;
			$scope.todatetimepickeredit = $scope.ScheduleDetail.scheduleEndDate;
			$scope.daysEdit = $scope.ScheduleDetail.scheduleDays.split(',');
			console.log($scope.daysEdit);
			for(var i = 0; i < $scope.daysEdit.length; i++){		    
				daysEdit.set($scope.daysEdit[i]); 
			}
			$scope.BatchIDEdit = $scope.ScheduleDetail.batchId;
			$scope.getBatchTimingsById($scope.BatchIDEdit);
			
		}).error(function(data, status, headers, config) {
			$scope.batchDetail = "Response Fail";
		});
	}
	
	$scope.updateSchedule = function(){
		$scope.fromdatetimepicker=document.getElementById("fromdatetimepickeredit").value;
		$scope.todatetimepicker=document.getElementById("todatetimepickeredit").value;
		
		if (!$scope.scheduleNameEdit) {			
			$scope.scheduleNameError = 1;
			$scope.scheduleNameMsg = "Please enter Schedule Name";
			document.getElementById("scheduleNameEdit").focus();			
		} else if (!$scope.BatchIDEdit) {			
			$scope.batchIDError = 1;
			$scope.batchIDMsg = "Please Select Batch";
			document.getElementById("BatchIDEdit").focus();
		} else if (!$scope.fromdatetimepickeredit) {			
			$scope.startDateError = 1;
			$scope.startDateMsg = "Please enter Date";
			document.getElementById("fromdatetimepickeredit").focus();
		} else if (!$scope.todatetimepickeredit) {			
			$scope.endDateError = 1;
			$scope.endDateMsg = "Please enter Date";
			document.getElementById("todatetimepickeredit").focus();
		} else {
			$scope.batchSpin = 1;
			var link = baseUrl+'editSchedule?scheduleName='+$scope.scheduleNameEdit+'&scheduleId='+$scope.id+'&startDate='+$scope.fromdatetimepickeredit+'&endDate='+$scope.todatetimepickeredit+'&days='+$scope.daysEdit+'&batchId='+$scope.BatchIDEdit;
			$http.post(link).success(function(data, status, headers, config) {
				$scope.editSchedule = data;				
				$scope.batchSpin = 0;
				if ($scope.editSchedule == "Success") {
					toastr.success('Schedule Updated successfully');
					$timeout(function() {						
						$window.location.href = adminurl + 'add-schedule';
					}, 2000);
				} 
				if($scope.editSchedule == "Fail") {
					toastr.error('Unfortunately Something went Wrong');				
				}
			}).error(function(data, status, headers, config) {
				$scope.batchSpin = 0;
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
	}
	
	$scope.delete = function(scheduleid) {
		var link = baseUrl+'deleteSchedule?scheduleid='+scheduleid;
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deleteSchedule = data;
			$('#deleteModal').modal('hide');
			toastr.success('Schedule deleted!');
			$scope.getScheduleListByCall();
		}).error(function(data, status, headers, config) {
			$scope.deleteSchedule = "Response Fail";
			toastr.error('Something went wrong!');
		});
	}
});