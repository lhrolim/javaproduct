<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<head>



<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/fontawesome.min.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/general.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/client.css" />" rel="stylesheet">





<script src="<c:url value="/resources/vendorscripts/jquery.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootbox.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/spin.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular-sanitize.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootstrap.js" />"></script>


<script src="<c:url value="/resources/scripts/client.js" />" charset="utf-8"></script>
<script src="<c:url value="/resources/scripts/ajax_interceptor.js" />"></script>
<script src="<c:url value="/resources/scripts/paginationService.js" />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Pilão E-Commerce</title>
</head>



<html ng-app="pilaocommerce">
<body>
	

	<div class="spinner" data-class="spinner" id="mainspinner"></div>
	<input type="hidden" id="clientdata" value='${clientdata}' />
	<input type="hidden" id="serverpath" value="<c:url value="/" />">

<%-- 	<input type="hidden" id="serverpath" value="<c:url value="/">" /> --%>


	<c:url value="/logout" var="logoutUrl" />
	<section class="header">
		<span>
		
		<img src="<c:url value="/resources/images/ajax-loader.gif" />" id="loading-indicator" style="display:none">
		 
		<img src="<c:url value="/resources/images/pilao-professional-logo.png" />"> <span class="logout"><i class="fa fa-user"></i>
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

	<section ng-controller="ClientController">


		




	</section>
</body>
</html>