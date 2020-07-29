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


<title>Payment</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/confirmPay.js"></script>

</head>

<body ng-app="ywm" ng-controller="confirmPay" ng-init="getCourseDetailForPay(<%= request.getParameter("courseId") %>, <%= session.getAttribute("userid") %>)">

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
					<h1>Payment</h1>
					<span> Confirm Payment </span>
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
						<form ng-submit="PayNow(<%= request.getParameter("courseId") %>, <%= session.getAttribute("userid") %>)">

							<div class="row clearfix">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
									<h1>{{courseDetail.courceTitle}}</h1>
									<span> {{courseDetail.courceSubTitle}}</span><br><br>
									<h4>Date : <span class="head-line">{{courseDetail.scheduleStartDate | date :  "dd-MMM-y"}} to {{courseDetail.scheduleEndDate | date :  "dd-MMM-y"}}</span></h4>
									<h4>Timings : <span class="head-line">{{courseDetail.batchStartTime}} to {{courseDetail.batchEndTime}}</span></h4>
									<h4>Days : <span class="head-line">{{courseDetail.scheduleDays}}</span></h4>
								</div>	
							</div>
							<div class="row clearfix">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
									
								</div>	
							</div>

							<div class="contact-section-btn" ng-if="courseDetail.courseFee != 0.0 || courseDetail.courseFee != 0">
								<div class="row m-0 justify-content-md-between align-items-end">
									<div style="margin: 0 auto; margin-top: 20px;"
										class="form-group text-center">
										<button class="theme-btn btn-style-one" type="submit" data-loading-text="Please wait...">
											<span> Pay Rs. {{courseDetail.courseFee}} <span ng-if="courseDetail.courceFeeValidity != ''">({{courseDetail.courceFeeValidity}})</span></span>
										</button>
									</div>
								</div>
								<br>
								<div class="form-group row mb-0" ng-show="userError == 1">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<div class="alert alert-danger">{{errorMsg}}</div>
									</div>						
								</div>
							</div>
							
							<div class="contact-section-btn" ng-if="courseDetail.courseFee == 0.0 || courseDetail.courseFee == 0">
								<div class="row m-0 justify-content-md-between align-items-end">
									<div style="margin: 0 auto; margin-top: 20px;"
										class="form-group text-center">
										<button class="theme-btn btn-style-one" type="submit" data-loading-text="Please wait...">
											<span> Register for free <span ng-if="courseDetail.courceFeeValidity != ''">({{courseDetail.courceFeeValidity}})</span></span>
										</button>
									</div>
								</div>
								<br>
								<div class="form-group row mb-0" ng-show="userError == 1">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
										<div class="alert alert-danger">{{errorMsg}}</div>
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