<g:if test="${requestList.size()==0}">
			No hay resultados que mostrar.
		</g:if>
<g:each in="${requestList}" var="requestItem">
	<g:render template="/modules/userspanel/requestsrecord"
		model="${['requestItem':requestItem]}" />
	<br/>
</g:each>