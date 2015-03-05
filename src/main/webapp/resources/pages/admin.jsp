<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<head>


<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/fontawesome.min.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/general.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">





<script src="<c:url value="/resources/vendorscripts/jquery.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/spin.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootbox.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angularsmarttable.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootstrap.js" />"></script>
<script src="<c:url value="/resources/scripts/admin.js" />" charset="utf-8"></script>
<script src="<c:url value="/resources/scripts/util/stringutil.js" />" charset="utf-8"></script>
<script src="<c:url value="/resources/scripts/services/paginationService.js" />"></script>
<script src="<c:url value="/resources/scripts/services/alertService.js" />"></script>
<script src="<c:url value="/resources/scripts/ajax_interceptor.js" />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>



<html>
<body ng-app="pilaocommerce">

	<input type="hidden" id="users" value='${users}' />
	<input type="hidden" id="serverpath" value="<c:url value="/" />">

	<c:url value="/logout" var="logoutUrl" />
	<section class="header">
		<span> <img src="<c:url value="/resources/images/pilao-professional-logo.png" />"> <span class="logout"><i class="fa fa-user"></i>
				${pageContext.request.userPrincipal.name} | <i class="fa fa-sign-out"></i><a href="javascript:formSubmit()"> Logout</a> </span>
		</span>

		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

	</section>

	<section ng-controller="AdminController">

		<h2>Gerenciar Usuários</h2>

		<table class="table table-striped" st-pipe="callServer" st-table="users">
			<thead>
				<tr>
					<th st-sort="login">Usuário</th>
					<th st-sort="login">Nome</th>
					<th st-sort="login">Email</th>
					<th></th>
				</tr>

				<tr>
					<th><input st-search="'login'" /></th>
					<th><input st-search="'login'" /></th>
					<th><input st-search="'login'" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody ng-show="!isLoading">
				<tr ng-repeat="row in users">
					<td>{{row.login}}</td>
					<td>{{row.login}}</td>
					<td>{{row.login}}</td>
					<td colspan="1">
						<button type="button" class="btn btn-sm btn-primary" ng-click="editUser(row)">
							<i class="fa fa-edit"> </i>
						</button>
						<button type="button" class="btn btn-sm btn-danger" ng-click="deleteUser(row)">
							<i class="fa fa-remove"> </i>
						</button>
					</td>

				</tr>
			</tbody>
			<tbody ng-show="isLoading">
				<tr>
					<td colspan="4" class="text-center">Loading ...</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="text-center" st-pagination="" st-items-by-page="10" colspan="4"></td>
				</tr>
			</tfoot>
		</table>

		<button class="createnew btn btn-primary" ng-click="createUser()">Criar Usuário</button>
	</section>

	<section id="modal">
		<div class="modal fade" id="usermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Usuário:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="email" ng-model="newuser.login">
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Senha:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" ng-model="newuser.password">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Confirme a Senha:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" ng-model="newuser.passwordconfirm">
								</div>
							</div>
							
							
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>