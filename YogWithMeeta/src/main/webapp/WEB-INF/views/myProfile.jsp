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


<title>My Profile</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/userProfile.js"></script>

</head>

<body ng-app="ywm" ng-controller="userProfileCtrl" ng-init="GetUserDetail(<%= session.getAttribute("userid") %>)">

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
					<h1>Profile</h1>
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
						<form ng-submit="updateUserProfile(userDetail.userId)">
							<div class="form-group row">
								<div class="col col-lg-12">
									<div class="text-center">
										<img ng-show="!userDetail.userImage" src="<%=request.getContextPath()%>/resources/admin/img/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="">
										<img ng-src="{{userDetail.userImage}}" ng-show="userDetail.userImage" class="avatar img-circle img-thumbnail" alt="User Image">
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<div class="custom-file">
										<input type="file" class="custom-file-input form-control-lg" id="userimage1" name="userimage1" placeholder="Attach Files">
										<label class="custom-file-label form-control-lg" for="userimage1">Upload a different photo... </label>
									</div>
								</div>
							</div>
							<div class="form-group  mb-10 row">
								<div class="col col-lg-12">
									<input type="text" class="form-control form-control-lg" id="firstname" ng-model="userDetail.firstName" placeholder="First Name*" ng-change="setFlag()" />
									<p class="errormsg" ng-show="firstNameError == 1">{{firstNameMsg}}</p>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<input type="text" class="form-control form-control-lg" id="lastname" ng-model="userDetail.lastName" placeholder="Last Name" />													
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<input type="email" class="form-control form-control-lg" id="email" ng-model="userDetail.email" placeholder="Email*"  ng-change="setFlag()" />
									<p class="errormsg" ng-show="emailError == 1">{{emailMsg}}</p>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<input type="text" class="form-control form-control-lg" id="mobileno" ng-model="userDetail.mobileNo" placeholder="Mobile No*" ng-change="setFlag()" />
									<p class="errormsg" ng-show="mobileNoError == 1">{{mobileNoMsg}}</p>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<select class="form-control form-control-lg" id="gender" ng-model="userDetail.gender">
										<option value="">Gender</option>
										<option value="m">Male</option>
										<option value="f">Female</option>
										<option value="o">Other</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-12">
									<input type="text" name="address1" id="address1" ng-model="userDetail.address" class="form-control input-lg" placeholder="Address">
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-6">
									<select id="countryname" name="countryname" class="form-control input-lg" ng-model="userDetail.countryId" ng-change="onCountryChange(userDetail.countryId); setFlag();" ng-options="item.countryId as item.countryName for item in getCountry">
										<option value="">Select country</option>
									</select>
								</div>
								<div class="col col-lg-6">
									<select id="statename" name="statename" class="form-control input-lg" ng-model="userDetail.stateId" ng-options="item.stateId as item.stateName for item in getState" class="form-control" ng-change="setFlag()">
										<option value="">Select State</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col col-lg-6">
									<input type="text" name="city" id="city" ng-model="userDetail.city" class="form-control input-lg" placeholder="City" ng-change="setFlag()">
								</div>
								<div class="col col-lg-6">
									<input type="text" name="pincode" id="pincode" ng-model="userDetail.pincode" class="form-control input-lg" placeholder="PIN" ng-change="setFlag()">
								</div>
							</div>					
							<div class="form-group mb-0 row justify-content-md-between">
								<div class="col col-lg-12 text-center">
									<button type="submit" ng-disabled="spinUser == 1" class="theme-btn btn-style-one">Update Profile <i ng-show="spinUser == 1" class="fa fa-spinner fa-pulse"></i></button>
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