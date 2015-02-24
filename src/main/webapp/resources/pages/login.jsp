<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<script src="<c:url value="/resources/vendorscripts/jquery.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootstrap.js" />"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>

<body>
	<div class="vertical-center">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-md-offset-4">
					<div class="account-wall">
						<img class="profile-img"
							src="<c:url value="/resources/images/pilao-professional-logo.png" />"
							alt="">
						<c:if test="${not empty error}">
							<div class="error-signin">${error}</div>
						</c:if>

						<form class="form-signin" action="<c:url value='/login' />"
							method='POST'>
							<input type="text" class="form-control" placeholder="Usuário"
								name="username" required autofocus> <input
								type="password" class="form-control" placeholder="Senha"
								required name="password">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Sign in</button>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>

</html>