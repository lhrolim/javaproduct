

var admin = angular.module('pilaocommerce', [ 'ngSanitize' ]);

admin.controller('ClientController', [ '$scope','$http',
		function($scope,$http) {

	
	
			function init() {
				
				var clientDataJS = $('#clientdata').val();
				var clientData = JSON.parse(clientDataJS);
				$scope.productData = clientData.productData;
				$scope.clientData = clientData.user;

				if (!$scope.productData) {
					$scope.productData = {
						description : "Descrição mocada: O Melhor Café para sua empresa...",
						unitprice : "10.0",
						productid: "85",
						title: "Pilão CAFITESSE"
					}
				}

				 
				
				$scope.request = {
					quantity : clientData.user.minimumrequest,
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

			$scope.escape = function(value) {
				return value;
			}
			
			$scope.submit = function(){
				var serverPath = $('#serverpath').val();
				$scope.request.totalValue = $scope.getTotalPrice();
				$http.post(serverPath + "submitclient",$scope.request).success(function (data) {
					alert("Pedido finalizado com sucesso");
				});
			}

		} ]);