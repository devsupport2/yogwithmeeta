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


<title>Courses | Yoga, Meditation, Pranayama, Sound Healing,
	Office Yoga, Yog Nindra. Stress & Anger Management, Law of
	Attraction...</title>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/front/assets/images/favicon.ico">

<!-- BS CSS -->
<link
	href="<%=request.getContextPath()%>/resources/front/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!--<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">-->

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/front/assets/images/favicon.ico">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/front/assets/font-awesome-4.7.0/css/font-awesome.min.css">

<!--  CSS  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/front/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/front/assets/css/main.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/responsive.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/front/assets/css/owl.css">

<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/frontCources.js"></script>


<style>
.contentDe {
  height: 100px;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
</head>

<body ng-app="ywm" ng-controller="CourseCtrl">

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
	<%@include file="header.jsp"%>
	<!--/header END-->



	<!-- Page Content -->
	<div class="page-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Courses</h1>
					<span> Yoga, Meditation, Pranayama, Sound Healing, Office
						Yoga, Yog Nindra. Stress & Anger Management, Law of Attraction...
					</span>
				</div>
			</div>
		</div>
	</div>




	<!-- Causes Section -->
	<section style="padding: 90px 0 90px;" class="causes-section">
		<div class="container">

			<div class="row">

				<!-- Cause Block One -->
				<div ng-repeat="item in getAllCourseFront" ng-if="item.scheduleEndDate >= todaydate" class="cause-block-one col-md-4">
					<div class="inner-box">
						<div class="image">
							<a href="<%=request.getContextPath() %>/course-details?courseId={{item.courceId}}"><img src="{{item.courceImage}}" alt=""></a>
						</div>
						<div class="lower-content">
							<h4>
								<a href="<%=request.getContextPath() %>/course-details?courseId={{item.courceId}}"> {{item.courceTitle}} </a>
							</h4>

							<div class="category">
								<strong> Dates: </strong> {{item.scheduleStartDate | date :  "dd-MMM-y"}} to {{item.scheduleEndDate | date :  "dd-MMM-y"}}
							</div>
							<div class="category">
								<strong> Days:{{shortenDays(item.scheduleDays);""}} </strong><label class="category" ng-repeat="i in ShortenDays"> {{i}}{{$last ? '' : ($index==ShortenDays.length-2) ? ' and&nbsp;' : ',&nbsp;'}}</label>
							</div>
							<div class="category">
								<strong> Time: </strong> {{item.batchStartTime}} to {{item.batchEndTime}}
							</div>

							<hr>
							 <div style="font-size: 14px; color:black;" class="text contentDe" ng-bind-html ="item.courceDescription | to_trusted"></div>

							
							<div style="text-align: center; border: 1px dotted #aaa; padding: 6px 0px 6px 0px; border-radius: 50px; font-weight: 600; color: #212529;"
								class="text">
								Fee: Rs. {{item.courseFee}} <small ng-if="item.courceFeeValidity != ''">({{item.courceFeeValidity}})</small>
							</div>
							
							<div style=" text-align: center; border: 1px dotted #aaa; padding: 6px 0px 6px 0px; border-radius: 50px; font-weight: 600; color: #212529;" class="text">
								<a href="<%=request.getContextPath() %>/course-details?courseId={{item.courceId}}">Know More</a>
							</div>
							

							<div class="bottom-content">
							<%if(session.getAttribute("userid") == null)
								{%>  
								<div class="link-btn">
									<a href="<%=request.getContextPath() %>/register?courseId={{item.courceId}}" style="display: block"
										class="theme-btn btn-style-one donate-box-btn"><span>Register & Pay</span></a>
								</div>
								<%} else {%>
								<div class="link-btn">
									<a href="<%=request.getContextPath() %>/confirm-registration?courseId={{item.courceId}}" style="display: block"
										class="theme-btn btn-style-one donate-box-btn"><span>Quick Register</span></a>
								</div>
								<%}%>
							</div>
						</div>
					</div>
				</div>
				
			</div>


		</div>
	</section>




	<!--/footer START-->
	<%@include file="footer.jsp"%>
	<!--/footer END-->






	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=request.getContextPath() %>/resources/front/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Additional Scripts -->
	<script
		src="<%=request.getContextPath() %>/resources/front/assets/js/custom.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/front/assets/js/owl.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/front/assets/js/slick.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/front/assets/js/accordions.js"></script>

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