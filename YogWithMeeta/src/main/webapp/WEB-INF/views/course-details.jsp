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


<title>Loading... | Course Details</title>

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


<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/courseDetails.js"></script>

</head>

<body ng-app="ywm" ng-controller="courseDetailCtrl" ng-init="getCourseDetail(<%= request.getParameter("courseId") %>)">

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
					<h1>{{courseDetail.courceTitle}}</h1>
					<span> {{courseDetail.courceSubTitle}}</span>
				</div>
			</div>
		</div>
	</div>

	<!-- Start Content -->
	<div id="content">
		<div class="container">

			<%-- <div style="margin-bottom: 2em" class="row ">
				<div class="col-md-12">
					<div
						class="call-action call-action-boxed call-action-style1 clearfix">
						<!-- Call Action Button -->
						<div class="button-side" style="margin-top: 8px;">
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
							<!-- <button href="#" class="btn-system btn-green btn-large" disabled>
								You are Registered</button> -->
						</div>
						<!-- Call Action Text -->
						<h2 class="primary">{{courseDetail.courceTitle}}</h2>
						<p>{{courseDetail.scheduleStartDate | date :  "dd-MMM-y"}} to {{courseDetail.scheduleEndDate | date :  "dd-MMM-y"}}</p>
					</div>
				</div>
			</div> --%>


			<div class="row blog-page">


				<!--Sidebar-->
				<div class="col-md-4 sidebar left-sidebar">

					<!-- Categories Widget -->
						<div id="{{courseDetail.videoLink}}" class="widget video-course widget-categories">
						{{getLink(courseDetail.videoLink);""}}
						</div>

					<!-- Categories Widget -->
					<div class="widget widget-categories">
						<h4>
							Timings & Days<span class="head-line"></span>
						</h4>
						<p style="line-height: 24px;">{{courseDetail.batchStartTime}} to {{courseDetail.batchEndTime}} <br>{{shortenDays(courseDetail.scheduleDays);""}}<label class="category" ng-repeat="i in ShortenDays"> {{i}}{{$last ? '' : ($index==ShortenDays.length-2) ? ' and&nbsp;' : ',&nbsp;'}}</label></p>

					</div>


					<!-- Categories Widget -->
					<div class="widget widget-categories">
						<h4>
							Location <span class="head-line"></span>
						</h4>

						<p ng-if='courseDetail.courceLocation == "Online"'>{{courseDetail.courceLocation}}</p>
						<p ng-if='courseDetail.courceLocation != "Online"'><button href="{{courseDetail.courceLocation}}" class="btn-system btn-green btn-large" disabled>
								Take me there!</button></p>
					</div>




					<!-- Categories Widget -->
					<div class="widget widget-categories">
						<h4>
							Fee <span class="head-line"></span>
						</h4>

						<p>Rs. {{courseDetail.courseFee}} <span ng-if="courseDetail.courceFeeValidity != ''">({{courseDetail.courceFeeValidity}})</span></p>

					</div>


					<!-- Popular Posts widget -->
					<div class="widget widget-popular-posts">
						<h4>
							Organizer <span class="head-line"></span>
						</h4>
						<ul>
							<li>
								<div class="widget-thumb">
									<a href="#"><img src="<%=request.getContextPath() %>/resources/front/assets/images/course-details.png"
										alt="" /></a>
								</div>
								<div class="widget-content">
									<h5>Yog With Meeta</h5>
								</div>
								<div class="clearfix"></div>
							</li>

						</ul>
					</div>

				</div>
				<!--End sidebar-->


				<!-- Start Blog Posts -->
				<div class="col-md-8 blog-box">

					<!-- Start Post -->
					<div class="blog-post image-post">
						<!-- Post Thumb -->
						<div class="post-head">
							<img class="img-responsive" alt=""
								src="{{courseDetail.courceImage}}">
						</div>
						<!-- Post Content -->
						<div class="post-content">

							<h2>
								<a href="#"> {{courseDetail.courceTitle}} </a>
							</h2>

							<h5>{{courseDetail.courceSubTitle}}</h5>

							<!-- <ul class="post-meta">
								<li>By <a href="#"> Meeta Shah </a></li>
							</ul> -->

							<!-- <hr>

							<p style="margin-bottom: 0px;">
								<strong> {{courseDetail.courceTitle}} </strong>
							</p>
							<p style="line-height: 24px;">{{courseDetail.scheduleStartDate | date :  "dd-MMM-y"}} - {{courseDetail.scheduleEndDate | date :  "dd-MMM-y"}}</p>


							<p style="margin-bottom: 0px;">
								<strong> Every ({{courseDetail.scheduleDays}}) </strong>
							</p>
							<p style="line-height: 24px;">{{courseDetail.batchStartTime}} to {{courseDetail.batchEndTime}}</p>
 							-->
							<hr>
							<div ng-bind-html ="courseDetail.courceDescription | to_trusted"></div>
							<hr>
							<h5>Contact</h5>
							<p><i class="fa fa-user" aria-hidden="true"></i> {{courseDetail.contactPersonName}} <br> <i class="fa fa-phone" aria-hidden="true"></i> {{courseDetail.contactPersonPhone}} <br> <i class="fa fa-envelope-o" aria-hidden="true"></i> {{courseDetail.contactPersonEmail}}</p>
							<hr>
							<!-- <div class="row sidebar">

								<div class="col-lg-6">
									<div class="widget widget-categories">
										<h4>
											Includes <span class="head-line"></span>
										</h4>
										<ul>
											<li>Asanas</li>
											<li>Pranayama</li>
											<li>Deep relaxation technique</li>
											<li>Diet guidance</li>
											<li style="border-bottom: none;">yog nindra</li>

										</ul>
									</div>
								</div>







								<div class="col-lg-6">
									<div class="widget widget-categories">
										<h4>
											Benefits <span class="head-line"></span>
										</h4>
										<ul>
											<li>Strength & stamina</li>
											<li>Release pain & aches</li>
											<li>Weight management</li>
											<li>Increased awareness</li>
											<li style="border-bottom: none;">Freedom from stress</li>
										</ul>
									</div>
								</div>









							</div> -->



							<div style="margin-bottom: 2em" class="row ">
								<div class="col-md-12">
									<div class="clearfix">
										<!-- Call Action Button -->
										<div class="button-side" style="margin-top: 8px; text-align: center">
											<%if(session.getAttribute("userid") == null)
											{%>  
											<div class="link-btn">
												<a href="<%=request.getContextPath() %>/register?courseId=<%= request.getParameter("courseId") %>" style="display: block"
													class="theme-btn btn-style-one donate-box-btn"><span>Register & Pay</span></a>
											</div>
											<%} else {%>
											<div class="link-btn">
												<a href="<%=request.getContextPath() %>/confirm-registration?courseId=<%= request.getParameter("courseId") %>" style="display: block"
													class="theme-btn btn-style-one donate-box-btn"><span>Quick Register</span></a>
											</div>
											<%}%>
											<!-- <button href="#" class="btn-system btn-green btn-large"
												disabled>You are Registered</button> -->
										</div>
									</div>
								</div>
							</div>



						</div>
					</div>
					<!-- End Post -->




				</div>
				<!-- End Blog Posts -->


			</div>



		</div>
	</div>
	<!-- End Content -->



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