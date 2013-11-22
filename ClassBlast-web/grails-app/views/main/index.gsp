<!DOCTYPE html>
<html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast</title>
</head>
<body>
	<table class="index">
		<tr>
			<td colspan="4" id="main" class="index">
			<g:img dir="images" file="classblastLogo.png" class="middle" />
			</td>
		</tr>
		<tr>
			<td id="footer" class="index">
				<h3>Explora</h3>
			</td>
			<td id="footer" class="index">
				<h3>Acerca</h3>
			</td>
			<td id="footer" class="index">
				<g:link controller="user" action="login">
				<h3>Ingresa</h3>
				</g:link>
			</td>
			<td id="footer" class="index">
				<g:link controller="user" action="register">
				<h3>Regístrate</h3>
				</g:link>
			</td>
		</tr>
	</table>
</body>
</html>