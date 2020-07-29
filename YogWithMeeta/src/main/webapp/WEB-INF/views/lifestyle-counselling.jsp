<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">


<title> Lifestyle Counselling | Yog With Meeta </title>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/front/assets/images/favicon.ico">

<!-- BS CSS -->
<link href="<%=request.getContextPath()%>/resources/front/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--<link rel="stylesheet" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">-->

<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/front/assets/images/favicon.ico">

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/front/assets/font-awesome-4.7.0/css/font-awesome.min.css">

<!--  CSS  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/front/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/front/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/front/assets/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/front/assets/css/owl.css">


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
<h1> Lifestyle Counselling </h1>
<span> 
Practicing Yoga under guidance and counselling helps you heal and take you towards your goal and embrace a better life.
</span>
</div>
</div>
</div>
</div>





<!-- Why Choose Us Section -->
<section class="whychoose-us-section">
<div class="container">
<div class="row">

<div class="col col-lg-6">

<blockquote class="testimonial">
<p> Practicing Yoga under guidance and counselling helps you heal and take you towards your goal and embrace a better life. </p>
</blockquote>


<blockquote class="testimonial">
<p> “I follow a regular diet”, “You should regularly exercise – go to the gym”, “If you want a better lifestyle, you should start eating your greens and stop all the cheese!”  </p>
</blockquote>


<div class="sec-title">
<div class="text"> All of the above sentences lead to nowhere but self-doubt and hard-work gone to waste. All our lifestyles are always under the making – no matter how many days you fast or how many calories you burn. A healthy lifestyle is looking deeper into the self to attain the ideal way of life.  </div>


    
<div class="text"> A healthy lifestyle is inclusive of nutrition, exercise, mental and physical health. At Yog with Meeta, we intertwine the beauty of counselling, that is, psychotherapy, and Yoga therapy to guide individualistic needs, goals and lifestyle of the seeker and help him/her lead a better life.   </div>

</div>

</div>

<div class="col col-lg-6">
<div class="image-block">
<img class="img-responsive" src="<%=request.getContextPath()%>/resources/front/assets/images/Lifestyle-Counselling-img1.jpg" alt="">
</div>
</div>

</div>

<div class="row"> 
<div class="col-md-12">
<div class="sec-title">


<div class="text">  Counselling is a therapeutic discipline that deals with identifying problematic thoughts or behaviour pattern to improve emotional balance. It aids in developing new skills, processing difficult emotions and finding and healing the root cause of problems such as depression, anxiety, addictions, emotional dependency, anger, trauma, PTSD, chronic stress, etc.   </div>
<div class="text">  Counselling weaved with the teachings of Yoga therapy is a sustainable means of bettering at life. The concepts, principles and techniques of Yoga are modified from person to person that brings out its therapeutic effect an individual is seeking. From physical injuries to health concerns and conditions, Yoga therapy restores greater health throughout the course of an individual’s <strong>Lifestyle Counselling</strong>.     </div>
<div class="text"> While group sessions of Yoga guide you through different asanas, stretching, breathing, and techniques to improve your overall posture, strength that relax and reenergize you, lifestyle counselling adheres to applying the science of Yoga and psychotherapy on an individual basis. This aids in improving the seeker’s medical conditions and supports the healing process of the aatma, or the inner self.  </div>
<div class="text">  With no side effects, Yoga therapy and lifestyle counselling can be done at any stage of life. Hence, it holds importance for children, adults and senior citizens as it provides the knowledge required to live a balanced lifestyle.   </div>



<blockquote class="testimonial">
<p>At Yog with Meeta, lifestyle counselling is more than asking for psychiatric help. Lifestyle Counselling with us is an integrated experience of the mind, body and breath.  </p>
</blockquote>


    
    
</div>
</div>
</div>

</div>
</section>


<!--/footer START-->
<%@include file="footer.jsp" %> 
<!--/footer END-->




<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/front/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Additional Scripts -->
<script src="<%=request.getContextPath()%>/resources/front/assets/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/assets/js/owl.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/assets/js/slick.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/assets/js/accordions.js"></script>

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