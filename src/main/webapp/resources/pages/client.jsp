<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<head>



<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/fontawesome.min.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/general.css" />" rel="stylesheet">





<script src="<c:url value="/resources/vendorscripts/jquery.js" />"></script>
<script src="<c:url value="/resources/scripts/util/dateutil.js" />" charset="utf-8"></script>
<script src="<c:url value="/resources/vendorscripts/bootbox.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/spin.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/angular-sanitize.js" />"></script>
<script src="<c:url value="/resources/vendorscripts/bootstrap.js" />"></script>


<script src="<c:url value="/resources/scripts/client.js" />" charset="utf-8"></script>
<script src="<c:url value="/resources/scripts/services/alertService.js" /> " charset="utf-8"></script>
<script src="<c:url value="/resources/scripts/ajax_interceptor.js" />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Pilão E-Commerce</title>
</head>



<html ng-app="pilaocommerce">
<body>


	<div class="spinner" data-class="spinner" id="mainspinner"></div>
	<input type="hidden" id="clientdata" value='${clientdata}' />
	<input type="hidden" id="amlabsdata" value='${amlabsdata}' />
	<input type="hidden" id="serverpath" value="<c:url value="/" />">

	<%-- 	<input type="hidden" id="serverpath" value="<c:url value="/">" /> --%>


	<c:url value="/logout" var="logoutUrl" />

	<div class="header-wrapper">
		<div id="headerShadow" class="header-shadow"></div>
		<div class="header">
			<a class="logo"> <img src="<c:url value="/resources/images/pilao-professional-logo.png" />" alt="PIlão Professional">
			</a> <span class="headertext">Dúvidas? Entre em contato com a nossa central de vendas! (11)4533-1322</span> <span> <img
				src="<c:url value="/resources/images/ajax-loader.gif" />" id="loading-indicator" style="display: none"> <img src=""> <span
				class="logout"><i class="fa fa-user"></i> ${pageContext.request.userPrincipal.name} | <i class="fa fa-sign-out"></i><a
					href="javascript:formSubmit()"> Sair</a> </span>
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



	<section ng-controller="ClientController">


		<div class="main-container">

			<div class="col-wrapper col-box">
				<div>
					<div class="itemrow">
						<div class="col col-6of6">
							<h1 ng-bind-html="productData.title" class="productitle" />
						</div>
					</div>

					<div class="itemrow">
						<div class="col col-3of6 content-image-left">
							<img src="<c:url value="/resources/images/cafitesse.jpg" />" style="cursor: pointer">
						</div>
						<div id="ctl00_cphContent_ctl03_pnlContentText" class="col col-3of6">

							<h2>Pilão CAFITESSE</h2>
							<div class="content-block">
								<div>
									<ul>
										<li>café encorpado com sabor intenso;</li>
										<li>forte e equilibrado;</li>
										<li>100% acondicionado em embalagem BAG IN BOX, hermeticamente fechado;</li>
										<li>segue as normas ISO 9001 e HACCP*;</li>
										<li>2 litros de café concentrado rendem de 40 a 60 litros de bebida pronta para o consumo</li>
									</ul>
									<p>
										* <em>HACCP: Hazard Analysis and Critical Control Points.</em>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div ng-show="completed">
						<div class="itemrow">
							<div class="col col-6of6">
								<div class="alert alert-success" role="alert"><icon class="fa fa-check"></icon> Pedido realizado com sucesso! Você receberá um email de confirmação em breve</div>
								<button class="btn btn-primary" ng-click="newrequest()">Novo Pedido</button>
							</div>
						</div>
					</div>
					
					<div ng-show="error">
						<div class="itemrow">
							<div class="col col-6of6">
								<div class="alert alert-danger" role="alert"><icon class="fa fa-check"></icon>Erro ao gerar pedido {{errormessage}}</div>
								<button class="btn btn-primary" ng-click="newrequest()">Novo Pedido</button>
							</div>
						</div>
					</div>
					
					<div ng-show="!active">
						<div class="itemrow">
							<div class="col col-6of6">
								<div class="alert alert-danger" role="alert"><icon class="fa fa-check"></icon>Favor entrar em contato com nossa central de vendas no telefone (11)4533-1322</div>
							</div>
						</div>
					</div>

					<div ng-show="!completed && !error && active">
						<div class="itemrow">
							<div class="col col-6of6">
								<label class="doitonline">Faça o seu pedido Online!</label>
							</div>
						</div>

						<div class="itemrow">
							<div class="col col-6of6 form-group">
								<table class="table table-bordered">
									<thead>
										<th>Preço Unitário</th>
										<th>Quantidade</th>
										<th>Sub-Total</th>
									</thead>
									<tbody>
										<tr>
											<td>R{{productData.unitprice | currency}}</td>
											<td><input type="number" class="form-control" style="width: 75px" min="{{clientData.minimumrequest}}" ng-model="request.supplyamount">
											</td>
											<td>R{{request.productvalue | currency}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="itemrow">

							<div class="col col-4of6">

								<table>
									<thead>
										<th colspan="2"><label class="control-label" style="font-size: 20px">Endereço de Entrega</label></th>
									</thead>
									<tbody>
										<tr>
											<td style="width: 280px;"><br>{{amlabsdata.tradingname}}<br>{{amlabsdata.name}}<br>{{amlabsdata.cnpj}}</td>
											<td><br>{{amlabsdata.address}}, {{amlabsdata.nro}} , {{amlabsdata.complement}} <br>{{amlabsdata.neighborhood}}<br>{{amlabsdata.city}},{{amlabsdata.state}}, {{amlabsdata.zipcode}}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col col-2of6 form-group">
								<fieldset>
									<label class="control-label">Tipo de Entrega: </label>
									<div class="radio">
										<label> <input type="radio" name="request.leadtype" id="optionsRadios1" value="express" checked ng-model="request.leadtype">
											Expressa ({{clientData.expressLeadTime}} dias úteis) -- R{{clientData.expressPrice | currency}}
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="request.leadtype" id="optionsRadios1" value="normal" ng-model="request.leadtype"> Normal
											({{clientData.normalLeadTime}} dias úteis) -- R{{clientData.normalPrice| currency}}
										</label>
									</div>
								</fieldset>

								<fieldset class="totalsummary">
									<label class="control-label">Valor Total:</label> <label class="control-label">R{{getTotalPrice()| currency}}</label>
								</fieldset>
								<button class="btn btn-primary" ng-click="submit()" ng-disabled="submitting">
									Finalizar Pedido</input>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
</body>
</html>