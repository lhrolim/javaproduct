<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<head>



<link href="<c:url value="/resources/vendorcss/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/bootstrap-theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendorcss/fontawesome.min.css" />" rel="stylesheet">

<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/general.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/client.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/pilao.css" />" rel="stylesheet">





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

<body class="pt-br" data-country="pt-br" hola-ext-player="1">

	<!-- Google Tag Manager -->
	<noscript>&lt;iframe src="//www.googletagmanager.com/ns.html?id=GTM-MD69NW" height="0" width="0"
		style="display:none;visibility:hidden"&gt;&lt;/iframe&gt;</noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MD69NW');</script>
	<!-- End Google Tag Manager -->

	<form name="aspnetForm" method="post" action="/pilao/brasil/nossos-cafes/cafe-do-ponto-cafitesse/" id="aspnetForm" autocomplete="off">
		<div>
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value=""> <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value=""> <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
				value="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">
		</div>

		<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


		<script
			src="/WebResource.axd?d=FSXspqFcrMWzoY6XYlw3NHxu0Xy7isuhrCbije23yp_myGO1IKmMyeEdWo525EpJuNSfFbN5uEfb-9aWUkYGvWsdoww1&amp;t=635217168300000000"
			type="text/javascript"></script>


		<script
			src="/ScriptResource.axd?d=z-KcAgBYOkXcVWwAfl6xSNEvij0J6qcQ6cHjRV4cD_pqMwGzAdFG2I08zuSL5wkz2W-N-Kd4G3pZ-EIG6QTUw8Gm-IjbHm3OvAUPadwwCvWdazTL0&amp;t=7f16157c"
			type="text/javascript"></script>
		<script
			src="/ScriptResource.axd?d=RxIhj3xq4HQkWCXNMwBb6_IuAY83tMHtQu4V21MLE1jG0V0j5pcr10WmFqMxzvzVOrrBWk30rCu1IWYtD8b_bMU3sK8lwwQtFu4dWOAuIL0wHSASntomi9KHWhNlqH1hWqQEJA2&amp;t=7f16157c"
			type="text/javascript"></script>
		<div>

			<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="">
		</div>



		<div class="header-wrapper">
			<div id="headerShadow" class="header-shadow"></div>
			<div class="header">
				<a href="/pilao/brasil/" class="logo"> <img src="/Global/BR%20Brazil/header/pilao-professional-logo.png" alt="PIlão Professional">

				</a>

				<ul class="nav nav-meta">

					<li><a href="/pilao/brasil/contato/"> <span></span>Fale conosco
					</a></li>

					<li><span class="flag"></span> <a id="ctl00_cphHeader_headerControl_hypLanguageSelector" href="/pilao/brasil/selecione-outro-pais/">Português
							(Brasil)</a></li>

					<li><a href="/pilao/brasil/selecione-outro-pais/" class="select-country">Selecione outro país</a></li>

				</ul>

				<fieldset id="ctl00_cphHeader_headerControl_Fieldset1" class="search">
					<input type="text" placeholder="Busca..."> <a href="/pilao/brasil/404/" class="search-submit">Busca</a>
				</fieldset>
			</div>
		</div>
		<div class="nav-main-wrapper">
			<div class="nav-main-overlay" style="left: -9999px;"></div>
			<div class="nav-main-holder">
				<ul class="nav nav-main">

					<li><a href="/pilao/brasil/conheca-nossa-empresa/"> <span class="left"></span> <span class="right"></span> <span class="middle"></span>
							<span class="text">Sobre Pilão Professional</span>
					</a></li>

					<li><a href="/pilao/brasil/maquinas-para-cafe/"> <span class="left"></span> <span class="right"></span> <span class="middle"></span> <span
							class="text">Máquinas para café</span>
					</a>

						<div class="flyout">
							<div class="bottom-flyout"></div>
							<h3>Máquinas para café</h3>
							<ul class="nav clearfix">

								<li style="overflow: visible; min-height: 58px;">
									<h4 style="overflow: visible; min-height: 48px;">
										<a href="/pilao/brasil/maquinas-para-cafe/maquinas-cafe-espresso/">Máquinas para café espresso</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 58px;">
									<h4 style="overflow: visible; min-height: 48px;">
										<a href="/pilao/brasil/maquinas-para-cafe/maquinas-cafe-coado/">Máquinas para café coado</a>
									</h4>

								</li>

							</ul>
						</div></li>

					<li><a href="/pilao/brasil/solucoes/"> <span class="left"></span> <span class="right"></span> <span class="middle"></span> <span
							class="text">Soluções</span>
					</a>

						<div class="flyout">
							<div class="bottom-flyout"></div>
							<h3>Soluções</h3>
							<ul class="nav clearfix">

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/solucoes/empresas/">Empresas</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/solucoes/hoteis/">Hotéis</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/solucoes/padarias/">Padarias</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/solucoes/hospitais/">Hospitais</a>
									</h4>

								</li>

							</ul>
						</div></li>

					<li><a href="/pilao/brasil/nossos-cafes/"> <span class="left"></span> <span class="right"></span> <span class="middle"></span> <span
							class="text">Nossos cafés</span>
					</a>

						<div class="flyout">
							<div class="bottom-flyout"></div>
							<h3>Nossos cafés</h3>
							<ul class="nav clearfix">

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/nossos-cafes/cafe-do-ponto-cafitesse/">Cafitesse</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/nossos-cafes/cafe-pilao-premium/">Premium </a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/nossos-cafes/cafe-pilao-gourmet/">Gourmet</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/nossos-cafes/cafe-pilao-espresso/">Espresso</a>
									</h4>

								</li>

								<li style="overflow: visible; min-height: 34px;">
									<h4 style="overflow: visible; min-height: 24px;">
										<a href="/pilao/brasil/nossos-cafes/cafe-do-ponto-reffinato/">Reffinato</a>
									</h4>

								</li>

							</ul>
						</div></li>

				</ul>
			</div>
		</div>

		<div id="breadCrumb" class="breadcrumb-wrapper" style="visibility: visible;">
			<div class="breadcrumb-container">
				<ul class="breadcrumb">


					<li id="ctl00_cphHeader_headerControl_currentBreadCrumb"></li>
				</ul>
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
					<a class="print-btn" data-tiptext="Versão para Impressão"></a> <a class="addthis_button_twitter at300b" data-tiptext="Compartilhe no Twitter"
						href="#"><span class="at4-icon aticon-twitter" style="background-color: rgb(44, 168, 210);"><span class="at_a11y">Share on
								twitter</span></span></a> <a class="addthis_button_facebook at300b" data-tiptext="Compartilhe no Facebook" href="#"><span class="at4-icon aticon-facebook"
						style="background-color: rgb(48, 88, 145);"><span class="at_a11y">Share on facebook</span></span></a> <a class="addthis_button_linkedin at300b"
						data-tiptext="Compartilhe no LinkedIn"
						href="http://www.addthis.com/bookmark.php?v=300&amp;winname=addthis&amp;pub=xa-4ff2add970229b7c&amp;source=tbx-300&amp;lng=pt-br&amp;s=linkedin&amp;url=http%3A%2F%2Fwww.douweegbertsprofessional.com%2Fpilao%2Fbrasil%2Fnossos-cafes%2Fcafe-do-ponto-cafitesse%2F&amp;title=Pil%C3%A3o%20CAFITESSE%20%7C%20Douwe%20Egberts%20Professional&amp;ate=AT-xa-4ff2add970229b7c/-/-/54f858f55b7da07d/2&amp;frommenu=1&amp;uid=54f858f593acd847&amp;ct=1&amp;tt=0&amp;captcha_provider=nucaptcha"
						target="_blank"><span class="at4-icon aticon-linkedin" style="background-color: rgb(68, 152, 200);"><span class="at_a11y">Share
								on linkedin</span></span></a> <a class="addthis_button_email at300b" data-tiptext="Compartilhe via e-mail" target="_blank" href="#"><span
						class="at4-icon aticon-email" style="background-color: rgb(115, 138, 141);"><span class="at_a11y">Share on email</span></span></a> <a
						class="addthis_button_compact at300m" data-tiptext="Compartilhe também em..." href="#"><span class="at4-icon aticon-compact"
						style="background-color: rgb(252, 109, 76);"><span class="at_a11y">More Sharing Services</span></span></a>
					<div class="atclear"></div>
				</div>

				<!-- AddThis Button END -->
			</div>
		</div>
		<script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$cphHeader$scriptManager', 'aspnetForm', [], [], [], 90, 'ctl00');
//]]>
</script>


		<div>



			<div class="branding-wrapper">
				<div class="pushbox pushbox-landing">
					<div class="pushbox-viewport" style="height: 475px;">
						<ul class="pushbox-slides">

							<li style="display: none; z-index: 1;">
								<div class="text-box">
									<h3>Forte e equilibrado</h3>




								</div> <img src="/Global/BR%20Brazil/imagens/_0008_Caf%c3%a9s%20-%20Cafitesse.jpg" alt="Forte e equilibrado">

							</li>

							<li style="display: block; z-index: 1;">
								<div class="text-box">
									<h3>Café encorpado com sabor intenso</h3>




								</div> <img src="/Global/BR%20Brazil/imagens/_0009_Caf%c3%a9s%20-%20Cafitesse.jpg" alt="Café encorpado com sabor intenso">

							</li>

						</ul>
					</div>
					<div id="ctl00_cphContent_ctl00_pushboxNav" class="pushbox-nav">
						<ul>

							<li class="">1</li>

							<li class="active">2</li>

						</ul>
					</div>

					<div class="pushbox-overlay"></div>

					<!--Call to action-->
					<div id="ctl00_cphContent_ctl00_ctaPushBox" class="call-to-action">


						<em>Mais informações?</em>


						<div class="call-button-holder">
							<div>
								<p>
									<a href="/pilao/brasil/Popup---Contato/" title="" class="button button-yellow" rel="shadowbox; width=510;height=540">Envie um e-mail</a>&nbsp;
								</p>
							</div>
						</div>


					</div>

				</div>
			</div>


			<div class="col-wrapper col-box col-margintop">
				<div class="row">
					<div class="col col-6of6">
						<div id="ctl00_cphContent_contentIntroduction_introPanel" class="intro">




							<h1>Pilão CAFITESSE</h1>


						</div>
					</div>
				</div>




				<div class="row">
					<div id="ctl00_cphContent_ctl03_pnlContent" class="row">


						<!-- Full image-->




						<!-- Small image left-->

						<div class="col col-3of6 content-image-left">
							<img src="/Scaled/396x223x2/Global-BR%20Brazil-imagens-Caf%c3%a9s%20-%20Cafitesse.jpg" alt="">
						</div>


						<!-- Video right-->


						<!-- Text -->
						<div id="ctl00_cphContent_ctl03_pnlContentText" class="col col-3of6 content-block">

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

						<!-- Small image right-->



						<!-- Video right-->


					</div>
				</div>




				<div class="row border-curved">
					<div id="ctl00_cphContent_ctl05_pnlContent" class="row">


						<!-- Full image-->




						<!-- Small image left-->


						<!-- Video right-->


						<!-- Text -->
						<div id="ctl00_cphContent_ctl05_pnlContentText" class="col">

							<h2>Você conhece o Sistema Cafitesse?</h2>
							<div class="content-block">
								<div>
									<p>O Sistema Cafitesse é uma solução completa de café coado, perfeito para atender seus clientes em&nbsp;qualquer hora do dia.</p>
									<p>
										Sistema líder na Europa, utiliza máquinas automatizadas com tecnologia de ponta para oferecer,&nbsp;<br>ao um toque de um botão, um
										café fresco em qualidade, sabor e aroma.
									</p>
								</div>
							</div>

						</div>

						<!-- Small image right-->



						<!-- Video right-->


					</div>
				</div>





				<div id="ctl00_cphContent_contentList_contentList_ctrl0_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl0_contentView_pnlContentText" class="col">

						<h2>Café sempre fresco</h2>
						<div class="content-block">
							<div>
								<p>Pilão Cafitesse é acondicionado em embalagem “bag in box”,&nbsp;hermeticamente fechada com sistema de dosagem e segurança&nbsp;contra
									contaminação.&nbsp;</p>
								<p>
									(Pilão Cafitesse segue as normas ISO 9001 e HACCP* - <em>Hazard Analysis and&nbsp;</em><br>
									<em>Critical Control Points</em> - Análise de Riscos no Processamento Alimentar).
								</p>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>

				<div id="ctl00_cphContent_contentList_contentList_ctrl1_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl1_contentView_pnlContentText" class="col">

						<h2>100% Puro Café</h2>
						<div class="content-block">
							<div>
								<p>Pilão Cafitesse é 100% puro café. Uma bebida encorpada, com&nbsp;sabor intenso, forte e bem equilibrada. É café sempre fresco a
									qualquer momento.</p>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>

				<div id="ctl00_cphContent_contentList_contentList_ctrl2_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl2_contentView_pnlContentText" class="col">

						<h2>Certificado UTZ</h2>
						<div class="content-block">
							<div>
								<p>Cafitesse possui a certificação UTZ, que assegura que o café foi&nbsp;cultivado e colhido de forma responsável. Leia mais sobre
									nosso&nbsp;programa de sustentabilidade.</p>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>

				<div id="ctl00_cphContent_contentList_contentList_ctrl3_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl3_contentView_pnlContentText" class="col">

						<h2>Método de fabricação exclusivo</h2>
						<div class="content-block">
							<div>
								<p>Pilão Cafitesse é preparado sob condições ideais para extração&nbsp;do melhor do grão, o que resulta em um café forte e aromático.</p>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>

				<div id="ctl00_cphContent_contentList_contentList_ctrl4_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl4_contentView_pnlContentText" class="col">

						<h2>Paixão pelo Café</h2>
						<div class="content-block">
							<div>
								<p>Com cerca de 250 anos de tradição, a Douwe Egberts mantém&nbsp;em seus master blenders todo o conhecimento de blends feitos&nbsp;a
									partir dos melhores grãos e as embalagens são estudadas&nbsp;cuidadosamente para manter as características do produto.</p>
								<p>Com&nbsp;Pilão Cafitesse, você pode desfrutar de um café sempre fresco&nbsp;e de perfeita qualidade, graças ao seu processo de
									fabricação&nbsp;único.</p>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>

				<div id="ctl00_cphContent_contentList_contentList_ctrl5_contentView_pnlContent" class="row">


					<!-- Full image-->




					<!-- Small image left-->


					<!-- Video right-->


					<!-- Text -->
					<div id="ctl00_cphContent_contentList_contentList_ctrl5_contentView_pnlContentText" class="col">

						<h2>Vantagens do Sistema Cafitesse em relação ao sistema de café coado convencional:</h2>
						<div class="content-block">
							<div>
								<ul>
									<li><strong>Rapidez:</strong> com o sistema de café coado convencional, fazer uma simples xícara de café pode levar&nbsp;muito tempo.
										Com o sistema Cafitesse, em 2 segundos você tem o seu café pronto para tomar;</li>
									<li><strong>Padronização:</strong> todas as xícaras saem com a mesma quantidade de café;</li>
									<li><strong>Descentralização das máquinas:</strong> facilita o dia a dia e agiliza a produção nas horas de mais movimento;</li>
									<li><strong>Fim do desperdício:</strong> 100% de aproveitamento.</li>
									<li><strong>Segurança: </strong>eliminando a circulação das famosas panelas de água quente para o preparo.</li>
									<li>Certificações: todos nossos processos seguem as rígidas normas ISO 9001 e HACCP (<em>Hazard Analysis and Critical Control
											Points</em> – Análise de Riscos no Procedimento Alimentar).&nbsp;
									</li>
									<li><strong>Total padronização:</strong> matéria prima 100% natural e sem conservantes; embalagem “bag in box” em caixa hermeticamente
										fechada; sistema de dosagem e segurança contra contaminação.</li>
								</ul>
							</div>
						</div>

					</div>

					<!-- Small image right-->



					<!-- Video right-->


				</div>


			</div>

			<div class="col-wrapper col-box call-to-action">

				<em>Mais informações?</em>


				<div class="call-button-holder">
					<div>
						<p>
							<a href="/pilao/brasil/Popup---Contato/" title="" class="button button-yellow" rel="shadowbox; width=510;height=540">Envie um e-mail</a>&nbsp;
						</p>
					</div>
				</div>

			</div>

			<div class="col-wrapper"></div>

			<div class="col-wrapper">
				<div class="row">
					<div class="col col-6of6"></div>
				</div>
			</div>

		</div>
	</form>




	<div class="footer-wrapper clearfix">
		<div class="footer">
			<div class="footer-inner">


				<div class="row">
					<div class="col col-6of6">
						<ul class="nav footer-sitemap clearfix">

							<li>
								<h3 style="overflow: visible; min-height: 48px;">
									<a href="/pilao/brasil/conheca-nossa-empresa/"> Sobre Pilão Professional </a>
								</h3>

								<ul>

									<li><a href="/pilao/brasil/conheca-nossa-empresa/"> Conheça nossa empresa </a></li>

								</ul>

							</li>

							<li>
								<h3 style="overflow: visible; min-height: 48px;">
									<a href="/pilao/brasil/maquinas-para-cafe/"> Máquinas para café </a>
								</h3>

								<ul>

									<li><a href="/pilao/brasil/maquinas-para-cafe/maquinas-cafe-espresso/"> Máquinas para café espresso </a></li>

									<li><a href="/pilao/brasil/maquinas-para-cafe/maquinas-cafe-coado/"> Máquinas para café coado </a></li>

								</ul>

							</li>

							<li>
								<h3 style="overflow: visible; min-height: 48px;">
									<a href="/pilao/brasil/solucoes/"> Soluções </a>
								</h3>

								<ul>

									<li><a href="/pilao/brasil/solucoes/empresas/"> Empresas </a></li>

									<li><a href="/pilao/brasil/solucoes/hoteis/"> Hotéis </a></li>

									<li><a href="/pilao/brasil/solucoes/padarias/"> Padarias </a></li>

									<li><a href="/pilao/brasil/solucoes/hospitais/"> Hospitais </a></li>

								</ul>

							</li>

							<li>
								<h3 style="overflow: visible; min-height: 48px;">
									<a href="~/link/2292c334f29f476a9e11e78abcfb71cb.aspx?epslanguage=pt-BR"> Nossos Cafés </a>
								</h3>

								<ul>

									<li><a href="/pilao/brasil/nossos-cafes/cafe-do-ponto-cafitesse/"> Cafitesse </a></li>

									<li><a href="/pilao/brasil/nossos-cafes/cafe-pilao-espresso/"> Espresso </a></li>

									<li><a href="/pilao/brasil/nossos-cafes/cafe-pilao-gourmet/"> Gourmet </a></li>

									<li><a href="/pilao/brasil/nossos-cafes/cafe-pilao-premium/"> Premium </a></li>

									<li><a href="/pilao/brasil/nossos-cafes/cafe-do-ponto-reffinato/"> Reffinato </a></li>

								</ul>

							</li>

						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="ie-footer-bg-left"></div>
		<div class="ie-footer-bg-right"></div>
	</div>
	<div class="footermeta-wrapper">
		<div class="footer-meta">
			<p class="copyright">© Copyright Pilão Professional</p>

			<ul class="nav nav-meta clearfix">

				<li><a href="/pilao/brasil/contato/" rel="nofollow"> Fale conosco </a></li>

				<li><a href="/pilao/brasil/termos-de-uso/" rel="nofollow"> Termos de Uso </a></li>

				<li><a href="/pilao/brasil/politica-de-privacidade/" rel="nofollow"> Política de Privacidade </a></li>

				<li><a
					href="http://www.demasterblenders1753.com/en/careers/Your-international-career/South-America/Brazil/Welcome-to-Brazil/?epslanguage=pt-BR"
					rel="nofollow"> Informações da Empresa </a></li>

			</ul>

		</div>
	</div>




	<script src="/Web/js/site.js?v=9Xqkbt_XkOcjcKrr3Koy7GMz0HEB2Dg8hZvE-mdlMnU1"></script>


	<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4ff2add970229b7c&amp;domready=1"></script>
	<div id="_atssh" style="visibility: hidden; height: 1px; width: 1px; position: absolute; top: -9999px; z-index: 100000;">
		<iframe id="_atssh451" title="AddThis utility frame"
			src="//s7.addthis.com/static/r07/sh200.html#iit=1425561845240&amp;tmr=load%3D1425561844873%26core%3D1425561845213%26main%3D1425561845236%26ifr%3D1425561845241&amp;cb=0&amp;cdn=0&amp;kw=&amp;ab=-&amp;dh=www.douweegbertsprofessional.com&amp;dr=&amp;du=http%3A%2F%2Fwww.douweegbertsprofessional.com%2Fpilao%2Fbrasil%2Fnossos-cafes%2Fcafe-do-ponto-cafitesse%2F&amp;dt=Pil%C3%A3o%20CAFITESSE%20%7C%20Douwe%20Egberts%20Professional&amp;dbg=0&amp;cap=tc%3D0%26ab%3D0&amp;inst=1&amp;jsl=1&amp;prod=undefined&amp;lng=pt-br&amp;ogt=&amp;pc=men&amp;pub=xa-4ff2add970229b7c&amp;ssl=0&amp;sid=54f858f55b7da07d&amp;srpl=1&amp;srcs=1&amp;srd=1&amp;srf=1&amp;srx=1&amp;ver=300&amp;xck=0&amp;xtr=0&amp;og=&amp;aa=0&amp;csi=undefined&amp;toLoJson=uvs%3D54f8578f7454266b003%26chr%3DUTF-8%26md%3D0%26vcl%3D1&amp;rev=18.4-edge&amp;ct=1&amp;xld=1&amp;xd=1"
			style="height: 1px; width: 1px; position: absolute; top: 0px; z-index: 100000; border: 0px; left: 0px;"></iframe>
	</div>
	<script type="text/javascript" src="http://s7.addthis.com/static/r07/core201.js"></script>

	<script type="text/javascript">
            Shadowbox.init();
            (function ($) { $(document).ready(function () { $("[hidden='hidden']").hide(); }); })(jQuery);
        </script>
</html>











<script type="text/javascript" id="">(function(c,h,m,u){var n={elements:[],minHeight:0,percentage:!0,testing:!1},k=c(h),f=[];c.scrollDepth=function(d){function l(a,b,e){d.testing?c("#console").html(a+": "+b):"undefined"!==typeof dataLayer?(dataLayer.push({event:"ScrollDistance",eventCategory:"Scroll Depth",eventAction:a,eventLabel:b,eventValue:1,eventNonInteraction:!0}),2<arguments.length&&dataLayer.push({event:"ScrollTiming",eventCategory:"Scroll Depth",eventAction:a,eventLabel:b,eventTiming:e})):("undefined"!==typeof ga&&(ga("send",
"event","Scroll Depth",a,b,1,{nonInteraction:1}),2<arguments.length&&ga("send","timing","Scroll Depth",a,e,b)),"undefined"!==typeof _gaq&&(_gaq.push(["_trackEvent","Scroll Depth",a,b,1,!0]),2<arguments.length&&_gaq.push(["_trackTiming","Scroll Depth",a,e,b,100])))}function p(a,b,e){c.each(a,function(a,g){-1===c.inArray(a,f)&&b>=g&&(l("Percentage",a,e),f.push(a))})}function q(a,b,e){c.each(a,function(a,g){-1===c.inArray(g,f)&&c(g).length&&b>=c(g).offset().top&&(l("Elements",g,e),f.push(g))})}function r(a,
b){var e,c,g,d=null,f=0,k=function(){f=new Date;d=null;g=a.apply(e,c)};return function(){var h=new Date;f||(f=h);var l=b-(h-f);e=this;c=arguments;0>=l?(clearTimeout(d),d=null,f=h,g=a.apply(e,c)):d||(d=setTimeout(k,l));return g}}var t=+new Date;d=c.extend({},n,d);c(m).height()<d.minHeight||(l("Percentage","Baseline"),k.on("scroll.scrollDepth",r(function(){var a=c(m).height(),b=h.innerHeight?h.innerHeight:k.height(),b=k.scrollTop()+b,a={"25%":parseInt(.25*a,10),"50%":parseInt(.5*a,10),"75%":parseInt(.75*
a,10),"100%":a-1},e=+new Date-t;f.length>=4+d.elements.length?k.off("scroll.scrollDepth"):(d.elements&&q(d.elements,b,e),d.percentage&&p(a,b,e))},500)))}})(jQuery,window,document);jQuery.scrollDepth();</script>
<div class="etip" style="position: absolute; z-index: 9999; visibility: hidden; left: 0px; top: 0px; right: auto; bottom: auto;">
	<div class="tiptitle"></div>
	<div class="tiptext"></div>
	<div class="bottom"></div>
</div>
<div class="etip" style="position: absolute; z-index: 9999; visibility: hidden; left: 0px; top: 0px; right: auto; bottom: auto;">
	<div class="tiptitle"></div>
	<div class="tiptext"></div>
	<div class="bottom"></div>
</div>
<div id="sb-container">
	<div id="sb-overlay"></div>
	<div id="sb-wrapper">
		<div id="sb-title">
			<div id="sb-title-inner"></div>
		</div>
		<div id="sb-wrapper-inner">
			<div id="sb-body">
				<div id="sb-body-inner"></div>
				<div id="sb-loading">
					<div id="sb-loading-inner">
						<span>loading</span>
					</div>
				</div>
			</div>
		</div>
		<div id="sb-info">
			<div id="sb-info-inner">
				<div id="sb-counter"></div>
				<div id="sb-nav">
					<a id="sb-nav-close" title="Close" onclick="Shadowbox.close()"></a><a id="sb-nav-next" title="Next" onclick="Shadowbox.next()"></a><a
						id="sb-nav-play" title="Play" onclick="Shadowbox.play()"></a><a id="sb-nav-pause" title="Pause" onclick="Shadowbox.pause()"></a><a
						id="sb-nav-previous" title="Previous" onclick="Shadowbox.previous()"></a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>