<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">


<title> Contact Us </title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/front/assets/images/favicon.ico">

<!-- BS CSS -->
<link href="<%=request.getContextPath() %>/resources/front/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">-->

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/front/assets/images/favicon.ico">

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/font-awesome-4.7.0/css/font-awesome.min.css">

<!--  CSS  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/owl.css">


</head>

<body>

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
<h1> Contact Us </h1>
<span> FEEL FREE TO SEND US A MESSAGE NOW! </span>
</div>
</div>
</div>
</div>


<!-- Contact Form -->
<section class="contact-form-section">
<div class="container">
<div class="row">
<div class="col-lg-8">
<div class="default-form-area">

<form id="contact-form" name="contact_form" class="contact-form" action="http://steelthemes.com/demo/html/Goodsoul_html/inc/sendmail.php" method="post">
<div class="row clearfix">
<div class="col-lg-6 col-md-6 column">        
<div class="form-group">
<input type="text" name="form_name" class="form-control" value="" placeholder="Name" required="">
</div>
</div>
<div class="col-lg-6 col-md-6 column">
<div class="form-group">
<input type="email" name="form_email" class="form-control required email" value="" placeholder="Email" required="">
</div>
</div>
<div class="col-lg-6 col-md-6 column">        
<div class="form-group">
<input type="text" name="form_phone" class="form-control" value="" placeholder="Phone" required="">
</div>
</div>
<div class="col-lg-6 col-md-6 column">        
<div class="form-group">
<input type="text" name="form_subject" class="form-control" value="" placeholder="Subject" required="">
</div>
</div>
<div class="col-lg-12 col-md-12 column">
<div class="form-group">
<textarea name="form_message" class="form-control textarea required" placeholder="Message...."></textarea>
</div>
<div class="form-group flex-box">
<div class="submit-btn">
<input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="">
<button class="theme-btn btn-style-one" type="submit" data-loading-text="Please wait..."><span>Send Message</span></button>
</div>
</div>
</div>                                            
</div>
</form>
</div>
</div>

<div class="col-lg-4">
<div class="contact-info-three">
<div class="single-info">
<h4> Yog with Meeta </h4>
<div class="text"> 15 Lorem Ipsum is simply dummy text Vadodara, Gujrat  </div>                         
</div>

<div class="single-info">
<h4> Quick Contact </h4>
<div class="wrapper-box">
<a style="line-height: 42px;" href="mailto:#"><i class="fa fa-phone" aria-hidden="true"></i> info@yogwithmeeta.com </a> <br>
<a href="tel:#"><i class="fa fa-envelope-o" aria-hidden="true"></i> +211 456 789 & 123</a>
</div>

</div>

</div>
</div>

</div>                    
</div>
</section>


<div id="map">

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d236213.5020536378!2d73.03300029303715!3d22.32204248029837!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395fc8ab91a3ddab%3A0xac39d3bfe1473fb8!2sVadodara%2C%20Gujarat!5e0!3m2!1sen!2sin!4v1589979695172!5m2!1sen!2sin" width="100%" height="500px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
</div>


    
    
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

<script language = "text/Javascript"> 
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