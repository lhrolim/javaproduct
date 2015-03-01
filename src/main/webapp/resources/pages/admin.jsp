<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<head>
<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<script src="<c:url value="/resources/vendorscripts/jquery.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular.js" />"></script>
<script
	src="<c:url value="/resources/vendorscripts/angularsmarttable.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootstrap.js" />"></script>
<script src="<c:url value="/resources/scripts/admin.js" />"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>



<html>
<body ng-app="pilaocommerce">

	<section ng-controller="AdminController">

		<table st-table="rowCollection" class="table table-striped">
			<thead>
				<tr>
					<th>first name</th>
					<th>last name</th>
					<th>birth date</th>
					<th>balance</th>
					<th>email</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="row in rowCollection">
					<td>{{row.firstName}}</td>
					<td>{{row.lastName}}</td>
					<td>{{row.birthDate}}</td>
					<td>{{row.balance}}</td>
					<td>{{row.email}}</td>
				</tr>
			</tbody>
		</table>


		<h1>Title : ${title}</h1>
		<h1>Message : ${message}</h1>

		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				Welcome : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
	</section>
</body>
</html>