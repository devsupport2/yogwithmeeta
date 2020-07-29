app.controller('CourseCtrl', function($scope, $http, $window, $filter,
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
	$scope.BatchStartTime = "06:00";
	$scope.BatchEndTime = "07:00";
	
	var link = baseUrl+'getAllSchedules';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getSchedulesList = data;
	}).error(function(data, status, headers, config) {
		$scope.getSchedulesList = "Response Fail";
	});
	
	var link = baseUrl+'Currency';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getCurrency = data;
	}).error(function(data, status, headers, config) {
		$scope.getCurrency = "Response Fail";
	});
	
	var link = baseUrl+'getCourseByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getCourseList = data;
	}).error(function(data, status, headers, config) {
		$scope.getCourseList = "Response Fail";
	});
	
	$scope.getCourseListByCall = function(){
		var link = baseUrl+'getCourseByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getCourseList = data;
		}).error(function(data, status, headers, config) {
			$scope.getCourseList = "Response Fail";
		});
	}
	
	$scope.getId = function(url) {
	    const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
	    const match = url.match(regExp);

	    return (match && match[2].length === 11)
	      ? match[2]
	      : null;
	}
	$scope.getLink = function(vidId){
		$scope.vidLink="//www.youtube.com/embed/"+vidId;
		$scope.vidLinkkk="<iframe style='height:auto;' width='220' src='https://www.youtube.com/embed/"+vidId+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
		document.getElementById(vidId).innerHTML = $scope.vidLinkkk;
	}
	
	$scope.addCourse = function() {
		
		$scope.description = CKEDITOR.instances.editor1.getData();
		
		if (!$scope.subTitle) {
			$scope.subTitle = "";
		}
		if (!$scope.description) {
			$scope.description = "";
		}
		if (!$scope.feeAmount) {
			$scope.feeAmount = 0.00;
		}
		if (!$scope.Currency) {
			$scope.Currency = 1;
		}
		if (!$scope.feeValidty) {
			$scope.feeValidty = "";
		}
		if (!$scope.location) {
			$scope.location = "";
		}
		if (!$scope.contactPersonName) {
			$scope.contactPersonName = "";
		}
		if (!$scope.contactPersonPhone) {
			$scope.contactPersonPhone = "";
		}
		if (!$scope.contactPersonEmail) {
			$scope.contactPersonEmail = "";
		}
		if(!$scope.VideoLink) {
			$scope.VideoLink = "";
		}else{
			$scope.VideoLink = $scope.getId($scope.VideoLink);
			console.log($scope.VideoLink);
		}
		
		if (!$scope.courseTitle) {			
			$scope.courseTitleError = 1;
			$scope.courseTitleMsg = "Please Enter course name";
			document.getElementById("courseTitle").focus();			
		} else if (!$scope.scheduleID) {			
			$scope.scheduleError = 1;
			$scope.scheduleMsg = "Please select Schedule";
			document.getElementById("scheduleID").focus();
		} else {
			$scope.courseSpin = 1;			
			var str1 = $scope.description.replace(/&/g, "$");
			var str2 = str1.replace(/#/g, "~");
			var str3 = str2.replace(/%/g, "!");
			$scope.description = str3;
			var link = baseUrl+'addCourse?courseTitle='+$scope.courseTitle+'&subTitle='+$scope.subTitle+'&description='+$scope.description+'&feeAmount='+$scope.feeAmount+'&Currency='+$scope.Currency+'&feeValidty='+$scope.feeValidty+'&location='+$scope.location+'&scheduleID='+$scope.scheduleID+'&contactPersonName='+$scope.contactPersonName+'&contactPersonPhone='+$scope.contactPersonPhone+'&contactPersonEmail='+$scope.contactPersonEmail+'&VideoLink='+$scope.VideoLink;
			var formData = new FormData();
			formData.append("CourseImage",CourseImage.files[0]);			
			$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) { return data; }}).success(function(data, status, headers, config) {
				$scope.addCourse = data;
				$scope.courseSpin = 0;	
				if ($scope.addCourse == "Success") {
					toastr.success('Course added successfully');
					$timeout(function() {	
						$window.location.href = adminurl + 'add-course';
					}, 2000);
				} 
				if($scope.addCourse == "Fail") {
					toastr.error('Unfortunately Something went Wrong');				
				}
			}).error(function(data, status, headers, config) {
				$scope.courseSpin = 0;
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
	}
	
	$scope.getCourseDetailById = function(id) {
		var link = baseUrl+'getCourseDetailById?Id='+id;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.courseDetail = data;
			$scope.id = $scope.courseDetail.courceId;
			$scope.courseTitleEdit = $scope.courseDetail.courceTitle;
			$scope.subTitleEdit = $scope.courseDetail.courceSubTitle;
			CKEDITOR.instances.editor1Edit.setData($scope.courseDetail.courceDescription);
			$scope.CurrImage = $scope.courseDetail.courceImage;
			$scope.scheduleIDEdit = $scope.courseDetail.scheduleId;
			$scope.feeAmountEdit = $scope.courseDetail.courseFee;
			$scope.CurrencyEdit = $scope.courseDetail.currencyId;
			$scope.feeValidtyEdit = $scope.courseDetail.courceFeeValidity;
			$scope.locationEdit = $scope.courseDetail.courceLocation;
			$scope.contactPersonNameEdit = $scope.courseDetail.contactPersonName;
			$scope.contactPersonPhoneEdit = $scope.courseDetail.contactPersonPhone;
			$scope.contactPersonEmailEdit = $scope.courseDetail.contactPersonEmail;
			//$scope.VideoLinkEdit = $scope.courseDetail.videoLink;
			$scope.VideoLinkE = $scope.courseDetail.videoLink;
		}).error(function(data, status, headers, config) {
			$scope.courseDetail = "Response Fail";
		});
	}
	
	
	$scope.editCourse = function(){
		$scope.batchSpin = 1;
$scope.descriptionEdit = CKEDITOR.instances.editor1Edit.getData();
		
		if (!$scope.CurrImage) {
			$scope.CurrImage = "";
		}
		if (!$scope.subTitleEdit) {
			$scope.subTitleEdit = "";
		}
		if (!$scope.descriptionEdit) {
			$scope.descriptionEdit = "";
		}
		if (!$scope.feeAmountEdit) {
			$scope.feeAmountEdit = 0.00;
		}
		if (!$scope.CurrencyEdit) {
			$scope.CurrencyEdit = 1;
		}
		if (!$scope.feeValidtyEdit) {
			$scope.feeValidtyEdit = "";
		}
		if (!$scope.locationEdit) {
			$scope.locationEdit = "";
		}
		if (!$scope.contactPersonNameEdit) {
			$scope.contactPersonName = "";
		}
		if (!$scope.contactPersonPhoneEdit) {
			$scope.contactPersonPhone = "";
		}
		if (!$scope.contactPersonEmailEdit) {
			$scope.contactPersonEmail = "";
		}
		if(!$scope.VideoLinkEdit) {
			$scope.VideoLinkEdit = "";
		}else{
			$scope.VideoLink = $scope.getId($scope.VideoLinkEdit);
			console.log($scope.VideoLinkEdit);
		}
		
		if (!$scope.courseTitleEdit) {			
			$scope.courseTitleError = 1;
			$scope.courseTitleMsg = "Please Enter course name";
			document.getElementById("courseTitleEdit").focus();			
		} else if (!$scope.scheduleIDEdit) {			
			$scope.scheduleError = 1;
			$scope.scheduleMsg = "Please select Schedule";
			document.getElementById("scheduleIDEdit").focus();
		} else {
			$scope.courseSpin = 1;			
			var str1 = $scope.descriptionEdit.replace(/&/g, "$");
			var str2 = str1.replace(/#/g, "~");
			var str3 = str2.replace(/%/g, "!");
			$scope.descriptionEdit = str3;
			var link = baseUrl+'editCourse?courseTitle='+$scope.courseTitleEdit+'&subTitle='+$scope.subTitleEdit+'&description='+$scope.descriptionEdit+'&feeAmount='+$scope.feeAmountEdit+'&Currency='+$scope.CurrencyEdit+'&feeValidty='+$scope.feeValidtyEdit+'&location='+$scope.locationEdit+'&scheduleID='+$scope.scheduleIDEdit+'&contactPersonName='+$scope.contactPersonNameEdit+'&contactPersonPhone='+$scope.contactPersonPhoneEdit+'&contactPersonEmail='+$scope.contactPersonEmailEdit+'&CurrImage='+$scope.CurrImage+'&CourseId='+$scope.id+'&VideoLinkEdit='+$scope.VideoLink+'&VideoLinkE='+$scope.VideoLinkE;			
			var formData = new FormData();
			formData.append("CourseImageEdit",CourseImageEdit.files[0]);			
			$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) { return data; }}).success(function(data, status, headers, config) {
				$scope.editCourse = data;
				$scope.courseSpin = 0;
				if ($scope.editCourse == "Success") {
					toastr.success('Course Updated successfully');
					$timeout(function() {						
						$window.location.href = adminurl + 'add-course';
					}, 2000);
				} 
				if($scope.editCourse == "Fail") {
					toastr.error('Unfortunately Something went Wrong');				
				}
			}).error(function(data, status, headers, config) {
				$scope.courseSpin = 0;
				toastr.error('Something wrong! Please try after sometime!');			
			});
		}
	}
	
	$scope.delete = function(courseid) {
		var link = baseUrl+'deleteCourse?courseid='+courseid;
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deleteCourse = data;
			$('#deleteModal').modal('hide');
			toastr.success('Course deleted!');
			$scope.getCourseListByCall();
		}).error(function(data, status, headers, config) {
			$scope.deleteCourse = "Response Fail";
			toastr.error('Something went wrong!');
		});
	}
	
	$scope.getBatchListByCall = function(){
			var link = baseUrl+'getAllBatchName';    
        	$http.get(link).success(function(data, status, headers, config) {
        		$scope.getBatchNameList = data;
        	}).error(function(data, status, headers, config) {
        		$scope.getBatchNameList = "Response Fail";
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
	$scope.intializeDays= function(){
	    var link = baseUrl+'getAllBatchName';    
    	$http.get(link).success(function(data, status, headers, config) {
    		$scope.getBatchNameList = data;
    	}).error(function(data, status, headers, config) {
    		$scope.getBatchNameList = "Response Fail";
    	});
	    $scope.daysList = [
		    {name:'Sunday', value:'Sunday'},
		    {name:'Monday', value:'Monday'},
		    {name:'Tuesday', value:'Tuesday'},
		    {name:'Wednesday', value:'Wednesday'},
		    {name:'Thursday', value:'Thursday'},
		    {name:'Friday', value:'Friday'},
		    {name:'Saturday', value:'Saturday'},
		  ];
		  console.log("INIT DAYS");
	    var days = new SlimSelect({
			select: '#demo1'
			});
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
					    var link = baseUrl+'getAllSchedules';    
                    	$http.get(link).success(function(data, status, headers, config) {
                    		$scope.getSchedulesList = data;
                    	}).error(function(data, status, headers, config) {
                    		$scope.getSchedulesList = "Response Fail";
                    	});
                    		$('#addSchedule').modal('hide');
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
	
});