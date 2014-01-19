<g:if test="${userList.size()==0}">
	${messageNotFound}
</g:if>
<g:each in="${userList}" var="userItem">
	<g:render template="/modules/userspanel/newusersrecord"
		model="${['userItem':userItem]}" />
	<br/>
</g:each>