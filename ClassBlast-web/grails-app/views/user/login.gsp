<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast - Login</title>
</head>
<body>
	<g:form action="loginProcess" name="loginForm" class="loginForm">
		<g:img dir="images/icons" file="login-48.ico" class="middle"
			class="middle leftSideForm" />
		<span>Login</span>
		<br />
		<br />
		<g:if test="${validationErrors.size()>=1}">
			<p class="ui-error-validation">
				<g:img dir="images/icons" file="validerror-32.ico" class="middle" />
				${validationErrors[0]}
			</p>
			<br />
		</g:if>
		<label for="login">Usuario</label>
		<g:textField name="login" value="${username}"/>
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