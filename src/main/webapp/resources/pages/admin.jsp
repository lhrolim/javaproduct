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
<script src="<c:url value="/resources/scripts/util/stringutil.js" />"></script>
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
	</section>

	<section ng-controller="AdminController">

		<h2>Gerenciar Usuários</h2>

		<table class="table table-striped" st-pipe="callServer" st-table="users">
			<thead>
				<tr>
					<th st-sort="login">Usuário</th>
					<th st-sort="login">Nome</th>
					<th st-sort="login">Email</th>
					<th>
				</tr>

				<tr>
					<th><input st-search="'login'" /></th>
					<th><input st-search="'login'" /></th>
					<th><input st-search="'login'" /></th>
				</tr>
			</thead>
			<tbody ng-show="!isLoading">
				<tr ng-repeat="row in users">
					<td>{{row.login}}</td>
					<td>{{row.login}}</td>
					<td>{{row.login}}</td>
					<td>
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

		<button class="createnew btn btn-primary">Criar Usuário</button>


		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

	</section>
</body>
</html>