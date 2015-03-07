var admin = angular.module('pilaocommerce', [ 'ngSanitize' ]);

admin.controller('ClientController', [ '$scope','$http',
		function($scope,$http) {

	
	
			function init() {
				
				var clientDataJS = $('#clientdata').val();
				var clientData = JSON.parse(clientDataJS);
				
				var amlabsData = JSON.parse($('#amlabsdata').val());
				
				$scope.productData = clientData.productData;
				$scope.clientData = clientData.user;
				$scope.amlabsdata = amlabsData.customer;

				if (!$scope.productData) {
					$scope.productData = {
						unitprice : $scope.amlabsdata.coffeebagprice,
						productid: "85",
						title: "Pilão CAFITESSE"
					}
				}

				 
				
				$scope.request = {
					supplyamount : $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					customerid : $scope.amlabsdata.CUSTOMERID,
				};
				
				var totalprice = $scope.productData.unitprice * $scope.request.supplyamount;
				
				$scope.request.shippingvalue = totalprice;
				
				$scope.active = $scope.amlabsdata.status == "Ativo";
				
				$scope.$watch('request.supplyamount',function(newvalue,oldvalue){
					$scope.request.shippingvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				});
				
				$scope.$watch('request.leadtype',function(newvalue,oldvalue){
					var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
					$scope.request.leadprice = leadPrice;
				});

			}
			
			init();

			$scope.getTotalPrice = function() {
				var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice; 
				
				return $scope.request.shippingvalue + $scope.request.leadprice;
			}

			$scope.newrequest = function(value) {
				var clientData = $scope.clientData;
				$scope.request = {
					supplyamount: $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					customerid : $scope.amlabsdata.CUSTOMERID,
					leadprice:0
				};
				$scope.request.shippingvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
				$scope.request.leadprice = leadPrice;
				$scope.submitting = false;
				$scope.completed= false;
				$scope.error=false;
			}
			
			$scope.submit = function(){
				$scope.submitting = true;
				var serverPath = $('#serverpath').val();
				$scope.request.comments = $scope.clientData.remarks;
				$http.post(serverPath + "submitclient",$scope.request).success(function (data) {
					$scope.submitting = false;
					if (data.success){
						$scope.completed= true;	
					}else{
						$scope.error=true;
						$scope.errormessage = data.error[0];
					}
				}).error(function (data){
					$scope.submitting = false;
					$scope.error=true;
				});
			}

		} ]);