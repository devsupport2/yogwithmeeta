<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="ScreenOrientation" content="autoRotate:disabled">
<meta name="theme-color" content="#b22222">

<title>Dashboard | Yog with Meeta</title>

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


<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link>

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/adminDashboard.js"></script>

</head>

<body id="page-top" ng-app="ywm" ng-controller="adminDashboardCtrl">

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


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

						<a href="add-course"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							<i class="fa fa-thumb-tack"></i> Add New Course
						</a>

						<!--<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
						<i class="fa fa-users"></i> Create New Group </a>-->


					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1 font-16">
												Course</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												({{getAllCounts.courseCount}})</div>
										</div>
										<div class="col-auto">
											<i style="opacity: 0.4;"
												class="fas fa-clipboard-list fa-2x text-primary"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1 font-16">
												Schedule</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												({{getAllCounts.scheduleCount}})</div>
										</div>
										<div class="col-auto">
											<i style="opacity: 0.4;"
												class="fas fa-clipboard-list fa-2x text-success"></i>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1 font-16">
												Batch</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">({{getAllCounts.batchCount}})</div>
										</div>
										<div class="col-auto">
											<i style="opacity: 0.4;"
												class="fas fa-clipboard-list fa-2x text-warning"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->


				</div>
				<!-- /.container-fluid -->

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




	<!-- BS JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script>

	<!-- scripts-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>





</body>

</html>
