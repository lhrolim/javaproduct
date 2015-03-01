var admin = angular.module('pilaocommerce', [ 'smart-table' ]);


admin.controller('AdminController', [ '$scope','paginationService', function(scope,paginationService) {
	
	var usersJS = $('#users').val();
	var users = JSON.parse(usersJS);
	
	var ctrl = this;

	
	
	  this.displayed = [];

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