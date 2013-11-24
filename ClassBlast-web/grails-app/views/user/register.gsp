<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="nologged" />
<title>Bienvenido a ClassBlast - Registro</title>
</head>
<body>
	<g:if test="${!controller.registerSuccessFul }">
		<g:form action="registerProcess" name="registerForm"
			class="registerForm">
			<g:img dir="images/icons" file="signup-48.ico" class="middle"
				class="middle leftSideForm" />
			<span>Registro</span>
			<br />
			<br />
			<g:if test="${validationErrors.size()>=1}">
				<p class="ui-error-validation"><g:img dir="images/icons" file="validerror-32.ico" class="middle"/>${validationErrors[0]}</p>
				<br />
			</g:if>
			<label for="username">Digite un nombre de usuario</label>
			<g:textField name="username" value="${username}" />
			<br />
			<br />
			<label for="password">Contraseña</label>
			<g:passwordField name="password" />
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
			<g:textField name="lastname" value="${lastname }" />
			<br />
			<br />
			<label for="email">Dirección de correo electrónico</label>
			<g:textField name="email" value="${email }" />
			<br />
			<br />
			<g:submitButton name="sbutton" value="Registro" />
		</g:form>
	</g:if>
	<g:else>
		<g:form url="[controller:'user',action:'login']" name="registerSuccesfulForm"
			class="registerSuccesfulForm">
			<g:img dir="images/icons" file="succesful-48.ico" class="middle"
				class="middle leftSideForm" />
			<p>Listo, el registro ha sido exitoso. Use su nombre de usuario y
				su contraseña para ingresar al sistema</p><br/><br/><br/><br/>
			<g:submitButton name="lbutton" value="Ir a login" />
		</g:form>
	</g:else>
</body>
</html>