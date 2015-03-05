

var admin = angular.module('pilaocommerce', [ 'ngSanitize' ]);

admin.controller('ClientController', [ '$scope','$http',
		function($scope,$http) {

	
	
			function init() {
				
				var clientDataJS = $('#clientdata').val();
				var clientData = JSON.parse(clientDataJS);
				
				$scope.productData = clientData.productData;
				$scope.clientData = clientData.user;
				$scope.amlabsData = clientData.user.amlabsData;

				if (!$scope.productData) {
					$scope.productData = {
						unitprice : "10.0",
						productid: "85",
						title: "Pilão CAFITESSE"
					}
				}

				 
				
				$scope.request = {
					quantity : $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					amlabsClientId : $scope.clientData.amlabs_id
				};
				
				var totalprice = $scope.productData.unitprice * $scope.request.quantity;
				
				$scope.request.totalproductprice = totalprice;
				
				$scope.$watch('request.quantity',function(newvalue,oldvalue){
					$scope.request.totalproductprice =$scope.productData.unitprice * $scope.request.quantity;
				});
				
				$scope.$watch('request.leadtype',function(newvalue,oldvalue){
					var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
					$scope.request.leadprice = leadPrice;
				});

			}
			
			init();

			$scope.getTotalPrice = function() {
				var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice; 
				
				return $scope.request.totalproductprice + $scope.request.leadprice;
			}

			$scope.newrequest = function(value) {
				var clientData = $scope.clientData;
				$scope.request = {
					quantity : $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					amlabsClientId : $scope.clientData.amlabs_id,
					leadprice:0
				};
				$scope.request.totalproductprice =$scope.productData.unitprice * $scope.request.quantity;
				var leadPrice = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
				$scope.request.leadprice = leadPrice;
				$scope.submitting = false;
				$scope.completed= false;
			}
			
			$scope.submit = function(){
				$scope.submitting = true;
				var serverPath = $('#serverpath').val();
				$scope.request.totalValue = $scope.getTotalPrice();
				$http.post(serverPath + "submitclient",$scope.request).success(function (data) {
					$scope.submitting = false;
					$scope.completed= true;
				});
			}

		} ]);