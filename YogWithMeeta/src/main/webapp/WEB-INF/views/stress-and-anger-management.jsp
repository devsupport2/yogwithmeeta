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


<title> Stress and Anger Management | Yog With Meeta </title>

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
<h1> Stress and Anger Management </h1>
<span> 
The most harmful force known to humanity is raw anger that causes physical, mental, emotional and social problems. But to be able to control, manage and conquer that anger, is winning the biggest battle of life.
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
<p>The most harmful force known to humanity is raw anger that causes physical, mental, emotional and social problems. But to be able to control, manage and conquer that anger, is winning the biggest battle of life. </p>
</blockquote>


<div class="sec-title">
<div class="text"> Anger is defined as ‘an intense emotional state involving a strong feeling of displeasure, annoyance, or hostility in response to the perceived provocation.’ This form of anger is healthy until you’re able to hit the delete button. However, it is ‘the most harmful force’ when it induces stress that causes high blood pressure, heart rate, increased breathing rate, and stress levels.  </div>
    
<div class="text"> The <strong>Anger and Stress management</strong>  at Yog with Meeta focuses on balancing the mind and body of a person. Imbalances in anger and stress cause ill-effects such as heart attack, stroke, decreased immunity, skin problems, insomnia, digestive problems, heart problems, anxiety, depression, migraines, and complications in pre-existing health conditions.  </div>

<div class="text"> Supressing your anger may not always help, rather to be able to control  </div>

</div>

</div>

<div class="col col-lg-6">
<div class="image-block">
<img class="img-responsive" src="<%=request.getContextPath()%>/resources/front/assets/images/stress-and-anger-management-img1.jpg" alt="">
</div>
</div>

</div>

<div class="row"> 
<div class="col-md-12">
<div class="sec-title">
<div class="text">  and calm yourself is highly recommended with the help of Yoga. Yoga undoubtedly helps in channelling your anger towards something constructive such as love and compassion, therefore reducing stress and finding peace. 
</div>



<blockquote class="testimonial">
<p> ‘The first drawback of anger is that it destroys your inner peace: the second is that it distorts your view of reality. If you think about this and come to understand that anger is really unhelpful, that it is only destructive,  then you can begin to distance yourself from anger’ ~ Dalai Lama </p>
</blockquote>
    
<div class="text"> 
Yogic therapies to manage anger and stress have passed the test of time with the mind-body-energy concepts. Various asanas, pranayama and meditation work as a toolkit to free up obstructions on physical, mental or energetic levels. “Asanas allow you to move the energy” suggests Stephen Cope who believes Yoga is the best antidote for anger and stress.
</div>

<div class="text"> 
One of the techniques for coping with anger is mindfulness – a state where one is more aware and paying attention to thoughts, feelings, and behaviours of themselves and others around them. At Yog with Meeta, we believe anger and compassion to be two sides of a coin. Hence, we use the practice of mindfulness to channelize and draw the energy caused by anger, also known as anger triggers and impulses, and turn it into love and compassion in order to control the regular outburst. This particularly helps one in the long run as one learns to practice empathy more often than being angry in the smallest of situations.
</div>



<blockquote class="testimonial">
<p> “For every minute you are angry, you lose 60 seconds of happiness.” ~ Ralph Waldo Emerson </p>
</blockquote>

<div class="text"> 
Regular practice of Yoga intertwined with the practice of mindfulness reduces cortisol levels induced by stress caused by work, relationships, and anger, while restoring harmony in your mind-body balances. 
</div>

<blockquote class="testimonial">
<p> Cope with anger and stress related issues with the original mind-body medicine of Yoga. Join our online workshops today! </p>
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