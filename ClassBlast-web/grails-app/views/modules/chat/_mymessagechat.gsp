<g:if test="${myerrormessage!='no'}">
	<span class='myerrormessageui'> ${myerrormessage}
	</span>
	<br />
</g:if>
<g:if test="${mymessagelist.size()==0}">
No hay mensajes qué mostrar
</g:if>
<g:else>
	<g:each in="${mymessagelist}" var="messageitem">
		<g:link controller="profile">
			${messageitem.ownerMessage.firstName}(${messageitem.ownerMessage.login })
		</g:link>
		${messageitem.messageBody}
		: <span style="color:gray"> ${messageitem.formatDate()}</span>
		<br />
		<br />
	</g:each>
</g:else>
