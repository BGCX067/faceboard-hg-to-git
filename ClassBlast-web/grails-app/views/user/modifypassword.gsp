<!DOCTYPE html>
<head>
<meta name="layout" content="nologged" />
<title>Bienvenido a ClassBlast - Recuperación de contraseña</title>
</head>
<body>
	<script type="text/javascript">
		function validateThis() {
			var c = $("input#contrasenia").val();
			var rc = $("input#repcontrasenia").val();
			if (c != rc) {
				$(".p_error").show();
				return false;
			} else {
				$(".p_error").hide();
			}
		}
	</script>
	<h2>Modifica tu contraseña</h2>
	<h5>Login de usuario: ${userobj.login }, Nombre: ${userobj.firstName} ${userobj.lastName}</h5>
	<g:form action="modifyPasswordProcess" name="modifyPasswordForm"
			class="modifyPasswordForm">
		<p class="p_error"
			style="color: white; background-color: red; display: none">Las
			contraseñas no coinciden</p>
		<label for="contrasenia">Digite la nueva contraseña</label>
		<g:passwordField name="contrasenia" />
		<br />
		<label for="contrasenia">Digítela nuevamente</label>
		<g:passwordField name="repcontrasenia" />
		<br />
		<g:hiddenField name="userid" value="${userobj.id}" />
		<g:submitButton name="sbutton1" value="Enviar" onclick="return validateThis()" />
	</g:form>
	


</body>
</html>