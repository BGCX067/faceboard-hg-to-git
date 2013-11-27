<!DOCTYPE html>
<html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="${controller.templateToRender}" />
<title>Bienvenido a ClassBlast</title>
</head>
<body>
	<div id="container">
		<div id="menu">
			<h3>Explora</h3>
		</div>
		<div id="menu">
			<g:link controller="user" action="about">
			<h3>Acerca</h3>	
			</g:link>	
		</div>
		<div id="menu">
			<g:link controller="user" action="login">
			<h3>Ingresa</h3>	
			</g:link>	
		</div>
		<div id="menu">
			<g:link controller="user" action="register">
			<h3>Regístrate</h3>
			</g:link>
		</div>
		<div id="main">
			<g:img dir="images" file="classblastLogo.png" class="middle" /> <!-- centrar la imagen -->
		</div>
	</div>
</body>
</html>