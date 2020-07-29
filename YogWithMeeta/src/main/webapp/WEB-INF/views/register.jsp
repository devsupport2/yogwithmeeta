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


<title>Registration</title>

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
					<h1>Registration</h1>
					<span> New User Registration </span>
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
						<form ng-submit="registerUser()">

							<div class="row clearfix">

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="text" name="firstname" id="firstname" ng-model="user.firstName" class="form-control input-lg" placeholder="First Name*" ng-change="setFlag()">
										<p class="errormsg" ng-show="firstNameError == 1">{{firstNameMsg}}</p>
									</div>
								</div>

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="text" name="lastname" id="lastname" ng-model="user.lastName" class="form-control input-lg" placeholder="Last Name" ng-change="setFlag()">
									</div>
								</div>

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="text" id="email" name="email" ng-model="user.email" class="form-control input-lg" placeholder="Email Address*" ng-blur="checkEmailaddress()" ng-change="setFlag()">
										<p class="errormsg" ng-show="emailError == 1">{{emailMsg}}</p>
									</div>
								</div>

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="text" id="mobileno" name="mobileno" ng-model="user.mobileNo" class="form-control input-lg" placeholder="Mobile Number*" ng-change="setFlag()">
										<p class="errormsg" ng-show="mobileNoError == 1">{{mobileNoMsg}}</p>
									</div>
								</div>



								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="password" id="password" name="password" ng-model="user.password" class="form-control input-lg" placeholder="Password*" ng-change="setFlag()">
										<p class="errormsg" ng-show="passwordError == 1">{{passwordMsg}}</p>
									</div>
								</div>

								<div class="col-lg-6 col-md-6 column">
									<div class="form-group">
										<input type="password" id="confirmpassword" ng-model="user.confirmPassword" name="confirmpassword" class="form-control input-lg" placeholder="Confirm Password*" ng-change="setFlag()">
										<p class="errormsg" ng-show="confirmPasswordError == 1">{{confirmPasswordMsg}}</p>
									</div>
								</div>

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="date" name="birthdate" id="birthdate" ng-model="user.dateOfBirth" class="form-control input-lg" placeholder="dd/mm/yyyy">
									</div>
								</div>

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="address1" id="address1" ng-model="user.address" class="form-control input-lg" placeholder="Address">
									</div>
								</div>




								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<select id="countryname" name="countryname" class="form-control input-lg" ng-model="user.countryId" ng-change="onCountryChange(user.countryId); setFlag();" ng-options="item.countryId as item.countryName for item in getCountry">
											<option value="">Select country</option>
										</select>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<select id="statename" name="statename" class="form-control input-lg" ng-model="user.stateId" ng-options="item.stateId as item.stateName for item in getState" class="form-control" ng-change="setFlag()">
											<option value="">Select State</option>
										</select>
									</div>
								</div>

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="city" id="city" ng-model="user.city" class="form-control input-lg" placeholder="City" ng-change="setFlag()">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="pincode" id="pincode" ng-model="user.pincode" class="form-control input-lg" placeholder="PIN" ng-change="setFlag()">
									</div>
								</div>
								
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<textarea name="healthProblem" id="healthProblem" ng-model="user.healthProblem" class="form-control input-lg" placeholder="any health problem ?"></textarea>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<textarea name="specificRequirement" id="specificRequirement" ng-model="user.specificRequirement" class="form-control input-lg" placeholder="any Specific requirement ?"></textarea>
									</div>
								</div>

							</div>

							<div class="contact-section-btn">
								<div class="row m-0 justify-content-md-between align-items-end">
									<div style="margin: 0 auto; margin-top: 20px;"
										class="form-group text-center">
										<button class="theme-btn btn-style-one" type="submit" data-loading-text="Please wait...">
											<span> Register </span>
										</button>
									</div>
								</div>
								<br>
								<div class="form-group row mb-0" ng-show="userError == 1">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<div ng-show="userError1 != 1" class="alert alert-danger">{{errorMsg | to_trusted}}</div>
										<div ng-show="userError1 == 1" class="alert alert-danger">You already have account with us! Please <a href="<%=request.getContextPath() %>/login">Login</a> to continue</div>
									</div>						
								</div>
								<%-- <div class="form-group row mb-0" ng-show="userError == 1">
									<div style="margin: 0 auto; margin-top: 20px;" class="form-group text-center">
										<a class="theme-btn btn-style-one" href="<%=request.getContextPath() %>/login">
											<span> Login </span>
										</a>
									</div>
								</div> --%>
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