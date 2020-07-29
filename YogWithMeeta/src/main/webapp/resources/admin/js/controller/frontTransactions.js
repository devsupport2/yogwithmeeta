app.controller('transCtrl', ['$scope', '$filter', '$http', '$window', '$location', '$timeout' ,
	function ($scope, $filter, $http, $window, $location, $timeout) {
	var baseUrl = $location.protocol()+"://"+location.host+url;
	
	$scope.currentPage = 0;
	$scope.pageSize = 10;
	$scope.search = '';
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500];
	
	var link = baseUrl+'getAllCounts';
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCounts = data;
	}).error(function(data, status, headers, config) {
		$scope.getAllCounts = "Response Fail";
	});
	
	
	$scope.getTransactionsForUser = function(userId){
		$scope.userId = userId;
		var link = baseUrl+'getTransactionsByPageForUser?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex+'&userID='+userId;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getTransactionList = data;
		}).error(function(data, status, headers, config) {
			$scope.getTransactionList = "Response Fail";
		});
	}
	
	
	
	$scope.paymenStat = function(){
		var link = baseUrl+'getTransactionsByPageForUser?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex+'&userID='+$scope.userId;
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
	
	$scope.changepage = function(){
		var link = baseUrl+'getTransactionsByPageForUser?pagesize='+$scope.pageSize+'&startindex='+$scope.startindex+'&userID='+$scope.userId;    
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getTransactionList = data;
		}).error(function(data, status, headers, config) {
			$scope.getTransactionList = "Response Fail";
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
