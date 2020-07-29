<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


<title>Gallery | Yog With Meeta</title>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/front/assets/images/favicon.ico">

<!-- BS CSS -->
<link
	href="<%=request.getContextPath()%>/resources/front/vendor/bootstrap/css/bootstrap.min.css"
rel="stylesheet">

<!--<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/front/assets/css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/frontGallery.js"></script>

</head>

<body ng-app="ywm" ng-controller="galleryCtrl">

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
				<h1>Gallery</h1>
			</div>
		</div>
	</div>
</div>
<br>
			<div class="container">
				<div class="row gallery clearfix">
					<c:forEach items="${albumOneImage}" var="albumOneImage" varStatus="status">
					<!-- News Block One -->
					<div class="col-lg-4 col-md-4 news-block-one">
						<div class="inner-box wow fadeInUp" data-wow-delay="200ms">
							<!--<div class="category"><a href="#">Tips & Advice</a></div>-->
					<div class="image">
							<c:if test="${empty albumOneImage.vidId}">
							<a class="preview" href="${albumOneImage.image}" title="${albumOneImage.imageTitle}" rel="prettyPhoto[${status.index+1}]">
								<img class="img-responsive" src="${albumOneImage.image}" alt="">
							</a>
							</c:if>
							<c:if test="${empty albumOneImage.image}">
							<a class="preview" href="http://youtu.be/${albumOneImage.vidId}?rel=0" title="${albumOneImage.imageTitle}" rel="prettyPhoto[${status.index+1}]">
								<img class="img-responsive" src="https://img.youtube.com/vi/${albumOneImage.vidId}/hqdefault.jpg" alt="">
							</a>
							</c:if>
							<div style="display:none;">
							<c:forEach items="${albumImages}" var="albumImages" varStatus="status1">
								<c:if test="${albumImages.albumId == albumOneImage.albumId && albumImages.albumImageId != albumOneImage.albumImageId}">
									<c:catch var="exception">${albumImages.vidId}</c:catch>
									<c:if test="${empty albumImages.vidId}">
									<a href="${albumImages.image}" rel="prettyPhoto[${status.index+1}]" title="${albumImages.imageTitle}"></a>
					                </c:if>
					                <c:catch var="exception">${albumImages.image}</c:catch>
									<c:if test="${empty albumImages.image}">
									<a href="http://youtu.be/${albumImages.vidId}?rel=0" rel="prettyPhoto[${status.index+1}]" title="${albumImages.imageTitle}"></a>
									</c:if>		
								</c:if>	
							</c:forEach>
							</div>
					</div>
					
					<div class="lower-content">
						<h4>
							<a href="#"> ${albumOneImage.albumTitle} </a>
						</h4>
					</div> 
					
						</div>
					</div>
					</c:forEach>
				</div>
				<div ng-show="!getAlbums" style="margin-top: 1em" class="row">
					<div class="col-md-12 text-center">
						<a  href="#" class="viewall-button"> no data found </a>
					</div>
				</div>


	</div>
</section>




<!--/footer START-->
<%@include file="footer.jsp"%>
<!--/footer END-->






<!-- Bootstrap core JavaScript -->
<%-- <script
src="<%=request.getContextPath() %>/resources/front/vendor/jquery/jquery.min.js"></script> --%> 
		
<script src="<%=request.getContextPath() %>/resources/front/assets/js/prettyphoto-jquery.min.js"></script> 
<script
	src="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Additional Scripts -->
<script src="<%=request.getContextPath() %>/resources/front/assets/js/custom.js"></script>
<script src="<%=request.getContextPath() %>/resources/front/assets/js/owl.js"></script>
<script src="<%=request.getContextPath() %>/resources/front/assets/js/slick.js"></script>
<script src="<%=request.getContextPath() %>/resources/front/assets/js/accordions.js"></script>

<script src="<%=request.getContextPath() %>/resources/front/assets/js/prettyphoto.jquery.js"></script>





<!-- Pretty Photo Light box Scrept start-->			
<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
$("area[rel^='prettyPhoto']").prettyPhoto();

$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: false});
$(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});

$("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
changepicturecallback: function(){ initialize(); }
});

$("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
changepicturecallback: function(){ _bsap.exec(); }
});
});
</script>
<!-- Pretty Photo Light box Scrept End-->	



</body>
</html>