<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast</title>
</head>
<body>
	Vista para interfaz principal...
	<g:link controller="user" action="login">
	Ingresa
	</g:link>
	<g:link controller="user" action="register">
	Regístrate
	</g:link>
</body>
</html>