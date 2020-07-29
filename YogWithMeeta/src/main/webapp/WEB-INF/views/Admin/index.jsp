<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login | Yog with Meeta</title>

<!-- fonts -->
<link href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- styles -->
<link
	href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link
	href="<%=request.getContextPath()%>/resources/admin/css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="<%=request.getContextPath()%>/resources/admin/css/responsive.css" rel="stylesheet">

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet">


<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/adminLogin.js"></script>

</head>

<body class="bg-gradient-login" ng-app="ywm" ng-controller="adminLoginCtrl">

	<section id="login">
		<div class="container">

			<!-- Outer Row -->
			<div class="row justify-content-center">

				<div class="col-xl-10 col-lg-12 col-md-9">

					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<!--<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>-->

								<div class="col-lg-6 hidden-sm hidden-xs">
									<img class="img-responsive"
										src="<%=request.getContextPath()%>/resources/admin/img/login-img.jpg" />
								</div>

								<div class="col-lg-6">
									<div class="p-5">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Yog with Meeta</h1>
										</div>
										<form class="user" ng-submit="checkAdminLogin()">
											<div class="form-group">
												<input type="email" ng-model="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email" ng-change="setflag()" autofocus>
												<p class="errormsg" ng-show="emailError == 1">{{emailMsg}}</p>
											</div>
											<div class="form-group">
												<input type="password" ng-model="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password" ng-change="setflag()">
												<p class="errormsg" ng-show="passwordError == 1">{{passwordMsg}}</p>
											</div>
											<div class="form-group">
												<div class="custom-control custom-checkbox small">
													<input type="checkbox" class="custom-control-input" id="customCheck">
													<label class="custom-control-label" for="customCheck">Remember Me</label>
												</div>
											</div>
											<button type="submit" class="btn btn-primary btn-user btn-block">
												Login <i ng-show="loginSpin == 1" class="fa fa-spinner fa-pulse"></i>
											</button>
											<div class="successmsg text-center" ng-show="loginSuccess == 1">{{successMsg}}</div>
											<div class="errormsg text-center" ng-show="loginError == 1">{{errorMsg}}</div>
										</form>

										<hr>
										<!-- <div class="text-center">
											<a class="small" href="forgot-password.html">Forgot
												Password?</a>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
	</section>


	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>

</body>

</html>

