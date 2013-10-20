<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast - Registro</title>
</head>
<body>
	${parameterList }
	<g:form action="registerProcess" name="registerForm" class="registerForm">
		<g:img dir="images/icons" file="signup-48.ico" class="middle"
			class="middle leftSideForm" />
		<span>Registro</span>
		<br />
		<br />
		<label for="username">Digite un nombre de usuario</label>
		<g:textField name="username" value="${username}"/>
		<br />
		<br />
		<label for="password">Contraseña</label>
		<g:passwordField name="password"/>
		<br />
		<br />
		<label for="repassword">Digítela nuevamente</label>
		<g:passwordField name="repassword" />
		<br />
		<br />
		<label for="firstname">Nombre</label>
		<g:textField name="firstname" value="${firstname}" />
		<br />
		<br />
		<label for="lastname">Apellido</label>
		<g:textField name="lastname" value="${lastname }"/>
		<br />
		<br />
		<label for="email">Dirección de correo electrónico</label>
		<g:textField name="email" value="${email }"/>
		<br />
		<br />
		<g:submitButton name="sbutton" value="Registro" />
	</g:form>
</body>
</html>