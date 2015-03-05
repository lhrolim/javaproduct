var admin = angular.module('pilaocommerce', [ 'smart-table' ]);


admin.controller('AdminController', [ '$scope','paginationService','alertService','$http', function($scope,paginationService,alertService,$http) {
	
	var usersJS = $('#users').val();
	var users = JSON.parse(usersJS);
	
	$scope.users = users;
	
	var ctrl = this;

	
	$scope.deleteUser=function(user){
		alertService.confirm("Confirma deleção do usuário {0}?".format(user.login),function(data){
			var serverPath = $('#serverpath').val();
			$http.post(serverPath + "admin/delete?userid={0}".format(user.id)).success(function (data) {
				var result = $scope.users.filter(function(elem){
					   return elem.id != user.id; 
				});//result -> [1,2,3,4]
				$scope.users = result;
				alert("Usuário deletado com sucesso");
			});
		});
	}
	
	$scope.createUser = function(){
		 $('#usermodal').modal('show');
	}
	
	

	  this.callServer = function callServer(tableState) {

	    ctrl.isLoading = true;

	    var pagination = tableState.pagination;

	    var start = pagination.start || 0;     // This is NOT the page number, but the index of item in the list that you want to use to display the table.
	    var number = pagination.number || 10;  // Number of entries showed per page.

	    paginationService.getPage(start, number, tableState).then(function (result) {
	      ctrl.displayed = result.data;
	      tableState.pagination.numberOfPages = result.numberOfPages;//set the number of pages so the pagination can update
	      ctrl.isLoading = false;
	    });

	  }}]);