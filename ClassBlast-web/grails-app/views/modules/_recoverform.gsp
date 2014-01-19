<g:if test="${!send}">
	<g:formRemote name="formRemote1" url="['action':'sendEmailRecover']"
		update="sectionRecover">
		<p>La única forma en la que puede recuperar su cuenta de usuario
			es a través de su correo electrónico ingresado en el momento de su
			registro. Por favor ingréselo aquí y le será enviada información de
			cómo recuperar su contraseña</p>
		<g:textField name="email" />
		<g:actionSubmit value="Enviar correo"
			onclick="return validateRecoverEmail()" />
	</g:formRemote>
</g:if>
<g:elseif test="${error}">
	<p style="background-color: red; color: white">Se ha presentado un
		error. Por favor intentalo nuevamente o revisa tu conexión a internet</p>
</g:elseif>
<g:elseif test="${emailnotfound}">
	<p style="background-color: red; color: white">El correo que ingresaste no corresponde
	 a ningún usuario. Por favor inténtalo de nuevo</p>
</g:elseif>
<g:elseif test="${success}">
	<p>
		Listo! un correo ha sido enviado a
		${emailSent}
		por favor revíselo
	</p>
</g:elseif>
<g:else></g:else>
