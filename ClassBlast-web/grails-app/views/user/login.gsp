<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast - Login</title>
</head>
<body>
	<g:form action="login" name="loginForm" class="loginForm">
		<g:hasErrors bean="${controller}">
			<ul>
				<g:eachError var="err" bean="${controller}">
					<li>
						${err}
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:img dir="images/icons" file="login-48.ico" class="middle"
			class="middle leftSideForm" />
		<span>Login</span>
		<br />
		<br />
		<label for="login">Usuario</label>
		<g:textField name="login" />
		<br />
		<br />
		<label for="password">Contraseña</label>
		<g:passwordField name="password"/>
		<br />
		<br />
		<g:link controller="user" action="recover">No recuerdo la contraseña</g:link>
		<g:submitButton name="sbutton" value="Ingresar" />
	</g:form>
</body>
</html>