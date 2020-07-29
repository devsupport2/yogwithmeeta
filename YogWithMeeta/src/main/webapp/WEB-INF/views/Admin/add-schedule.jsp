<!DOCTYPE html>
<html lang="en">

<head><meta charset="windows-1252">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Schedule</title>

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
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.mobile.min.css" />
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/kendo.all.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />
<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-clockpicker.js"></script>

<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">


<!-- includes js File START-->
<script src="<%=request.getContextPath() %>/resources/admin/js/w3data.js"></script>
<!-- includes js File END-->

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/manageSchedule.js"></script>

</head>

<body id="page-top" ng-app="ywm" ng-controller="scheduleCtrl">

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
								<a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
									<h6 class="m-0 font-weight-bold text-light">Add New Schedule</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardExample">
									<div class="card-body">


										<form class="" ng-submit="addSchedule()">
											<div class="form-group row">

												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
													<label> Schedule Name <span class="errormsg">*</span></label> 
													<input class="form-control" placeholder=" Schedule Name " type="text" ng-model="scheduleName" id="scheduleName">
													<p class="errormsg" ng-show="scheduleNameError == 1">{{scheduleNameMsg}}</p>
												</div>
												<div id="example"
													class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
													<label> Start Date <span class="errormsg">*</span></label>
													<input class="KendoDate" id="fromdatetimepicker" title="fromdatetimepicker" ng-model="fromdatetimepicker" style="width: 100%;" />
													<p class="errormsg" ng-show="startDateError == 1">{{startDateMsg}}</p>
												</div>
												<div id="example"
													class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
													<label> End Date <span class="errormsg">*</span></label> 
													<input class="KendoDate" id="todatetimepicker" title="todatetimepicker" ng-model="todatetimepicker" style="width: 100%;" />
													<p class="errormsg" ng-show="endDateError == 1">{{endDateMsg}}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 team-members">
													<label> Select Schedule Days</label>
													<div class="form-group input-group">
														<select id="demo1" ng-model="days" ng-options="obj.value as obj.name for obj in daysList" id="days" ng-change="setDays(days)" multiple>
														</select>
													</div>
												</div>
												<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
													<label> Select Batch <span class="errormsg">*</span></label>
													<div class="form-group input-group ">
														<select class="form-control" ng-model="BatchID" id="BatchID" ng-change="getBatchTimingsById(BatchID)">
															<option value="">Select Batch</option>
															<option ng-repeat="item in getBatchNameList" value="{{item.batchId}}">{{item.batchName}}</option>
														</select> <span class="input-group-btn">
															<button style="border-radius: 0px 4px 4px 0px;" title="Add new Batch" data-toggle="modal" data-target="#addBatch" class="btn btn-primary" type="button">
																<i class="fa fa-plus"></i>
															</button>
														</span>

													</div>
													<p class="errormsg" ng-show="batchIDError == 1">{{batchIDMsg}}</p>
												</div>


												<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
													<label> Batch Start Time </label>

													<div class="form-group input-group">
														<input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchStartTime" class="form-control"> 
														<span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
															<i class="fa fa-clock-o"></i>
														</span>
													</div>
												</div>

												<div class="col-lg-2 col-md-12 col-sm-6 col-xs-12">
													<label> Batch End Time </label>

													<div class="form-group input-group">
														<input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchEndTime" class="form-control"> 
														<span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
															<i class="fa fa-clock-o"></i>
														</span>
													</div>
												</div>
											</div>
											<hr>
											<div class="form-group row"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit" class="btn btn-md btn-success btn-block"> Add Schedule </button>
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
									<h6 class="m-0 font-weight-bold text-primary">All Schedule
									</h6>
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
															<th>Schedule Name</th>
															<th>Start Date</th>
															<th>End Date</th>
															<th>Schedule Days</th>
															<th>Batch Time</th>
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>



														<tr ng-repeat="item in getScheduleList">
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{$index + 1}} </a></td>
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{item.scheduleName}} </a></td>
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{item.scheduleStartDate}} </a></td>
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{item.scheduleEndDate}} </a></td>
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{item.scheduleDays}} </a></td>
															<td><a data-toggle="modal" data-target="#EditScheduleModal" ng-click="getScheduleDetailById(item.scheduleId)" href="#"> {{item.batchStartTime}} To {{item.batchEndTime}} </a></td>

															<td class="text-center" ng-click="getScheduleDetailById(item.scheduleId)">
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
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getScheduleList.length+startindex}}</b> out of <b>{{getAllCounts.scheduleCount}}</b> entries</div>
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
<div class="modal fade" id="EditScheduleModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update Schedule</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<form class="" ng-submit="updateSchedule()">
						<div class="form-group row">

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<label> Schedule Name <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Schedule Name " type="text" ng-model="scheduleNameEdit" id="scheduleNameEdit">
								<p class="errormsg" ng-show="scheduleNameError == 1">{{scheduleNameMsg}}</p>
							</div>
							<div id="example"
								class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
								<label> Start Date <span class="errormsg">*</span></label> 
								<input class="KendoDate" id="fromdatetimepickeredit" title="From Date" ng-model="fromdatetimepickeredit" style="width: 100%;" />
								<p class="errormsg" ng-show="startDateError == 1">{{startDateMsg}}</p>
							</div>
							<div id="example"
								class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
								<label> End Date <span class="errormsg">*</span></label> 
								<input class="KendoDate" id="todatetimepickeredit" title="To Date" ng-model="todatetimepickeredit" style="width: 100%;" />
								<p class="errormsg" ng-show="endDateError == 1">{{endDateMsg}}</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 team-members">
								<label> Select Schedule Days</label>
								<div class="form-group input-group">
									<select id="demo1Edit" ng-model="daysEdit" ng-options="obj.value as obj.name for obj in daysList" ng-change="setDays(daysEdit)" multiple>
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
								<label> Select Batch <span class="errormsg">*</span></label>
								<div class="form-group input-group ">
									<select class="form-control" ng-model="BatchIDEdit" id="BatchIDEdit" ng-change="getBatchTimingsById(BatchIDEdit)">
										<option value="">Select Batch</option>
										<option ng-repeat="item in getBatchNameList" value="{{item.batchId}}">{{item.batchName}}</option>
									</select> <span class="input-group-btn">
										<button style="border-radius: 0px 4px 4px 0px;" title="Add new Batch" data-toggle="modal" data-target="#addBatch" class="btn btn-primary" type="button">
											<i class="fa fa-plus"></i>
										</button>
									</span>

								</div>
								<p class="errormsg" ng-show="batchIDError == 1">{{batchIDMsg}}</p>
							</div>


							<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
								<label> Batch Start Time </label>

								<div class="form-group input-group">
									<input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchStartTime" class="form-control"> 
									<span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
										<i class="fa fa-clock-o"></i>
									</span>
								</div>
							</div>

							<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
								<label> Batch End Time </label>

								<div class="form-group input-group">
									<input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchEndTime" class="form-control"> 
									<span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
										<i class="fa fa-clock-o"></i>
									</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="form-group row"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<button type="submit" class="btn btn-md btn-success btn-block"> Update Schedule </button>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>


<%@include file="addBatch.jsp" %>


	<!-- Bootstrap  JavaScript-->
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script> --%>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>

	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>


	<!--***********************************-->
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
		rel="stylesheet" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

	<script>
	$(document).ready(function () {
	$('.select2').select2();
	
	var x = new SlimSelect({
		select: '#demo1'
		});
    
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
	
	$("#fromdatetimepickeredit").kendoDatePicker({
		format: "dd/MM/yyyy",
		value: new Date(),
		dateInput: true
	});
	// create DateTimePicker from input HTML element
	$("#todatetimepickeredit").kendoDatePicker({
		format: "dd/MM/yyyy",
		value: new Date(),
		dateInput: true
	});
	 
});
</script>


</body>

</html>
