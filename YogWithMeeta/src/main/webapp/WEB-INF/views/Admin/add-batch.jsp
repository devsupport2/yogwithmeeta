<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Batch</title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/admin/img/favicon.ico">

<!-- fonts -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- styles -->
<link href="<%=request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">



<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link> --%>


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

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/manageBatch.js"></script>

</head>

<body id="page-top" ng-app="ywm" ng-controller="batchCtrl">

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
									<h6 class="m-0 font-weight-bold text-light">Add New Batch
									</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardExample">
									<div class="card-body">


										<form class="" ng-submit="addBatch()">

											<div class="form-group row">

												<div class="col-lg-6 col-md-4 col-sm-12 col-xs-12">
													<label> Batch Name <span class="errormsg">*</span></label> 
													<input class="form-control" placeholder=" Batch Name " type="text" ng-change="setflag()" id="BatchName" ng-model="BatchName">
													<p class="errormsg" ng-show="batchNameError == 1">{{batchNameMsg}}</p>
												</div>

												<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
												<label> Batch Start Time <span class="errormsg">*</span></label> 
												<div class="input-group clockpicker">
												    <input type="text" class="form-control" ng-change="setflag()" id="BatchStartTime" ng-model="BatchStartTime">
												    <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
												    	<i class="fa fa-clock-o"></i>
													</span>
												</div>
												<p class="errormsg" ng-show="startTimeError == 1">{{startTimeMsg}}</p>
												</div>

												<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
												<label> Batch End Time <span class="errormsg">*</span></label> 
												<div class="input-group clockpicker">
												    <input type="text" class="form-control" ng-change="setflag()" id="BatchEndTime" ng-model="BatchEndTime">
												    <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
												    	<i class="fa fa-clock-o"></i>
													</span>
												</div>
												<p class="errormsg" ng-show="endTimeError == 1">{{endTimeMsg}}</p>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<label> Description </label>
													<textarea cols="80" id="editor1" name="editor1" rows="10" data-sample-short>
													 Description
													</textarea>
												</div>
											</div>



											<hr>

											<div class="form-group row">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit" ng-disable="batchSpin == 1" class="btn btn-md btn-success btn-block">
														Add Batch <i ng-show="batchSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
												</div>

											</div>



										</form>


									</div>
								</div>
							</div>

						</div>
					</div>
				</div>



				<div class="container-fluid">
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">All Batch</h6>
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
															<th style="width: 5%">#</th>
															<th style="width: 20%">Batch Name</th>
															<th style="width: 20%">Batch Timing</th>
															<th style="width: 55%">Description</th>
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>



														<tr ng-repeat="item in getBatchList">

															<td ng-click="getBatchDetailById(item.batchId)"><a data-toggle="modal" data-target="#EditBatchModal" href="#" > {{$index + 1}} </a></td>

															<td ng-click="getBatchDetailById(item.batchId)"><a data-toggle="modal" data-target="#EditBatchModal" href="#" > {{item.batchName}} </a></td>



															<td ng-click="getBatchDetailById(item.batchId)"><a data-toggle="modal" data-target="#EditBatchModal" href="#" > {{item.batchStartTime}} To {{item.batchEndTime}} </a></td>

															<td ng-click="getBatchDetailById(item.batchId)"><a data-toggle="modal" data-target="#EditBatchModal" href="#" ng-bind-html="item.batchDescription | to_trusted"></a></td>



															<td class="text-center" ng-click="getBatchDetailById(item.batchId)">
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
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getBatchList.length+startindex}}</b> out of <b>{{getAllCounts.batchCount}}</b> entries</div>
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
	<div class="modal fade" id="EditBatchModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Batch</h5>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
				<script type="text/javascript">
					</script>
					<form class="" ng-submit="editBatch()">

						<div class="form-group row">

							<div class="col-lg-6 col-md-4 col-sm-12 col-xs-12">
								<label> Batch Name <span class="errormsg">*</span></label> 
								<input class="form-control" placeholder=" Batch Name " type="text" ng-change="setflag()" id="BatchNameEdit" ng-model="BatchNameEdit">
								<p class="errormsg" ng-show="batchNameError == 1">{{batchNameMsg}}</p>
							</div>

							<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
							<label> Batch Start Time <span class="errormsg">*</span></label> 
							<div class="input-group clockpicker">
							    <input type="text" class="form-control" ng-change="setflag()" id="BatchStartTimeEdit" ng-model="BatchStartTimeEdit">
							    <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
							    	<i class="fa fa-clock-o"></i>
								</span>
							</div>
							<p class="errormsg" ng-show="startTimeError == 1">{{startTimeMsg}}</p>
							</div>

							<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
							<label> Batch End Time <span class="errormsg">*</span></label> 
							<div class="input-group clockpicker">
							    <input type="text" class="form-control" ng-change="setflag()" id="BatchEndTimeEdit" ng-model="BatchEndTimeEdit">
							    <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
							    	<i class="fa fa-clock-o"></i>
								</span>
							</div>
							<p class="errormsg" ng-show="endTimeError == 1">{{endTimeMsg}}</p>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<label> Description </label>
								<textarea cols="80" id="editor1Edit" name="editor1Edit" rows="10" data-sample-short>
								 Description
								</textarea>
							</div>
						</div>



						<hr>

						<div class="form-group row">

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<button type="submit" ng-disable="batchSpin == 1" class="btn btn-md btn-success btn-block">
									Update Batch <i ng-show="batchSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<!-- Create Group Modal-->
	<!-- Modal -->
	<div class="modal fade" id="CreateGroupModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create New
						Group</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
							<label> Group Name </label>
							<div class="form-group input-group ">
								<input type="text" class="form-control"
									placeholder="Group Name "> <span
									class="input-group-btn">
									<button style="border-radius: 0px 4px 4px 0px;"
										class="btn btn-primary" type="button">ADD</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





<!-- Bootstrap  JavaScript-->
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
	
	
	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>

	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>

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
</script>
<script type="text/javascript">
$('.clockpicker').clockpicker({
    placement: 'bottom',
    align: 'left',
    donetext: 'Done',
    autoclose: true,
    	afterDone: function() {
            console.log("after done");
        }
});
</script>
</body>

</html>
