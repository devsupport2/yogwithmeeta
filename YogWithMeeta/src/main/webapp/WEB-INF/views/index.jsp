<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap"
	rel="stylesheet">


<title>Yog With Meeta</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/frontIndex.js"></script>

<style>
.contentDe {
  height: 100px;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
</head>

<body ng-app="ywm" ng-controller="frontIndexCtrl">

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
	<!-- Banner Starts Here -->
	<div class="main-banner header-text" id="top">
		<div class="Modern-Slider">
			<!-- Item -->
			<div class="item item-1">
				<div class="img-fill">
					<!--<div class="text-content">
<h6>we are ready to help you</h6>
<h4>Financial Analysis<br>&amp; Consulting</h4>
<p>This finance HTML template is 100% free of charge provided by TemplateMo for everyone. You can download, edit and use this layout for your business website.</p>
<a href="contact.html" class="filled-button">contact us</a>
</div>-->
				</div>
			</div>
			<!-- // Item -->
			<!-- Item -->
			<div class="item item-2">
				<div class="img-fill">
					<!--<div class="text-content">
<h6>we are here to support you</h6>
<h4>Accounting<br>&amp; Management</h4>
<p>You are allowed to use this template for your company websites. You are NOT allowed to re-distribute this template ZIP file on any template download website. Please contact TemplateMo for more detail.</p>
<a href="services.html" class="filled-button">our services</a>
</div>-->
				</div>
			</div>
			<!-- // Item -->

			<!-- Item -->
			<div class="item item-3">
				<div class="img-fill">
					<!--<div class="text-content">
<h6>we have a solid background</h6>
<h4>Market Analysis<br>&amp; Statistics</h4>
<p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate mi. Sed nec cursus augue. Phasellus lacinia ac sapien vitae dapibus. Mauris ut dapibus velit cras interdum nisl ac urna tempor mollis.</p>
<a href="about.html" class="filled-button">learn more</a>
</div>-->
				</div>
			</div>
			<!-- // Item -->

			<!-- Item -->
			<div class="item item-4">
				<div class="img-fill">
					<!--<div class="text-content">
<h6>we have a solid background</h6>
<h4>Market Analysis<br>&amp; Statistics</h4>
<p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate mi. Sed nec cursus augue. Phasellus lacinia ac sapien vitae dapibus. Mauris ut dapibus velit cras interdum nisl ac urna tempor mollis.</p>
<a href="about.html" class="filled-button">learn more</a>
</div>-->
				</div>
			</div>
			<!-- // Item -->

		</div>
	</div>
	<!-- Banner Ends Here -->




	<!-- Causes Section -->
	<section class="causes-section">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>Courses</h2>
						<span> Yoga, Meditation, Pranayama, Sound Healing, Office
							Yoga, Yog Nindra. Stress &amp; Anger Management, Law Of
							Attraction... </span>
					</div>
				</div>
			</div>


			<div class="row">
				<!-- Cause Block One -->
				<div ng-repeat="item in getThreeCourseFront" ng-if="item.scheduleEndDate >= todaydate"  class="cause-block-one col-md-4">
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

			<div style="margin-top: 1em" class="row">
				<div class="col-md-12 text-center">
					<a href="courses" class="viewall-button btn-block"> View
						all Courses </a>
				</div>
			</div>

		</div>
	</section>





	<div class="services">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>What We Do</h2>
						<span> Yoga, Meditation, Pranayama, Sound Healing, Office
							Yoga, Yog Nindra. Stress & Anger Management, Law Of Attraction...
						</span>
					</div>
				</div>



				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/yoga-therapy"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/yoga.jpg"
							alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/yoga-therapy"> Yoga Therapy </a>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/weight-management"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/Weight-Management.jpg"
							alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/weight-management"> Weight Management </a>
							</h4>
						</div>
					</div>
				</div>



				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/meditation"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/Pranayama.jpg" alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/meditation"> Meditation </a>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/sound-healing"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/Sound-Healing.jpg" alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/sound-healing"> Sound Healing </a>
							</h4>
						</div>
					</div>
				</div>


				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/corporate-yoga"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/Office-Yoga.jpg" alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/corporate-yoga"> Corporate Yoga </a>
							</h4>
						</div>
					</div>
				</div>



				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="service-item">
						<a href="<%=request.getContextPath() %>/stress-and-anger-management"> <img src="<%=request.getContextPath() %>/resources/front/assets/images/Yog-Nindra.jpg" alt=""></a>
						<div class="down-content">
							<h4>
								<a href="<%=request.getContextPath() %>/stress-and-anger-management"> Stress & Anger Management </a>
							</h4>
						</div>
					</div>
				</div>



			</div>

			<div style="margin-top: 1em" class="row">
				<div class="col-md-12 text-center">
					<a style="background-color: #482917;" href="<%=request.getContextPath() %>/what-we-do"
						class="viewall-button"> View all </a>
				</div>
			</div>


		</div>
	</div>


	<!-- info section -->
	<section class="info">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 info-w3ls1">
					<a class="wmBox" href="#" data-popup="https://www.youtube.com/embed/z7tt_sMrka8">
						<img src="<%=request.getContextPath() %>/resources/front/assets/images/About-img.jpg"  class="img-responsive">
						<div class="b-wrapper">
							<i class="fa fa-play-circle-o" aria-hidden="true"></i>
						</div>
					</a>
				</div>
				<div class="col-lg-7 col-md-7 info-w3ls2">
				<div class="right-content">
				<!--<span> wewer </span>-->
				<h2> Who is  <em> Meeta? </em></h2>
<p> Meeta is every person who never gives up on a better and healthier lifestyle. Meeta is someone who will put their self above their body weight and decide to work on themselves, through themselves and for themselves. </p>

<p> In 2008, after being overweight for most of my life, I decided to lose the extra weight with Yoga – 30 kgs to be precise. The weight shredding journey was much more illuminating for me as that is when I realised that becoming a healthy human being was now a way of life. 
Like everyone else, I adopted to Yogic techniques, poses and asanas.   </p>
				
				<a href="<%=request.getContextPath() %>/about-meeta-shah" class="filled-button">Read More</a>
				
				</div>
				
				
				</div>
			</div>	
		</div>
	</section>
<!-- info section -->




	<div class="fun-facts">
		<div class="container">

			<div class="align-self-center">
				<div class="row">

					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="count-area-content">
							<div class="count-title">Corporate Workshops</div>
							<div class="count-digit">500</div>
							<div class="count-title">Participants Benefited</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="count-area-content">
							<div class="count-title">Health & Fitness</div>
							<div class="count-digit">100</div>
							<div class="count-title">Workshops Conducted</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="count-area-content">
							<div class="count-title">Yoga Sessions</div>
							<div class="count-digit">1000</div>
							<div class="count-title">People Benefited</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="count-area-content">
							<div class="count-title">Sound Healing</div>
							<div class="count-digit">100</div>
							<div class="count-title">People Benefited</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

	<div class="testimonials">
<div class="container">

<div class="row">
<div class="col-md-12">
<div class="section-heading">
<h2>What they say <em>about us</em></h2>
<span> Testimonials From Our Greatest Clients </span>
</div>
</div>
<div class="col-md-12">
<div class="owl-testimonials owl-carousel">

<div class="testimonial-item">
<div class="inner-content">
<h4> Namrata Agarwal   </h4>
<span> Vadodara </span>
<p> Thank you for the inspirational n motivational session dear meeta as the morning energy which I got used to keep me going the whole day n the sone pe suhaga was yoga nidra as it helps me keep stress away n keeps me refreshed till I go to bed  </p>
</div>
<!--<img src="http://placehold.it/60x60" alt="">-->
</div>



<div class="testimonial-item post">
<div class="video-fedback">
<iframe style="height: 277px;" src="https://www.youtube.com/embed/0tPtOF5VCfo?start=3" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!--<h4> Rahul Jani </h4>
<span> Marketing Head </span>-->
</div>
</div>

<div class="testimonial-item">
<div class="inner-content">
<h4> Jagdeep Shah   </h4>
<span> Vadodara </span>
<p> 
<!--Meetaben, Gruma <br>
Pranam <br>-->
It was great, our lock down yoga workshop <br>
I enjoyed every moment of this @21 days yoga time <br>
I appreciate your effort for this  online workshop and your personal attention to every one online movement, You teach us yoga, pranayama, and specially your Yog Nindra 

session was great  and this  21 days was our best experience of life. <br>
Thank you for this Great workshop 

</p>
</div>
<!--<img src="http://placehold.it/60x60" alt="">-->
</div>


<div class="testimonial-item post">
<div class="video-fedback">
<iframe style="height: 277px;" src="https://www.youtube.com/embed/HlUgVgZYf1w?start=7" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!--<h4> Rahul Jani </h4>
<span> Marketing Head </span>-->
</div>
</div>

<div class="testimonial-item">
<div class="inner-content">
<h4> Arti Shah </h4>
<span> Mumbai </span>
<p>Thanks meeta I am the one who has benefited the most ..coz whstever I could do was coz of your guidance. It was indeed a rediscovering session for me</p>
</div>
</div>



<div class="testimonial-item post">
<div class="video-fedback">
<iframe style="height: 277px;" src="https://www.youtube.com/embed/ZHujfQJAasI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!--<h4> Nita Shah </h4>
<span> Marketing Head </span>-->
</div>
</div>


<div class="testimonial-item">
<div class="inner-content">
<h4>  Pratiksha Shah  </h4>
<span> Vadodara </span>
<p> For me , in my mind yoga was a damn slow type of workout. I had this myth which I am so glad it broke as I came to u. I realised what I had missed for so long !! For me everytime it's yoga , it's Meeta! </p>
</div>
</div>


</div>
</div>
</div>

<div style="margin-top: 1em" class="row">
<div class="col-md-12 text-center">
<a style="background-color: #482917;" href="<%=request.getContextPath() %>/testimonials" class="viewall-button"> View all </a>
</div>
</div>


</div>
</div>




	<!-- Blog Section -->
	<section class="blog-section" ng-show="getAlbums">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>Gallery</h2>
					</div>
				</div>
			</div>


				<div class="row">

					<!-- News Block One -->
					<div class="col-lg-4 col-md-4 news-block-one" ng-repeat="items in getAlbums">
						<div class="inner-box wow fadeInUp" data-wow-delay="200ms">
							<!--<div class="category"><a href="#">Tips & Advice</a></div>-->
							<div class="image">
								<a href="<%=request.getContextPath() %>/gallery#/prettyPhoto%5B{{$index + 1}}%5D/0/">
								<img ng-show="items.getAlbumImageList[0].image" src="{{items.getAlbumImageList[0].image}}" alt="{{items.getAlbumImageList[0].imageTitle}}">
								<img ng-show="!items.getAlbumImageList[0].image" src="https://img.youtube.com/vi/{{items.getAlbumImageList[0].vidId}}/hqdefault.jpg" alt="{{items.getAlbumImageList[0].imageTitle}}">
								</a>
							</div>

							<div class="lower-content">
								<h4>
									<a href="#"> {{items.albumTitle}} </a>
								</h4>
							</div>

						</div>
					</div>

				</div>
				
				<div style="margin-top: 1em" class="row">
					<div class="col-md-12 text-center">
						<a style="background-color: #482917;" href="<%=request.getContextPath() %>/gallery"
							class="viewall-button"> View all </a>
					</div>
				</div>
	</section>




	<!--/footer START-->
	<%@include file="footer.jsp" %>
	<!--/footer END-->



	<!-- BS  JavaScript -->
	<script src="<%=request.getContextPath() %>/resources/front/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="<%=request.getContextPath() %>/resources/front/assets/js/wmBox.js"></script>
	<script src="<%=request.getContextPath() %>/resources/front/assets/js/info.js"></script>
	
	<!--  Scripts -->
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

<script>
function myFunction() {
var x = document.getElementById("myTopnav");
if (x.className === "topnav") {
x.className += " responsive";
} else {
x.className = "topnav";
}
}
</script>
</body>
</html>