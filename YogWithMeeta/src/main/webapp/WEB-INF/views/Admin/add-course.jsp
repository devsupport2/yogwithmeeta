<!DOCTYPE html>
<html lang="en">

<head><meta charset="windows-1252">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Course</title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/admin/img/favicon.ico">

<!-- fonts -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- styles -->
<link href="<%=request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/admin/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">



<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link>


<!--***ckeditor****-->
<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>


<!--***datetimepicker****-->
<link rel="stylesheet"
	href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.mobile.min.css" />
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/kendo.all.min.js"></script>



<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-clockpicker.js"></script>
<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/manageCources.js"></script>

</head>

<body id="page-top" ng-app="ywm" ng-controller="CourseCtrl">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
			<!--/Left Navigation START-->
			<%@include file="left-nav.jsp" %>
			<!--/Left Navigation END-->
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Topbar -->
				<%@include file="header.jsp" %>
				<!-- End of Topbar -->




				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-light">Add New Course
									</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse hide" id="collapseCardExample">
									<div class="card-body">


										<form class="" ng-submit="addCourse()">

											<div class="form-group row">

												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
													<label> Course Title <span class="errormsg">*</span></label> 
													<input class="form-control" placeholder=" Course Title " ng-model="courseTitle" id="courseTitle" type="text">
													<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
												</div>

												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
													<label> Sub Title </label> 
													<input class="form-control" placeholder="Sub Title " ng-model="subTitle" id="subTitle" type="text">
												</div>

											</div>
											<div class="form-group row">
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<label> Course Description </label>
													<textarea cols="80" id="editor1" name="editor1" rows="10" data-sample-short>
													</textarea>
												</div>
											</div>



											<div class="row">

												<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
													<label> Course Image </label>
													<div class="custom-file">
														<input type="file" class="custom-file-input input-group-lg" id="CourseImage" name="CourseImage"> 
														<label class="custom-file-label" for="customFile">Choose Image</label>
													</div>
												</div>

												<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
													<label> Select Schedule <span class="errormsg">*</span></label>
													<div class="form-group input-group ">
														<select class="form-control" ng-model="scheduleID" id="scheduleID">
															<option value="">Select Schedule</option>
															<option ng-repeat="item in getSchedulesList" value="{{item.scheduleId}}">{{item.scheduleName}}</option>
														</select> <span class="input-group-btn">
															<button style="border-radius: 0px 4px 4px 0px;"
																data-toggle="modal" data-target="#addSchedule"
																class="btn btn-primary" type="button">
																<i class="fa fa-plus"></i>
															</button>
														</span>


													</div>
													<p class="errormsg" ng-show="scheduleError == 1">{{scheduleMsg}}</p>
												</div>
												
												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Fee </label> 
													<input class="form-control" placeholder="Fee" type="text" ng-model="feeAmount" id="feeAmount">
												</div>

												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Currency </label> 
													<select class="form-control" ng-model="Currency" id="Currency">
															<option value="">Currency</option>
															<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
														</select>
													<!--<div class="input-group ">
														<select class="form-control" ng-model="Currency" id="Currency">
															<option value="">Currency</option>
															<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
														</select> <span class="input-group-btn">
															<button style="border-radius: 0px 4px 4px 0px;" title="Add new Currency" data-toggle="modal" data-target="#" class="btn btn-primary" type="button">
																<i class="fa fa-plus"></i>
															</button>
														</span>

													</div>-->
												</div>
												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Fee Validity </label> 
													<input class="form-control" placeholder="Fee Validity" type="text" ng-model="feeValidty" id="feeValidty">
												</div>

											</div>




											<div class="form-group row">
												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Youtube Link </label> 
													<input class="form-control" placeholder="Video Link" type="text" ng-model="VideoLink" id="VideoLink">
												</div>
												
												<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
													<label> Location - Google MAP URL </label> 
													<input class="form-control" placeholder="Location - Google MAP URL" type="text" ng-model="location" id="location">
												</div>
												<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
													<label> Contact Person Name </label> 
													<input class="form-control" placeholder="Contact Person Name" type="text" ng-model="contactPersonName" id="contactPersonName">
												</div>

												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Contact Person Phone no </label> 
													<input class="form-control" placeholder="Contact Person Phone no" type="text" ng-model="contactPersonPhone" id="contactPersonPhone">
												</div>

												<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
													<label> Contact Person email id </label> 
													<input class="form-control" placeholder=" Contact Person email id" type="text" ng-model="contactPersonEmail" id="contactPersonEmail">
												</div>

											</div>
											<hr>

											<div class="form-group row">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit" ng-disable="courseSpin == 1" class="btn btn-md btn-success btn-block"> Add Course <i ng-show="courseSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
												</div>

											</div>



										</form>


									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


				<!-- List All Task Start Content for Desktop & Others   -->

				<div class="container-fluid">
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">All Course</h6>
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th>#</th>
															<th>Course Title</th>
															<th>Schedule Name</th>
															<th>From Date</th>
															<th>To Date</th>
															<th>Schedule Days</th>
															<th>Batch Name</th>
															<th>Batch Timings</th>
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>



														<tr ng-repeat="item in getCourseList">
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{$index + 1}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.courceTitle}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.scheduleName}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.scheduleStartDate}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.scheduleEndDate}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.scheduleDays}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.batchName}} </a></td>
															<td><a data-toggle="modal" data-target="#EditCourseModal" ng-click="getCourseDetailById(item.courceId)" href="#"> {{item.batchStartTime}} to {{item.batchEndTime}} </a></td>
															<td class="text-center" ng-click="getCourseDetailById(item.courceId)">
																<button title="Delete Batch" type="button" class="btn btn-outline-default btn-sm view" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o txt-danger"></i> </button>
															</td>
														</tr>





													</tbody>

												</table>
											</div>
										</div>
									</div>

									<hr class="mt-0">

									<div class="row">

										<div class="col-sm-12 col-md-5">
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getCourseList.length+startindex}}</b> out of <b>{{getAllCounts.courseCount}}</b> entries</div>
										</div>

										<div class="col-sm-12 col-md-7 text-right">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination pull-right">
													<li class="paginate_button page-item previous disabled"
														id="dataTable_previous"><a href="#"
														aria-controls="dataTable" data-dt-idx="0" tabindex="0"
														class="page-link">Previous</a></li>
													<li class="paginate_button page-item active"><a
														href="#" aria-controls="dataTable" data-dt-idx="1"
														tabindex="0" class="page-link">{{currentPage+1}}</a></li>
													<li class="paginate_button page-item next"
														id="dataTable_next"><a href="#"
														aria-controls="dataTable" data-dt-idx="7" tabindex="0"
														class="page-link">Next</a></li>
												</ul>
											</div>
										</div>

									</div>


								</div>

							</div>

						</div>

					</div>
				</div>

				<!-- /.container-fluid -->




			</div>
			<!-- End of Main Content -->
			<%@include file="delete_modal.jsp" %>
			<!--/#footer START-->
			<%@include file="footer.jsp" %>
			<!--/#footer END-->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


<!-- Modal -->
	<div class="modal fade" id="EditCourseModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Course</h5>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<form class="" ng-submit="editCourse()">

						<div class="form-group row">

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<label> Course Title <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Course Title " ng-model="courseTitleEdit" id="courseTitleEdit" type="text">
								<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<label> Sub Title </label> 
								<input class="form-control" placeholder="Sub Title " ng-model="subTitleEdit" id="subTitleEdit" type="text">
							</div>

						</div>
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<label> Course Description </label>
								<textarea cols="80" id="editor1Edit" name="editor1Edit" rows="10" data-sample-short>
									Course Description...
								</textarea>
							</div>
						</div>



						<div class="row">

							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<label> Course Image </label>
								<div class="custom-file">
									<input type="file" class="custom-file-input input-group-lg" id="CourseImageEdit" name="CourseImageEdit"> 
									<label class="custom-file-label" for="customFile">Choose Image</label>
								</div>
								<img src="{{CurrImage}}" width="80%"/>
							</div>

							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<label> Select Schedule <span class="errormsg">*</span></label>
								<div class="form-group input-group ">
									<select class="form-control" ng-model="scheduleIDEdit" id="scheduleIDEdit">
										<option value="">Select Schedule</option>
										<option ng-repeat="item in getSchedulesList" value="{{item.scheduleId}}">{{item.scheduleName}}</option>
									</select> <span class="input-group-btn">
										<button style="border-radius: 0px 4px 4px 0px;"
											data-toggle="modal" data-target="#addSchedule"
											class="btn btn-primary" type="button">
											<i class="fa fa-plus"></i>
										</button>
									</span>


								</div>
								<p class="errormsg" ng-show="scheduleError == 1">{{scheduleMsg}}</p>
							</div>
							
							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Fee </label> 
								<input class="form-control" placeholder="Fee" type="text" ng-model="feeAmountEdit" id="feeAmountEdit">
							</div>

							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Currency </label> 
								<select class="form-control" ng-model="CurrencyEdit" id="CurrencyEdit">
										<option value="">Currency</option>
										<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
									</select>
								<!--<div class="input-group ">
									<select class="form-control" ng-model="CurrencyEdit" id="CurrencyEdit">
										<option value="">Currency</option>
										<option ng-repeat="item in getCurrency" value="{{item.currencyId}}">{{item.currencyCode}}</option>
									</select> <span class="input-group-btn">
										<button style="border-radius: 0px 4px 4px 0px;" title="Add new Currency" data-toggle="modal" data-target="#" class="btn btn-primary" type="button">
											<i class="fa fa-plus"></i>
										</button>
									</span>

								</div>-->
							</div>
							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Fee Validity </label> 
								<input class="form-control" placeholder="Fee Validity" type="text" ng-model="feeValidtyEdit" id="feeValidtyEdit">
							</div>

						</div>




						<div class="form-group row">
							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Youtube Link </label> 
								<input class="form-control" placeholder="Video Link" type="text" ng-model="VideoLinkEdit" id="VideoLinkEdit"><br>
								<div id="{{VideoLinkE}}" style="width:180px;">{{getLink(VideoLinkE);""}}</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<label> Location - Google MAP URL </label> 
								<input class="form-control" placeholder="Location - Google MAP URL" type="text" ng-model="locationEdit" id="locationEdit">
							</div>
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<label> Contact Person Name </label> 
								<input class="form-control" placeholder="Contact Person Name" type="text" ng-model="contactPersonNameEdit" id="contactPersonNameEdit">
							</div>

							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Contact Person Phone </label> 
								<input class="form-control" placeholder="Contact Person Phone no" type="text" ng-model="contactPersonPhoneEdit" id="contactPersonPhoneEdit">
							</div>

							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
								<label> Contact Person email id </label> 
								<input class="form-control" placeholder=" Contact Person email id" type="text" ng-model="contactPersonEmailEdit" id="contactPersonEmailEdit">
							</div>

						</div>
						<hr>

						<div class="form-group row">

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<button type="submit" ng-disable="courseSpin == 1" class="btn btn-md btn-success btn-block"> Update Course <i ng-show="courseSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
							</div>

						</div>



					</form>
				</div>
			</div>
		</div>
	</div>


    
            <%@include file="addSchedule.jsp" %>
	<!-- Bootstrap  JavaScript-->
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>

	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>

<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>

	<!-- Page level plugins -->
	<!--<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>-->

	<!-- Page level custom scripts -->
	<!--<script src="js/demo/datatables-demo.js"></script>-->



	<!--***********************************-->
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
		rel="stylesheet" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

	<script>
$('.select2').select2();
$("#fromdatetimepicker").kendoDatePicker({
	format: "dd/MM/yyyy",
	value: new Date(),
	dateInput: true
});
// create DateTimePicker from input HTML element
$("#todatetimepicker").kendoDatePicker({
	format: "dd/MM/yyyy",
	value: new Date(),
	dateInput: true
});
</script>


</body>

</html>
