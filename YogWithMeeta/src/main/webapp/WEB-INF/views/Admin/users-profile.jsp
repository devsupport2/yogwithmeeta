<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>User Profile</title>

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



<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link>


<!--*******-->
<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>




<!--*******-->
<link rel="stylesheet"
	href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/admin/datetimepicker/css/kendo.material.mobile.min.css" />
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/kendo.all.min.js"></script>



</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
		<%@include file="left-nav.jsp" %>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Topbar -->
				<%@include file="header.jsp" %>
				<!-- End of Topbar -->







				<div class="container-fluid">
					<div class="row profile">

						<div class="col-lg-3 col-md-3">
							<div class="profile-sidebar">
								<div class="profile-img">
									<img class="img-responsive" src="<%=request.getContextPath() %>/resources/admin/img/profile-pic.jpg" alt="" />
									<div class="file btn btn-lg btn-primary">
										Change Photo <input type="file" name="file" />
									</div>
								</div>

								<div class="profile-usertitle">
									<div class="profile-usertitle-name">Bhargav Bhatt</div>
									<div class="profile-usertitle-job">Centre Incharge</div>
								</div>

								<!--
<div class="profile-userbuttons">
<a href="edit.html" class="btn btn-success btn-sm">Edit my profile</a>
</div>

<div class="profile-usermenu">
<ul class="nav">
<li class="active">
<a href="profile.html">
<i class="glyphicon glyphicon-home"></i>
Overview </a>
</li>
<li>
<a href="#">
<i class="glyphicon glyphicon-user"></i>
Account Settings </a>
</li>
<li>
<a href="#" target="_blank">
<i class="glyphicon glyphicon-ok"></i>
Tasks </a>
</li>
<li>
<a href="#">
<i class="glyphicon glyphicon-flag"></i>
Help </a>
</li>
</ul>
</div>
-->

							</div>
						</div>


						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-9 col-md-9 col-sm-12 col-xl-9">
							<!-- Collapsable Card Example -->
							<div class="card  mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Edit Profile
									</h6>
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<form class="">


										<div class="form-group row">

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> User Type </label>
												<div class="form-group input-group mb-0">
													<select class="form-control">
														<option selected>Selecte User Type</option>
														<option>Resident</option>
														<option selected>Employee</option>
														<option>Supplier</option>
													</select>
													<!--<span class="input-group-btn">
<button style="border-radius: 0px 4px 4px 0px;" data-toggle="modal" data-target="#AddDesignationModal" class="btn btn-primary" type="button">
<i class="fa fa-plus"></i>
</button>
</span>-->
												</div>
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> First Name </label> <input class="form-control"
													placeholder="First Name" value="Bhargav" type="text">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Last Name </label> <input class="form-control"
													placeholder="Last Name" value="Bhatt" type="text">
											</div>


											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> User Picture </label>
												<div class="custom-file">
													<input type="file" class="custom-file-input input-group-lg"
														id="customFile" name="filename"> <label
														class="custom-file-label" for="customFile">Choose
														file</label>
												</div>
											</div>

										</div>




										<div class="form-group row">

											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Address line 1 </label> <input class="form-control"
													placeholder="Address line 1" value="507 Sears " type="text">
											</div>


											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Address line 2 </label> <input class="form-control"
													placeholder="Address line 2" value="Gotri Road, Sevasi,"
													type="text">
											</div>

											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Address line 3 </label> <input class="form-control"
													placeholder="Address line 3"
													value="Vadodara, Gujarat 391101" type="text">
											</div>

										</div>



										<div class="form-group row">

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Country <span class="text-danger">*</span>
												</label> <input class="form-control" placeholder="Country"
													value="INDIA" type="text">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> State <span class="text-danger">*</span>
												</label> <input class="form-control" placeholder="State"
													value="Gujrat" type="text">
											</div>


											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> City <span class="text-danger">*</span>
												</label> <input class="form-control" placeholder="City"
													value="Vadodra" type="text">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Pincode <span class="text-danger">*</span>
												</label> <input class="form-control" placeholder="Pincode"
													value="390012" type="text">
											</div>


										</div>



										<div class="form-group row">

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 designation">
												<label> Designation </label>
												<div class="form-group input-group mb-0">
													<select class="form-control">
														<option selected>Selecte Designation</option>
														<option>Accounts</option>
														<option>Activities</option>
														<option>Administrotion</option>
														<option>Dietary</option>
														<option>General</option>
														<option selected>HR</option>
													</select> <span class="input-group-btn">
														<button style="border-radius: 0px 4px 4px 0px;"
															data-toggle="modal" data-target="#AddDesignationModal"
															class="btn btn-primary" type="button">
															<i class="fa fa-plus"></i>
														</button>
													</span>
												</div>
											</div>

											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 slocation">
												<label> Select Location </label>
												<div class="form-group input-group mb-0">
													<select id="slocation" multiple>
														<option selected value="value 1">Kadji Care &
															Rehabs PVT. LTD.</option>
														<option value="value 2">Kadji Care - Caring Like
															Family</option>
														<option value="value 3">Kadji House 1</option>
														<option value="value 4">Kadji House 2</option>
														<option value="value 5">Kadji House 3</option>
														<option value="value 6">Kadji House 4</option>
														<option value="value 7">Kadji House 5</option>
														<option value="value 8">Kadji House 6</option>
													</select> <span class="input-group-btn">
														<button style="border-radius: 0px 4px 4px 0px;"
															data-toggle="modal" data-target="#AddUserModal"
															class="btn btn-primary" type="button">
															<i class="fa fa-plus"></i>
														</button>
													</span>
												</div>
											</div>


											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Previleges / Role </label>
												<div class="form-group input-group mb-0">
													<select class="form-control">
														<option>Selecte Previleges / Role</option>
														<option>Administator</option>
														<option selected>Centre Incharge</option>
														<option>Mediacal Officer</option>
														<option>PCA</option>
														<option>PCA Head</option>
														<option>Super Administator</option>
													</select>
													<!--<span class="input-group-btn">
<button style="border-radius: 0px 4px 4px 0px;" data-toggle="modal" data-target="#AddDesignationModal" class="btn btn-primary" type="button">
<i class="fa fa-plus"></i>
</button>
</span>-->
												</div>
											</div>

										</div>



										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 sgroup">
												<label> Select Group </label>
												<div class="form-group input-group mb-0">
													<select id="sgroup" multiple>
														<option selected value="value 1">Accounts</option>
														<option value="value 2">Activities</option>
														<option selected value="value 3">Administration</option>
														<option value="value 4">Dietary</option>
														<option value="value 5">General</option>
														<option selected value="value 6">HR</option>
													</select> <span class="input-group-btn">
														<button style="border-radius: 0px 4px 4px 0px;"
															data-toggle="modal" data-target="#AddUserModal"
															class="btn btn-primary" type="button">
															<i class="fa fa-plus"></i>
														</button>
													</span>
												</div>
											</div>

										</div>





										<div class="form-group row">

											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Email </label> <input class="form-control"
													placeholder="Email Address"
													value="bhargav@ultrainfotech.net" type="text">
											</div>


											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Password </label>
												<div class="form-group pass_show">
													<input type="password" value="Th_L@lu-123"
														class="form-control" placeholder="Current Password">
												</div>
											</div>


											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<label> Mobile # </label> <input class="form-control"
													placeholder="Enter Mobile No." value="9427611304"
													type="text">
											</div>

										</div>


										<div class="form-group row">

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Gender </label> <select class="form-control">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>



											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Date of Birth </label> <input class="form-control"
													type="text" placeholder="DD/MM/YYYY" value="27/04/1971"
													data-mask="99/99/9999" />
											</div>


											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> PAN </label> <input class="form-control"
													placeholder="PAN Card No." value="ABCD123A" type="text">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<label> Aadhar Card No. </label> <input class="form-control"
													type="text" placeholder="0123/4567/8910"
													value="0123/4567/8910" data-mask="9999/9999/9999" />
											</div>

										</div>


										<hr>

										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<a href="#" class="btn btn-md btn-success btn-block">
													Update Profile </a>
											</div>

										</div>



									</form>
								</div>

							</div>
						</div>


						<!--<div class="col-md-9">
<div class="profile-content">
<div class="row">
<div class="col-md-12">
<h4>Modify your Profile</h4>
<br>
</div>
</div>
<form>
<div class="form-group row">
<label for="username" class="col-4 col-form-label">User Name*</label>
<div class="col-8">
<input id="username" name="username" placeholder="Username" class="form-control here"
required="required" type="text">
</div>
</div>
<div class="form-group row">
<label for="name" class="col-4 col-form-label">First Name</label>
<div class="col-8">
<input id="name" name="name" placeholder="First Name" class="form-control here" type="text">
</div>
</div>
<div class="form-group row">
<label for="lastname" class="col-4 col-form-label">Last Name</label>
<div class="col-8">
<input id="lastname" name="lastname" placeholder="Last Name" class="form-control here"
type="text">
</div>
</div>
<div class="form-group row">
<label for="text" class="col-4 col-form-label">Nick Name*</label>
<div class="col-8">
<input id="text" name="text" placeholder="Nick Name" class="form-control here" required="required"
type="text">
</div>
</div>
<div class="form-group row">
<label for="email" class="col-4 col-form-label">Email*</label>
<div class="col-8">
<input id="email" name="email" placeholder="Email" class="form-control here" required="required"
type="text">
</div>
</div>
<div class="form-group row">
<label for="publicinfo" class="col-4 col-form-label">Public Info</label>
<div class="col-8">
<textarea id="publicinfo" name="publicinfo" cols="40" rows="4" class="form-control"></textarea>
</div>
</div>
<div class="form-group row">
<label for="newpass" class="col-4 col-form-label">New Password</label>
<div class="col-8">
<input id="newpass" name="newpass" placeholder="New Password" class="form-control here"
type="text">
</div>
</div>
<div class="form-group row">
<div class="offset-4 col-8">
<button name="submit" type="submit" class="btn btn-primary">Update My Profile</button>
</div>
</div>
</form>
</div>
</div>-->
					</div>

				</div>
			</div>
			<!-- End of Main Content -->

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






	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>




	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>




	<script>
$(document).ready(function() {
var x = new SlimSelect({
select: '#demo'
});
});
</script>


	<script>
CKEDITOR.replace('editor1', {
height: 150
});
</script>


	<script>
$(document).ready(function () {
// create DateTimePicker from input HTML element
$("#fromdatetimepicker").kendoDateTimePicker({
value: new Date(),
dateInput: true
});
});
</script>


	<script>
$(document).ready(function () {
// create DateTimePicker from input HTML element
$("#todatetimepicker").kendoDateTimePicker({
value: new Date(),
dateInput: true
});
});
</script>



	<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
var fileName = $(this).val().split("\\").pop();
$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>




	<script>
$(document).ready(function() {
var x = new SlimSelect({
select: '#slocation',
});
});
</script>


	<script>
$(document).ready(function() {
var x = new SlimSelect({
select: '#sgroup',
});
});
</script>




	<script>
CKEDITOR.replace('editor1', {
height: 150
});
</script>


	<script>
$(document).ready(function () {
// create DateTimePicker from input HTML element
$("#fromdatetimepicker").kendoDateTimePicker({
value: new Date(),
dateInput: true
});
});
</script>


	<script>
$(document).ready(function () {
// create DateTimePicker from input HTML element
$("#todatetimepicker").kendoDateTimePicker({
value: new Date(),
dateInput: true
});
});
</script>



	<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
var fileName = $(this).val().split("\\").pop();
$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>



	<script>
  
$(document).ready(function(){
$('.pass_show').append('<span class="ptxt">Show</span>');  
});
  

$(document).on('click','.pass_show .ptxt', function(){ 

$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 

$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 

});  
</script>





</body>

</html>
