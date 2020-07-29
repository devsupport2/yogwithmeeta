

<header class="">


<!-- Header 25/06/2020 -->
<div class="sub-header">
<div class="container">
<div class="row">

<div class="col-md-8 col-xs-12 hidden-xs hidden-sm"></div>

<div class="col-md-4">
<ul class="right-icons">
<%if(session.getAttribute("userid") == null)
{%> 
<li style="width: 95px; background-color: white;"><a href="<%=request.getContextPath() %>/register"> Register </a></li>
<!--<li><a href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a></li>-->
 <%} else {%>
 <li style="width: 150px; background-color: white;"><a href="<%=request.getContextPath() %>/myProfile"><%=session.getAttribute("username") %></a></li>
 <%}%>
<li style="border-right: none;" class="nav-item dropdown">
<a style="color: #FF8000; background-color: white;" class="nav-link dropdown-toggle" href="#" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<span class="flag-icon flag-icon-us"> </span> 
<i class="fa fa-user-circle-o" aria-hidden="true"></i> 
</a>
<div  class="dropdown-menu" aria-labelledby="dropdown09">

<%if(session.getAttribute("userid") != null)
{%>  
<a class="dropdown-item" href="<%=request.getContextPath() %>/myTransactions"><span class="flag-icon flag-icon-ar"></span>  My Transactions </a>
<a class="dropdown-item" href="<%=request.getContextPath() %>/myProfile"><span class="flag-icon flag-icon-ar"></span>  My Profile </a>
<a class="dropdown-item" href="<%=request.getContextPath() %>/logout"><span class="flag-icon flag-icon-ar"> </span>  Logout </a>
<%}
else
{%>
<a class="dropdown-item" href="<%=request.getContextPath() %>/login"><span class="flag-icon flag-icon-ar"> </span>  Login </a> 
<%}%>    
</div>
</li>

</ul>
</div>

</div>
</div>
</div>

<nav class="navbar navbar-expand-lg">
<div class="container-fluid">

<!--<a class="navbar-brand" href="index.html"><h2>Finance Business</h2></a>-->
<a class="navbar-brand" href="<%=request.getContextPath() %>/">
<img src="<%=request.getContextPath() %>/resources/front/assets/images/logo.png"/>
</a>

<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">

<!--<li class="nav-item active">
<a class="nav-link" href="index.html">Home
<span class="sr-only">(current)</span>
</a>
</li>-->

<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/yoga-therapy"> Yoga Therapy </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/weight-management"> Weight Management </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/meditation"> Meditation </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/sound-healing"> Sound Healing </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/corporate-yoga"> Corporate Yoga </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/stress-and-anger-management"> Stress & Anger Management </a></li>
<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/lifestyle-counselling"> Lifestyle Counselling </a></li>
<!--<li class="nav-item"><a class="nav-link" href="#"> Law of Attraction </a></li>-->
<li class="nav-item"><a class="nav-link" href="#"> Teachers Training </a></li>

</ul>


<ul id="navbar-right" class="nav navbar-nav navbar-right">
<%if(session.getAttribute("userid") == null)
{%>  
<li class="nav-item"><a class="nav-link " href="<%=request.getContextPath() %>/register"> Register </a></li>
<%}%>
<li style="    border-right: none;" class="nav-item dropdown">
<a style="color: #FF8000" class="nav-link dropdown-toggle" href="#" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="flag-icon flag-icon-us"> </span> <i class="fa fa-user-circle-o" aria-hidden="true"></i> </a>
<div style="    left: -90px; top: 40px;" class="dropdown-menu" aria-labelledby="dropdown09">
 
<%if(session.getAttribute("userid") != null)
{%>  
<a class="dropdown-item" href="<%=request.getContextPath() %>/myTransactions"><span class="flag-icon flag-icon-ar"></span>  My Transactions </a>
<a class="dropdown-item" href="<%=request.getContextPath() %>/myProfile"><span class="flag-icon flag-icon-ar"></span>  My Profile </a>
<a class="dropdown-item" href="<%=request.getContextPath() %>/logout"><span class="flag-icon flag-icon-ar"> </span>  Logout </a>
<%}
else
{%>
<a class="dropdown-item" href="<%=request.getContextPath() %>/login"><span class="flag-icon flag-icon-ar"> </span>  Login </a> 
<%}%>
</div>
</li>

</ul>




</div>
</div>
</nav>
</header>
