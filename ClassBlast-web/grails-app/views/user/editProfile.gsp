<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="logged" />
<title>Bienvenido a ClassBlast - Editar Perfil</title>
</head>
<body>
	<g:if test="${!controller.editSuccessFul }">
		<g:form action="editProcess" name="editForm"
			class="editForm">
			<g:hiddenField name="userid" value="${userid}"/>
			<g:img dir="images/icons" file="signup-48.ico" class="middle"
				class="middle leftSideForm" />
			<span>Editar</span>
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
			<g:submitButton name="sbutton" value="Editar" />
		</g:form>
	</g:if>
	<g:else>
				<g:img dir="images/icons" file="succesful-48.ico" class="middle"
				class="middle leftSideForm" />
			<p>Listo, la edicion ha sido exitosa.</p><br/><br/><br/><br/>
			<g:submitButton name="lbutton" value="Ir a login" />
	</g:else>
</body>
</html>