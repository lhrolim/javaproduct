var admin = angular.module('pilaocommerce', [ 'ngSanitize' ]);

admin.controller('ClientController', [ '$scope','$http','alertService','$log',
		function($scope,$http,alertService,$log) {

	
	
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
					natop: $scope.clientData.nature,
				};
				
				
				$scope.request.productvalue = $scope.productData.unitprice * $scope.request.supplyamount;;
				
				$scope.active = $scope.amlabsdata.status == "Ativo";
				
				if (!$scope.active){
					$log.debug ('Sistema desabilitado devido ao status do cliente ' + $scope.amlabsdata.status);
				}
				
								
				$scope.$watch('request.leadtype',function(newvalue,oldvalue){
					var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
					$scope.request.shippingvalue = shippingvalue;
				});
				
				
				$scope.$watch('request.supplyamount',function(newvalue,oldvalue){
					if (newvalue == undefined || newvalue < $scope.clientData.minimumrequest){
						$scope.request.supplyamount = $scope.clientData.minimumrequest;
					}
					$scope.request.productvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				});

			}
			
			init();

			$scope.getTotalPrice = function() {
				var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice; 
				return $scope.request.productvalue + $scope.request.shippingvalue;
			}

			$scope.newrequest = function(value) {
				var clientData = $scope.clientData;
				$scope.error=false;
				$scope.request = {
					supplyamount: $scope.clientData.minimumrequest,
					leadtype : "express",
					productid: $scope.productData.productid,
					customerid : $scope.amlabsdata.customerid,
					natop: $scope.clientData.nature,
					shippingvalue:0
				};
				$scope.request.productvalue =$scope.productData.unitprice * $scope.request.supplyamount;
				var shippingvalue = $scope.request.leadtype == "express" ? $scope.clientData.expressPrice : $scope.clientData.normalPrice;
				$scope.request.shippingvalue = shippingvalue;
				$scope.submitting = false;
				$scope.completed= false;
			}
			
			$scope.buildShippingDate = function(){
				var daysToAdvance = $scope.request.leadtype == "express" ? $scope.clientData.expressLeadTime : $scope.clientData.normalLeadTime;
				var start = new Date();
				start.setHours(0,0,0,0);
				var futureDate = addDays(start,daysToAdvance);
				return futureDate.getTime();
			}
			
			$scope.getSelectedShippingLabel = function (){
				if ($scope.request.leadtype == "express"){
					return "Expressa ({0} dias úteis)".format($scope.clientData.expressLeadTime);
				}
				return "Normal ({0} dias úteis)".format($scope.clientData.normalLeadTime);
				
			}
			
			$scope.submit = function(){
				// "Deseja confirmar o pedido de compra e autorizar o
				// faturamento automático, conforme as condições descritas no
				// orçamento?"
				
				var form = $("#confirmationform");
				var html = $(form)[0].innerHTML;
				
				bootbox.dialog({
					  message:html,
				      title: "Resumo do Pedido",
					  buttons: {
		                    success: {
		                        label: "Confirmar",
		                        className: "btn-success",
		                        callback:function(){
									$scope.submitting = true;
									var serverPath = $('#serverpath').val();
									$scope.request.comments = $scope.clientData.remarks;
									$scope.request.shippingdate = $scope.buildShippingDate(); 
									$http.post(serverPath + "submitclient",$scope.request).success(function (data) {
										$scope.submitting = false;
										if (data.success){
											$scope.completed= true;	
										}else{
											$scope.submitting = false;
											$scope.error= true;
										}
										})
		                        }
		                    },
		                    cancel:{
		                    	label:"Cancelar",
		                    	className:"btn-cancel"
		                    }
		                    
					  }
	
				});
				
							}

		} ]);