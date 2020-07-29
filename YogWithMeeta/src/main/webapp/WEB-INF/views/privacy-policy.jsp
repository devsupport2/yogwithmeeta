<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">


<title> Privacy Policy </title>

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
<h1>  Privacy Policy  </h1>
<span> Yog with Meeta    </span>
</div>
</div>
</div>
</div>




<!-- Projects  Details-->
<section class="core-projects sectpad">
<div style="border: 1px solid #dee2e6; border-radius: 6px;     padding: 10px 20px 20px 20px;" class="container clearfix">

<div class="pro-content clearfix">

<h4 style="margin-top: 20px"> Website Privacy </h4>
<p align="justify"> This privacy policy sets out how Meeta Shah uses and protects any information that you give Meeta  when you use this website. Meeta Shah is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, and then you can be assured that it will only be used in accordance with this privacy statement. Meeta Shah may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes. This policy is effective from 1st August 2016.

 </p>


<h4 style="margin-top: 20px">What We May Collect </h4>
<p align="justify"> We may collect the following information: </p>

<ul class="scope-item">
<li>
<p align="justify">name and job title</p>
</li>
<li>
<p align="justify">contact information including email address</p>
</li>
<li>
<p align="justify">demographic information such as postcode, preferences and interests</p>
</li>
<li>
<p align="justify">other information relevant to customer surveys and/or offer</p>
</li>
<li>
<p align="justify">PAN no. for the purpose of donor identification</p>
</li>

</ul>





<h4 style="margin-top: 20px"> What We do with the Information we Gather </h4>
<p align="justify"> We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:

 </p>

<ul class="scope-item">
<li>
<p align="justify">Internal record keeping.</p>
</li>
<li>
<p align="justify">We may use the information to improve our products and services.</p>
</li>
<li>
<p align="justify">We may periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided.</p>
</li>
<li>
<p align="justify">From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.</p>
</li>
</ul>


<h4 style="margin-top: 20px"> Security </h4>
<p align="justify"> We are committed to ensuring that your information is secure. In order to prevent unauthorized access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.

 </p>



<h4 style="margin-top: 20px"> Contacting Us </h4>
<p align="justify"> If there are any questions regarding this privacy policy you may contact us using the information below: </p>

<p align="justify"> Company Name:  </p>
<p align="justify"> Address:   </p>
<p align="justify"> Telephone No.:  </p>
<p align="justify"> E-Mail ID:   </p>

</div>


</div>
</section>
<!-- Indurial Solution-->

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