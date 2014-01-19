	Nombre
	Login
	Correo
	Rol actual
	<br/><br/>
	<g:if test="${userList.size()==0}">
		No hay resultados que mostrar.
	</g:if>
	<g:each in="${userList}" var="userItem">
		<g:render template="/modules/userspanel/usersrecord" model="${['userItem':userItem]}"/>
	</g:each>