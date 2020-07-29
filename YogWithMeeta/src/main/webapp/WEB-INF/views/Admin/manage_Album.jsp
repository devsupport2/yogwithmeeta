<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Manage Album</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/gallery.js"></script>

</head>

<body id="page-top" ng-app="ywm" ng-controller="galleryCtrl">

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
									<h6 class="m-0 font-weight-bold text-light">Add New Album
									</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardExample">
									<div class="card-body">
										<form>
											<div class="box-body">
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label>Album Title<font color="red" size="3">*</font></label>
															<input type="text" id="albumtitle" name="albumtitle" ng-model="albumtitle" placeholder="Album Title" class="form-control" autofocus ng-change="setflag()">
															<p ng-show="errorAlbumName == 1" style="color: red;">{{msgAlbumName}}</p>
														</div>									
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>Sub Title</label>
															<input type="text" id="albumsubtitle" name="albumsubtitle" ng-model="albumsubtitle" placeholder="Sub Title" class="form-control">
														</div>									
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label>Album Date</label>
															<input class="KendoDate" id="fromdatetimepicker" title="fromdatetimepicker" ng-model="tourdate" style="width: 100%;" />
														</div>
													</div>									
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>Description</label>
															<textarea rows="5" cols="5" class="form-control" id="description" name="description" ng-model="description"></textarea>
														</div>
													</div>									
												</div>
												<div class="row">																		
												<div class="col-md-12">
													<div class="panel-group">
														<div class="panel panel-default">
															<div class="panel-heading">
																 <h5 class="panel-title"><i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;<select style="border:0px;outline:0px; background-color:white; color:#858796;" ng-model="IVToggle" ng-change="toggleImageVideo()" id="id_select" autofocus="true">
																																		  <option value="1"> Album Images </option>
																																		  <option value="2"> Album Videos </option>
																																		</select><span style="font-size:14px; color:#4a2818"><i class="fa fa-arrow-left" aria-hidden="true"></i> Click here to toogle between images and videos</span></h5>
															</div>
															<div class="panel-body">
																<div class="row">
																	<div class="col-md-3">
																		<div class="form-group">
																			<label ng-if="IVToggle==2">Video Title <font color="red" size="3">*</font></label>
																			<label ng-if="IVToggle==1">Image Title <font color="red" size="3">*</font></label>
																			<input type="text" id="imagetitle" name="imagetitle" ng-model="imagetitle" class="form-control" placeholder="Title" ng-change="setflag()">
																			<p ng-show="errorImageTitle == 1" style="color: red;">{{msgTitle}}</p>
																		</div>
																	</div>
																	<div class="col-md-3">
																		<label ng-if="IVToggle==1">Image File</label>
																		<div ng-show="IVToggle==1" class="custom-file">
																			<input type="file" class="custom-file-input input-group-lg" id="image" name="image" ng-model="image" ng-change="setFlag()"> 
																			<label class="custom-file-label" for="customFile">Choose Image</label>
																		</div>
																		<div class="form-group">
																			<label ng-if="IVToggle==2">Video Link</label>
																			<!-- <input ng-show="IVToggle==1" type="file" class="form-control" rows="1" id="image" name="image" ng-model="image" ng-change="setFlag()"></input> -->
																			<input ng-show="IVToggle==2" type="text" class="form-control" id="VideoUrl" ng-model="VideoUrl" ng-change="setFlag()" placeholder="video share link"></input>{{VideoUrl}}
																			<!-- <p ng-show="errorJoinStatement == 1" style="color: red;">{{msgFile}}</p> -->
																		</div>
																	</div>
																	<div class="col-md-5">
																		<div class="form-group">
																			<label ng-if="IVToggle==2">Video Description</label>
																			<label ng-if="IVToggle==1">Image Description</label>
																			<textarea id="imagedescription" name="imagedescription" ng-model="imagedescription" class="form-control"></textarea>
																		</div>
																	</div>
																	<div class="col-md-1">
																		<div class="form-group"><br>
																			<a ng-click="addAlbumImageRow()" class="btn btn-primary" style="color:white;"><span class="fa fa-plus"></span>&nbsp;Add</a>
																		</div>
																	</div>
																</div>
																<div class="table-responsive table-bordered">
																	<table class="table">
																		<thead>
																			<tr>																	
																				<th>Title</th>
																				<th>Description</th>
																				<th>Action</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr ng-repeat="item in albumimage" ng-show="item.imageTitle != null">																	
																				<td>{{item.imageTitle}}</td>
																				<td>{{item.imageDescription}}</td>
																				<td>
																					<a ng-click="removeAlbumImageRow(item.imageTitle)" style="cursor: pointer;" class="btn btn-danger">
																						<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
																					</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>								
											</div>
											<div class="box-footer">
												<div class="row">									
													<div class="col-md-8 text-left">
														<strong ng-show="albumSubmitSuccess == 1" style="color: green;"><span class="fa fa-check-circle"></span> {{successMsg}}</strong>
														<strong ng-show="albumSubmitError == 1" style="color: red;"><span class="fa fa-times-circle"></span> {{errorMsg}}</strong>
													</div>
													<div class="col-md-4 text-right">
														<button  ng-click="addalbum()" type="submit" ng-disabled="spin == 1" class="btn btn-success"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Submit</button>
													</div>
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
									<h6 class="m-0 font-weight-bold text-primary">All Albums</h6>
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
															<th style="width: 45%">Album Title</th>
															<th style="width: 45%">Album Subtitle</th>
															<th style="width: 5%" class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>

														<tr class="text-center" ng-if="getallalbum == ''">
															<td colspan="3"><span class="label label-default" style="font-size: 15px;">Sorry... No data found.</span></td>
														</tr>

														<tr ng-repeat="item in getallalbum" style="cursor:pointer;cursor:hand">
															<td ng-click="getAlbum(item.albumId)" title="Edit Record" data-toggle="modal" data-target="#editModal">{{$index + 1}}</td>
															<td ng-click="getAlbum(item.albumId)" title="Edit Record" data-toggle="modal" data-target="#editModal">{{item.albumTitle}}</td>
															<td ng-click="getAlbum(item.albumId)" title="Edit Record" data-toggle="modal" data-target="#editModal">{{item.albumSubtitle}}</td>


															<td class="text-center" ng-click="getAlbum(item.albumId)">
																<button title="Delete Album" type="button" class="btn btn-outline-default btn-sm view" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o txt-danger"></i> </button>
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
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getActivityList.length+startindex}}</b> out of <b>{{allcounts.activityCount}}</b> entries</div>
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
	<div class="modal fade" id="editModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Edit Album</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<form>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Album Title<font color="red" size="3">*</font></label>
										<input type="text" id="editalbumtitle" name="editalbumtitle" ng-model="editalbumtitle" placeholder="Album Title" class="form-control" autofocus ng-change="setflag()">
										<p ng-show="erroreditAlbumName == 1" style="color: red;">{{msgeditAlbumName}}</p>
									</div>									
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Sub Title</label>
										<input type="text" id="editalbumsubtitle" name="editalbumsubtitle" ng-model="editalbumsubtitle" placeholder="Sub Title" class="form-control">
									</div>									
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Album Date</label>
										<input class="KendoDate" id="fromdatetimepickerEdit" title="Album Date" ng-model="edittourdate" style="width: 100%;" />
									</div>
								</div>											
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Description</label>
										<textarea rows="5" cols="5" class="form-control" id="editdescription" name="editdescription" ng-model="editdescription"></textarea>
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel-group">
										<div class="panel panel-default">
											<div class="panel-heading">
												 <h5 class="panel-title"><i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;<select style="border:0px;outline:0px; background-color:white; color:#858796;" ng-model="IVToggle" ng-change="toggleImageVideo()" id="id_select" autofocus="true">
																														  <option value="1"> Album Images </option>
																														  <option value="2"> Album Videos </option>
																														</select><span style="font-size:14px; color:#4a2818"><i class="fa fa-arrow-left" aria-hidden="true"></i> Click here to toogle between images and videos</span></h5>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-md-3">
														<div class="form-group">
															<label ng-if="IVToggle==2">Video Title <font color="red" size="3">*</font></label>
															<label ng-if="IVToggle==1">Image Title <font color="red" size="3">*</font></label>
															<input type="text" id="editimagetitle" name="editimagetitle" ng-model="editimagetitle" class="form-control" placeholder="Title" ng-change="setflag()">
															<p ng-show="erroreditImageTitle == 1" style="color: red;">{{msgeditTitle}}</p>
														</div>
													</div>
													<div class="col-md-3">
														<label ng-if="IVToggle==1">Image File</label>
														<div ng-show="IVToggle==1" class="custom-file">
															<input type="file" class="custom-file-input input-group-lg" id="editimage" name="editimage" ng-model="editimage" ng-change="setFlag()"> 
															<label class="custom-file-label" for="customFile">Choose Image</label>
														</div>
														<div class="form-group">
															<label ng-if="IVToggle==2">Video Link</label>
															<!-- <input ng-show="IVToggle==1" type="file" class="form-control" rows="1" id="image" name="image" ng-model="image" ng-change="setFlag()"></input> -->
															<input ng-show="IVToggle==2" type="text" class="form-control" id="editVideoUrl" ng-model="editVideoUrl" ng-change="setFlag()" placeholder="video share link"></input>{{VideoUrl}}
															<!-- <p ng-show="errorJoinStatement == 1" style="color: red;">{{msgFile}}</p> -->
														</div>
													</div>
													<div class="col-md-5">
														<div class="form-group">
															<label ng-if="IVToggle==2">Video Description</label>
															<label ng-if="IVToggle==1">Image Description</label>
															<textarea id="editimagedescription" name="editimagedescription" ng-model="editimagedescription" class="form-control"></textarea>
														</div>
													</div>
													<div class="col-md-1">
														<div class="form-group"><br>
															<a ng-click="addAlbumImageRowEdit()" style="color:white;" class="btn btn-primary btn-sm"><span class="fa fa-plus"></span>&nbsp;Add</a>
														</div>
													</div>
												</div>
												<div class="table-responsive table-bordered">
													<table class="table">
														<thead>
															<tr>																	
																<th>Title</th>
																<th>Description</th>
																<th>Image</th>
																<th>Action</th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="item in albumimagenew" ng-show="item.imageTitle != null">																	
																<td>{{item.imageTitle}}</td>
																<td>{{item.description}}</td>
																<td ng-show="item.image" style="width:180px;"><img src="{{item.image}}" class="img-responsive"></td>
																<td ng-show="item.vidId" id="{{item.vidId}}" style="width:180px;">{{getLink(item.vidId);""}}</td>
																<td>
																	<a ng-click="removeAlbumImageRowEdit(item.imageTitle, item.albumId)" style="cursor: pointer;" class="btn btn-danger">
																		<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
																	</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="row">									
								<div class="col-md-12 text-left">
									<strong ng-show="albumEditSubmitSuccess == 1" style="color: green;"><span class="fa fa-check-circle"></span> {{successEditMsg}}</strong>
									<strong ng-show="albumEditSubmitError == 1" style="color: red;"><span class="fa fa-times-circle"></span> {{errorEditMsg}}</strong>
									<button  ng-click="editalbum(albumid)" type="submit" ng-disabled="spin == 1" class="btn btn-success"><i class="fa fa-refresh fa-spin" ng-if="spin == 1"></i> Submit</button>
								</div>
							</div>					
						</div>
					</form>
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

	<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script> --%>

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
<script>
	$(document).ready(function () {
	$('.select2').select2();
    

	$("#fromdatetimepicker").kendoDatePicker({
		format: "dd/MM/yyyy",
		value: new Date(),
		dateInput: true
	});
	
	$("#fromdatetimepickerEdit").kendoDatePicker({
		format: "dd/MM/yyyy",
		value: new Date(),
		dateInput: true
	});
	
	 
});
</script>
</body>

</html>
