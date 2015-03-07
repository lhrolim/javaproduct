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
<script src="<c:url value="/resources/scripts/currencydirective.js" />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admin</title>
</head>



<html ng-app="pilaocommerce">
<body>



	<div class="spinner" data-class="spinner" id="mainspinner"></div>
	<input type="hidden" id="clientdata" value='${clientdata}' />
	<input type="hidden" id="users" value='${users}' />
	<input type="hidden" id="serverpath" value="<c:url value="/" />">

	<%-- 	<input type="hidden" id="serverpath" value="<c:url value="/">" /> --%>


	<c:url value="/logout" var="logoutUrl" />

	<div class="header-wrapper">
		<div id="headerShadow" class="header-shadow"></div>
		<div class="header">
			<a class="logo"> <img src="<c:url value="/resources/images/pilao-professional-logo.png" />" alt="PIlão Professional">
			</a> <span class="headertext">Dúvidas? Entre em contato com a nossa central de vendas! (11)1234-1234</span> <span> <img
				src="<c:url value="/resources/images/ajax-loader.gif" />" id="loading-indicator" style="display: none"> <img src=""> <span
				class="logout"><i class="fa fa-user"></i> ${pageContext.request.userPrincipal.name} | <i class="fa fa-sign-out"></i><a
					href="javascript:formSubmit()"> Logout</a> </span>
			</span>
			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<script>
				function formSubmit() {
					document.getElementById("logoutForm").submit();
				}
			</script>
		</div>
	</div>



	<section ng-controller="AdminController">


		<div class="main-container">

			<div class="col-wrapper col-box">
				<div class="itemrow">
					<div class="col col-6of6">

						<h2>Gerenciar Usuários</h2>

						<div ng-show="successMessage != null">
							<div class="itemrow">
								<div class="col col-6of6">
									<div class="alert alert-success" role="alert">
										<icon class="fa fa-check"></icon>
											{{successMessage}}
									</div>
								</div>
							</div>
						</div>


						<table class="table table-striped" st-pipe="callServer" st-table="users">
							<thead>
								<tr>
									<th st-sort="login">Usuário</th>
									<th st-sort="amlabs_id">Amlabs Id</th>
									<th></th>
								</tr>

								<tr>
									<th><input st-search="'login'" class="form-control" style="width: 50%" /></th>
									<th><input st-search="'amlabs_id'" class="form-control" style="width: 50%" /></th>
									<th></th>
								</tr>
							</thead>
							<tbody ng-show="!isLoading">
								<tr ng-repeat="row in users">
									<td>{{row.login}}</td>
									<td>{{row.amlabs_id}}</td>
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

						<section id="modal">
							<div class="modal fade" id="usermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">{{modaltitle}}</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" role="form">

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Usuário:</label>
													<div class="col-sm-6">
														<input type="text" name="login" class="form-control" id="email" ng-model="user.login" required>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Senha:</label>
													<div class="col-sm-6">
														<input type="password" class="form-control" ng-model="user.newpassword" placeholder="{{passwordplaceholder}}" required>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Confirme a Senha:</label>
													<div class="col-sm-6">
														<input type="password" class="form-control" ng-model="user.passwordconfirm" placeholder="{{passwordplaceholder}}" required>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Id AMLABS:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" ng-model="user.amlabs_id" required>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Preço Entrega Normal:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" ng-model="user.normalPrice" required format="number">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Preço Entrega Expressa:</label>
													<div class="col-sm-6">
														<input type="text" class="form-control" ng-model="user.expressPrice" required format="number">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Prazo Envio Normal:</label>
													<div class="col-sm-6">
														<input type="number" min="1" class="form-control" ng-model="user.normalLeadTime" required>
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Prazo Envio Expressa:</label>
													<div class="col-sm-6">
														<input type="number" min="1" class="form-control" ng-model="user.expressLeadTime">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Pedido Mínimo:</label>
													<div class="col-sm-6">
														<input type="number" min="1" class="form-control" ng-model="user.minimumrequest">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-sm-4" for="email">Comentários:</label>
													<div class="col-sm-6">
														<textarea class="form-control" ng-model="user.remarks"></textarea>
													</div>
												</div>
											</form>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
											<button type="button" class="btn btn-primary" ng-click="saveUser()" ng-disabled="submitting">Salvar</button>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>



</body>
</html>