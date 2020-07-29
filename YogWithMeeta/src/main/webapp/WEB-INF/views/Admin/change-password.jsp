<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Change Password</title>

<link rel="shortcut icon" href="img/favicon.ico">

<!-- fonts -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- styles -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link href="css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="css/responsive.css" rel="stylesheet">


<!-- Font Awesome -->
<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">



<script src="js/slimselect.min.js"></script>
<link href="css/slimselect.min.css" rel="stylesheet"></link>


<!--*******-->
<script src="https://cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>




<!--*******-->
<link rel="stylesheet"
	href="https://kendo.cdn.telerik.com/2018.1.221/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="datetimepicker/css/kendo.material.min.css" />
<link rel="stylesheet"
	href="datetimepicker/css/kendo.material.mobile.min.css" />
<script src="datetimepicker/js/jquery.min.js"></script>
<script src="datetimepicker/js/kendo.all.min.js"></script>

<!-- includes js File START-->
<script src="js/w3data.js"></script>
<!-- includes js File END-->

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled"
			id="accordionSidebar">
			<!--/Left Navigation START-->
			<div w3-include-html="includes/left-nav.html"></div>
			<!--/Left Navigation END-->

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline mt-15">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>



					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">



						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">
									Bhargav Bhatt </span> <img class="img-profile rounded-circle"
								src="img/profile-pic.png">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a>
								<!--<a class="dropdown-item" href="#">
<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
Settings
</a>-->
								<a class="dropdown-item" href="#"> <i
									class="fa fa-key mr-2 text-gray-400"></i> Change Password
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>



				</nav>
				<!-- End of Topbar -->







				<div class="container-fluid">
					<div class="row profile">

						<div class="col-lg-3 col-md-3 col-sm-12 col-xl-3"></div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
							<!-- Collapsable Card Example -->
							<div class="card  mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Change
										Password</h6>
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<form class="">


										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
												<label> Current Password </label> <input
													class="form-control" placeholder="Current Password"
													type="text">
											</div>

										</div>


										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
												<label> New Password </label> <input class="form-control"
													placeholder="New Password" type="text">
											</div>

										</div>


										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
												<label> Confirm New Password </label> <input
													class="form-control" placeholder="Confirm New Password"
													type="text">
											</div>

										</div>

										<hr>

										<div class="form-group row">

											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<a href="#" class="btn btn-md btn-success btn-block">
													Update Password </a>
											</div>

										</div>



									</form>
								</div>

							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-12 col-xl-3"></div>

					</div>

				</div>
			</div>
			<!-- End of Main Content -->

			<!--/#footer START-->
			<div w3-include-html="includes/footer.html"></div>
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





	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>




	<!-- includes function START-->
	<script>
		w3IncludeHTML();
	</script>
	<!-- includes function END-->


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>




	<!--inputmask-->
	<script src="js/bootstrap-inputmask.js"></script>




	<script>
		$(document).ready(function() {
			var x = new SlimSelect({
				select : '#demo'
			});
		});
	</script>


	<script>
		CKEDITOR.replace('editor1', {
			height : 150
		});
	</script>


	<script>
		$(document).ready(function() {
			// create DateTimePicker from input HTML element
			$("#fromdatetimepicker").kendoDateTimePicker({
				value : new Date(),
				dateInput : true
			});
		});
	</script>


	<script>
		$(document).ready(function() {
			// create DateTimePicker from input HTML element
			$("#todatetimepicker").kendoDateTimePicker({
				value : new Date(),
				dateInput : true
			});
		});
	</script>



	<script>
		// Add the following code if you want the name of the file appear on select
		$(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				});
	</script>




	<script>
		$(document).ready(function() {
			var x = new SlimSelect({
				select : '#slocation',
			});
		});
	</script>


	<script>
		$(document).ready(function() {
			var x = new SlimSelect({
				select : '#sgroup',
			});
		});
	</script>




	<script>
		CKEDITOR.replace('editor1', {
			height : 150
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
