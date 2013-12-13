<g:link url="#" onclick="hide('#people_result_list')">cerrar</g:link>
<h4>Resultados de la busqueda</h4>
<g:if test="${resultList.size()>0}">
	<g:each in="${resultList}" var="people_item">
		<g:link controller="profile" params="[profileid:people_item.id]">
		${people_item.firstName} ${people_item.lastName} </g:link>
	</g:each>
</g:if>
<g:else>
	<p>No existe ningúna persona con ese nombre o correo electrónico.</p>
</g:else>