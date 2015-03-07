var admin = angular.module('pilaocommerce', [ 'smart-table' ]);


admin.controller('AdminController', [ '$scope','paginationService','alertService','$http','$timeout', function($scope,paginationService,alertService,$http,$timeout) {
	
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
				alertService.alert("Usuário deletado com sucesso");
			});
		});
	}
	
	$scope.createUser = function(){
		 $('#usermodal').modal('show');
		 $scope.modaltitle = "Criar Usuário";
		 $scope.user = {
			 minimumrequest:1,
			 normalLeadTime:5,
			 expressLeadTime:5,
		 };
	}
	
	$scope.editUser = function(row){
		 $('#usermodal').modal('show');
		 $scope.modaltitle = "Editar Usuário";
		 $scope.user = row;
		 $scope.passwordplaceholder = "Manter a Senha"
	}
	
	$scope.updateUserArray = function(editing,user){
		var users =$scope.users;
		if (!editing){
			users.push(user);
		}else{
			var idx= -1;
			for (var i=0; i<users.length;i++){
				if (users[i].id == user.id){
					idx =1;
				}
			}
			if (idx==-1){
				users.push(user);
			}else{
				users[idx] = user;
			}
		}
	}
	
	$scope.saveUser = function(){
		var serverPath = $('#serverpath').val();
		$scope.submitting = true;
		$scope.user.password = $scope.user.newpassword;
		var editing = $scope.user.id != null;
		$http.post(serverPath + "/admin/save",$scope.user).success(function (data) {
			$scope.submitting = false;
			if (data.message.success){
				$scope.updateUserArray(editing,data.user);
				$scope.successMessage = data.message.successmessage;
				$timeout(function(){
					$scope.successMessage = null;
				},3000)
				$('#usermodal').modal('hide');
			}else{
				$scope.error=true;
				$scope.errormessage = data.error[0];
			}
		}).error(function (data){
			$scope.submitting = false;
			$scope.error=true;
		});
	}
	
	
	

//	  this.callServer = function callServer(tableState) {
//
//	    ctrl.isLoading = true;
//
//	    var pagination = tableState.pagination;
//
//	    var start = pagination.start || 0;     // This is NOT the page number, but the index of item in the list that you want to use to display the table.
//	    var number = pagination.number || 10;  // Number of entries showed per page.
//
//	    paginationService.getPage(start, number, tableState).then(function (result) {
//	      ctrl.displayed = result.data;
//	      tableState.pagination.numberOfPages = result.numberOfPages;//set the number of pages so the pagination can update
//	      ctrl.isLoading = false;
//	    });
//
//	  }}
}]);