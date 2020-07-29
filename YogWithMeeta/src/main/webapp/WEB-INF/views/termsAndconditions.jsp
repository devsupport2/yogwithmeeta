<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">


<title> Terms and Conditions </title>

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
<h1>  Terms and Conditions </h1>
<span> Yog with Meeta    </span>
</div>
</div>
</div>
</div>




<!-- Projects  Details-->
<section class="core-projects sectpad">
<div style="border: 1px solid #dee2e6; border-radius: 6px;     padding: 10px 20px 20px 20px;" class="container clearfix">

<div class="pro-content clearfix">

<p style="margin-bottom: 15px"> Welcome to our website. If you continue to browse and use this website you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Meeta Shah relationship with you in relation to this website. </p>


<h4 style="margin-top: 20px"> The use of this website is subject to the following terms of use: </h4>

<ul class="scope-item">
<li>
<p align="justify">The content of the pages of this website is for your general information and use only. It is subject to change without notice.</p>
</li>
<li>
<p align="justify">Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</p>
</li>
<li>
<p align="justify">Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</p>
</li>
<li>
<p align="justify">This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</p>
</li>
<li>
<p align="justify">All trademarks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</p>
</li>
<li>
<p align="justify">Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offence.</p>
</li>
<li>
<p align="justify">From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</p>
</li>
<li>
<p align="justify">You may not create a link to this website from another website or document without Meeta Shah prior written consent.</p>
</li>
<li>
<p align="justify">Your use of this website and any dispute arising out of such use of the website is subject to the laws of India or other regulatory authority.</p>
</li>
</ul>

<p align="justify"> “We as a merchant shall be under no liability whatsoever in respect of any loss or damage arising directly or indirectly out of the decline of authorization for any Transaction, on Account of the Cardholder having exceeded the preset limit mutually agreed by us with our acquiring bank from time to time” </p>    

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