app.controller('transCtrl', ['$scope', '$filter', '$http', '$window', '$location', '$timeout' ,
	function ($scope, $filter, $http, $window, $location, $timeout) {
	var baseUrl = $location.protocol()+"://"+location.host+url;
	
	$scope.currentPage = 0;
	$scope.pageSize = 10;
	$scope.search = '';
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500];
	$scope.paymentstatusfilter = "";
	
	var link = baseUrl+'getAllCounts';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCounts = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCounts = "Response Fail";
	});
	
	var link = baseUrl+'getTransactionsByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getTransactionList = data;
	}).error(function(data, status, headers, config) {
		$scope.getTransactionList = "Response Fail";
	});
	
	var link = baseUrl+'getAllCourseName';    
	$http.get(link).success(function(data, status, headers, config) {
		$scope.allCourses = data;
	}).error(function(data, status, headers, config) {
		$scope.allCourses = "Response Fail";
	});
	
	
	$scope.filterByDate = function(){
		$scope.fromdate = document.getElementById("datepicker").value;
		$scope.todate = document.getElementById("datepicker1").value;
		if($scope.todate == "day/month/year")
		{
			$scope.toDateError = 1;
			$scope.toDateMsg = "Also Select To Date";
		}else if($scope.fromdate == "day/month/year")
		{
			$scope.fromDateError = 1;
			$scope.fromDateMsg = "Also Select From Date";
		}else{
			$scope.toDateError = 0;
			$scope.fromDateError = 0;
			/*link = baseUrl+'getAllTransactionsByDateAndPage?fromdate='+$scope.fromdate+'&todate='+$scope.todate+'&pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getTransactionList = data;
			}).error(function(data, status, headers, config) {
				$scope.getTransactionList = "Response Fail";
			});*/
			$scope.paymenStat();
		}
	}
	
	$scope.changepage = function(){
		var link = baseUrl+'getTransactionsByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getTransactionList = data;
		}).error(function(data, status, headers, config) {
			$scope.getTransactionList = "Response Fail";
		});
	}
	
	
	$scope.paymenStat = function(){
		$scope.fromdate = document.getElementById("datepicker").value;
		$scope.todate = document.getElementById("datepicker1").value;
		if($scope.todate == "day/month/year" || $scope.fromdate == "day/month/year")
		{
			var link = baseUrl+'getTransactionsByPage?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;
		} else{
			var link = baseUrl+'getAllTransactionsByDateAndPage?fromdate='+$scope.fromdate+'&todate='+$scope.todate+'&pagesize='+$scope.pageSize+'&startindex='+$scope.startindex;
		}
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getOrders = data;
			var i;
			if($scope.paymentstatusfilter == "Paid"){
				$scope.getOrdersf = [];
				for(i=0;i<$scope.getOrders.length;i++){
					if($scope.getOrders[i].paymentStatus == "Paid" || $scope.getOrders[i].paymentStatus == "Success"){
						$scope.getOrdersf.push($scope.getOrders[i]);
					}
				}
			}else if($scope.paymentstatusfilter == "Unpaid"){
				$scope.getOrdersf = [];
				for(i=0;i<$scope.getOrders.length;i++){
					if($scope.getOrders[i].paymentStatus == "Unpaid"){
						$scope.getOrdersf.push($scope.getOrders[i]);
					}
				}
			}else if($scope.paymentstatusfilter == ""){
				$scope.getOrdersf = $scope.getOrders;
			}
			else{
				$scope.getOrdersf = [];
				for(i=0;i<$scope.getOrders.length;i++){
					if($scope.paymentstatusfilter == $scope.getOrders[i].paymentStatus){
						$scope.getOrdersf.push($scope.getOrders[i]);
					}
				}
			}$scope.getTransactionList = $scope.getOrdersf;
		}).error(function(data, status, headers, config) {
			$scope.getOrders = "Response Fail";
		});
	}
	
	
	$scope.getTransactionDetailByorderNumber = function(orderNumber)
	{
		var link = baseUrl+'getOrderDetailByOrderNumber?ordernumber='+orderNumber;
		$http.get(link).success(function(data, status, headers, config){
			$scope.orderdetail = data;	
			
			$scope.orderid = $scope.orderdetail.orderId;
			$scope.ordernumber =  $scope.orderdetail.orderNumber;
			
			$scope.customerName = $scope.orderdetail.userfirstName+" "+$scope.orderdetail.userlastName;
			
			$scope.customername = $scope.customerName;
			$scope.emailid =  $scope.orderdetail.userEmail;
			$scope.mobileno =  $scope.orderdetail.userMobile;
			
			$scope.Cource =  $scope.orderdetail.courceTitle;
			
			$scope.total =  $scope.orderdetail.amountPaid;
			$scope.orderstatus =  $scope.orderdetail.orderStatus;
			$scope.paymentstatus= $scope.orderdetail.paymentStatus;
			$scope.trackingid =  $scope.orderdetail.trackingId;
			$scope.bankrefno =  $scope.orderdetail.bankReferenceNumber;
			$scope.failuremsg = $scope.orderdetail.failureMessage;
			$scope.paymentmode =  $scope.orderdetail.paymentMode;
			$scope.cardname =  $scope.orderdetail.cardName;
			$scope.bankname =  $scope.orderdetail.bankName;
			$scope.orderdate =  $scope.orderdetail.orderDate;
			$scope.pymntst = $scope.orderdetail.paymentStatus;
		}).error(function(data, status, headers, config){
			$scope.orderdetail = "Response Fail";
		});
	}
	
}]);
