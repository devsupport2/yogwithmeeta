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


<title>My Transactions | Yog With Meeta</title>

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
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/frontTransactions.js"></script>

</head>

<body ng-app="ywm" ng-controller="transCtrl" ng-init="getTransactionsForUser(<%= session.getAttribute("userid") %>)">

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
					<h1>My Transactions</h1>
				</div>
			</div>
		</div>
	</div>




	<!-- Causes Section -->
	<section style="padding: 90px 0 90px;" class="causes-section">
		<div class="container">

			

				<div class="row">
					
					<div class="col-md-8"></div>
					<div class="col-md-3" style="margin-top:15px; width:11.5em;">
						<div class="form-group">
							<select id="paymentstatusfilter" name="paymentstatusfilter" ng-model="paymentstatusfilter" ng-change="paymenStat()" class="form-control">
								<option value="">All Transactions</option>
								<option value="Aborted">Aborted</option>
								<option value="Failure">Failure</option>
								<option value="Paid">Paid</option>
								<option value="Free Event">Free Event</option>
								<option value="Pending">Pending</option>
								<option value="Unpaid">Unpaid</option>
							</select>											
						</div>
					</div>
					<div class="col-md-1" align="right" style="margin-top:15px;float: right;">
						<div class="form-group">
							<select id="pageSize" name="pageSize" ng-model="pageSize" ng-options="item for item in pages" class="form-control" ng-change="changepage()"></select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable"
								width="100%" cellspacing="0">

								<thead>
									<tr>
										<th>Transaction Number</th>
										<th>Transaction Date</th>
										<th>User Name</th>
										<th>Course Name</th>
										<th>Amount</th>
										<th>Transaction Status</th>
									</tr>
								</thead>


								<tbody>



									<tr ng-repeat="item in getTransactionList">

										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)"><a data-toggle="modal" data-target="#EditEventMemberPayment" href="#" > {{item.orderNumber}} </a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)"><a data-toggle="modal" data-target="#EditEventMemberPayment" href="#" > {{item.orderDate}} </a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)"><a data-toggle="modal" data-target="#EditEventMemberPayment" href="#" > {{item.userfirstName}} {{item.userlastName}}</a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)"><a data-toggle="modal" data-target="#EditEventMemberPayment" href="#" > {{item.courceTitle}} </a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)"><a data-toggle="modal" data-target="#EditEventMemberPayment" href="#" > {{item.amountPaid}} </a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)" ng-if="item.orderStatus == 'Incomplete' || item.paymentStatus == 'Unpaid'"><a style="color:red;"data-toggle="modal" data-target="#EditBatchModal" href="#" > Failed </a></td>
										<td ng-click="getTransactionDetailByorderNumber(item.orderNumber)" ng-if="item.orderStatus != 'Incomplete' || item.paymentStatus != 'Unpaid'"><a data-toggle="modal" data-target="#EditBatchModal" href="#" > {{item.paymentStatus}} </a></td>
									</tr>


								</tbody>

							</table>
						</div>
					</div>
				
				
			</div>
			<div class="row">

					<div class="col-sm-12 col-md-5">
						<div class="hint-text">Showing <b>{{startindex+1}}-{{getActivityList.length+startindex}}</b> out of <b>{{getAllCounts.transactionCount}}</b> entries</div>
					</div>

					<div class="col-sm-12 col-md-7 text-right">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate">
							<ul class="pagination pull-right">
								<li class="paginate_button page-item previous disabled"
									id="dataTable_previous"><a href="#"
									aria-controls="dataTable" data-dt-idx="0" tabindex="0"
									class="page-link">Previous</a></li>
								<li class="paginate_button page-item active"><a
									href="#" aria-controls="dataTable" data-dt-idx="1"
									tabindex="0" class="page-link">{{currentPage+1}}</a></li>
								<li class="paginate_button page-item next"
									id="dataTable_next"><a href="#"
									aria-controls="dataTable" data-dt-idx="7" tabindex="0"
									class="page-link">Next</a></li>
							</ul>
						</div>
					</div>

				</div>


		</div>
	</section>




	<!--/footer START-->
	<%@include file="footer.jsp"%>
	<!--/footer END-->



<div class="container">
			<div class="modal fade" id="EditEventMemberPayment" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Payment Details</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">							
							<form role="form">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Order Number</label>
											<input type="text" id="ordernumber" name="ordernumber" ng-model="ordernumber" title="{{ordernumber}}" placeholder="Order Number" class="form-control" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Name</label>
											<input type="text" id="customername" name="customername" ng-model="customername" title="{{customername}}" placeholder="Company Name" class="form-control" disabled>											
										</div>
										<p ng-show="errorCompany == 1" style="color: red; font-size: 14px;">{{msgCompany}}</p>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Email</label>
											<input type="email" id="emailid" name="emailid" ng-model="emailid" title="{{emailid}}" placeholder="Email" class="form-control" disabled>
										</div>									
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Mobile Number<font color="red" size="3">*</font></label>
											<input type="text" id="mobileno" name="mobileno" ng-model="mobileno" title="{{mobileno}}" placeholder="Mobile Number" class="form-control" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Cource</label>
											<input type="text" id="Cource" name="Cource" ng-model="Cource" title="{{Cource}}" placeholder="Course" class="form-control" disabled>											
										</div>
									</div>
								 	<div class="col-md-4">
										<div class="form-group">
											<label>Order Date</label>
											<input type="text" id="orderdate" name="orderdate" ng-model="orderdate" title="{{orderdate}}" placeholder="Order Date" class="form-control" disabled>											
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Amount</label>
											<input type="text" class="form-control" id="total" name="total" ng-model="total" title="{{total}}" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Order Status</label>
											<input type="text" class="form-control" id="orderstatus" name="orderstatus" ng-model="orderstatus" title="{{orderstatus}}" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Payment Status </label>
											<input type="text" class="form-control" id="paymentstatus" name="paymentstatus" ng-model="paymentstatus" title="{{paymentstatus}}" disabled>
										</div>
									</div>						
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Tracking ID</label>
											<input type="text" class="form-control" id="trackingid" name="trackingid" ng-model="trackingid" title="{{trackingid}}" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Bank Ref No.</label>
											<input type="text" class="form-control" id="bankrefno" name="bankrefno" ng-model="bankrefno" title="{{bankrefno}}" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Failure message</label>
											<input type="text" class="form-control" id="failuremsg" name="failuremsg" ng-model="failuremsg" title="{{failuremsg}}" disabled>
										</div>
									</div>								
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Payment Mode</label>
											<input type="text" class="form-control" id="paymentmode" name="paymentmode" ng-model="paymentmode" title="{{paymentmode}}" disabled>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Card Name</label>
											<input type="text" class="form-control" id="cardname" name="cardname" ng-model="cardname" title="{{cardname}}" disabled>
										</div>
									</div>	
									<div class="col-md-4">
										<div class="form-group">
											<label>Bank Name</label>
											<input type="text" class="form-control" id="bankname" name="bankname" ng-model="bankname" title="{{bankname}}" disabled>
										</div>
									</div>
								</div>														
							</form>						
						</div>
						<div class="modal-footer">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<button type="button" style="width:100%;" class="btn btn-success" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


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