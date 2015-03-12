var admin = angular.module('pilaocommerce', [ 'ngSanitize' ]);

admin.controller('ClientController', [ '$scope','$http','alertService',
		function($scope,$http,alertService) {

	
	
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
					customerid : $scope.amlabsdata.customerid,
				};
				
				
				$scope.request.productvalue = $scope.productData.unitprice * $scope.request.supplyamount;;
				
				$scope.active = $scope.amlabsdata.status == "Ativo";
				
				$scope.$watch('request.supplyamount',function(newvalue,oldvalue){
					$scope.request.productvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				});
				
				$scope.$watch('request.leadtype',function(newvalue,oldvalue){
					var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
					$scope.request.shippingvalue = shippingvalue;
				});

			}
			
			init();

			$scope.getTotalPrice = function() {
				var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice; 
				return $scope.request.productvalue + $scope.request.shippingvalue;
			}

			$scope.newrequest = function(value) {
				var clientData = $scope.clientData;
				$scope.request = {
					supplyamount: $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					customerid : $scope.amlabsdata.customerid,
					shippingvalue:0
				};
				$scope.request.productvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
				$scope.request.shippingvalue = shippingvalue;
				$scope.submitting = false;
				$scope.completed= false;
				$scope.error=false;
			}
			
			$scope.buildShippingDate = function(){
				var daysToAdvance = $scope.request.leadtype == "express" ? $scope.clientData.expressLeadTime : $scope.clientData.normalLeadTime;
				var start = new Date();
				start.setHours(0,0,0,0);
				var futureDate = addDays(start,daysToAdvance);
				return futureDate.getTime();
			}
			
			$scope.submit = function(){
				alertService.confirm("Deseja confirmar e enviar o pedido à Pilão Professional?", function(){
					$scope.submitting = true;
					var serverPath = $('#serverpath').val();
					$scope.request.comments = $scope.clientData.remarks;
					$scope.request.shippingdate = $scope.buildShippingDate(); 
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
	
				});
				
							}

		} ]);