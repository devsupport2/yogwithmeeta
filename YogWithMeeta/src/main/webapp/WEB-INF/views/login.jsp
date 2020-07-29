<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap"
	rel="stylesheet">


<title>Login</title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/front/assets/images/favicon.ico">

<!-- BS CSS -->
<link href="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">-->

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/front/assets/images/favicon.ico">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/front/assets/font-awesome-4.7.0/css/font-awesome.min.css">

<!--  CSS  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/owl.css">


<!-- includes js File START-->
<script src="<%=request.getContextPath() %>/resources/front/assets/js/w3data.js"></script>
<!-- includes js File END-->


<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/frontRegister.js"></script>

</head>

<body ng-app="ywm" ng-controller="frontRegisterCtrl">

	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->


	<!--/header START-->
	<%@include file="header.jsp" %>
	<!--/header END-->



	<!-- Page Content -->
	<div class="page-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Login</h1>
				</div>
			</div>
		</div>
	</div>



	<!-- Volunteer -->
	<section class="volunteer-section">
		<div class="auto-container">

			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-3 order-lg-2"></div>
				<div class="col-lg-6">

					<div class="default-form-area wow fadeInUp" data-wow-delay="200ms">
						<form ng-submit="loginUser()">

							<div class="row clearfix">

								

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="text" id="email" name="email" ng-model="email" class="form-control input-lg" placeholder="Email Address*" ng-change="setFlag()">
										<p class="errormsg" ng-show="emailError == 1">{{emailMsg}}</p>
									</div>
								</div>

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="password" id="password" name="password" ng-model="password" class="form-control input-lg" placeholder="Password*" ng-change="setFlag()">
										<p class="errormsg" ng-show="passwordError == 1">{{passwordMsg}}</p>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="customCheck" ng-model="rememberMe">
											<label class="custom-control-label" for="customCheck">Remember Me</label>
										</div>
									</div>
									<a href="#" ng-click="forgotPass()">Forgot Password?</a>
								</div>
							</div>

							<div class="contact-section-btn">
								<div class="row m-0 justify-content-md-between align-items-end">
									<div style="margin: 0 auto; margin-top: 20px;"
										class="form-group text-center">
										<button type="submit" class="theme-btn btn-style-one" data-loading-text="Please wait..." ng-disable="loginSpin == 1">
											<span> Login <i ng-show="loginSpin == 1" class="fa fa-spinner fa-pulse"></i></span>
										</button>
									</div>
								</div>
								<br>
								<div class="form-group row mb-0" ng-show="userError == 1">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<div class="alert alert-danger">{{errorMsg}}</div>
									</div>						
								</div>
								<div class="form-group row mb-0" ng-show="userSuccess == 1">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<div class="alert alert-success">{{errorMsg}}</div>
									</div>						
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!--/footer START-->
	<%@include file="footer.jsp" %>
	<!--/footer END-->








	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath() %>/resources/front/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Additional Scripts -->
	<script src="<%=request.getContextPath() %>/resources/front/assets/js/custom.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/assets/js/owl.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/assets/js/slick.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/assets/js/accordions.js"></script>

	<script language="text/Javascript"> 
cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
function clearField(t){                   //declaring the array outside of the
if(! cleared[t.id]){                      // function makes it static and global
cleared[t.id] = 1;  // you could use true and false, but that's more typing
t.value='';         // with more chance of typos
t.style.color='#fff';
}
}
</script>

</body>
</html>