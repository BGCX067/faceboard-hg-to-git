
<%@ page import="classblast.admin.Mensaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensaje.label', default: 'Mensaje')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mensaje" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mensaje" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mensaje">
			
				<g:if test="${mensajeInstance?.conversation}">
				<li class="fieldcontain">
					<span id="conversation-label" class="property-label"><g:message code="mensaje.conversation.label" default="Conversation" /></span>
					
						<span class="property-value" aria-labelledby="conversation-label"><g:link controller="conversacion" action="show" id="${mensajeInstance?.conversation?.id}">${mensajeInstance?.conversation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensajeInstance?.dateMessage}">
				<li class="fieldcontain">
					<span id="dateMessage-label" class="property-label"><g:message code="mensaje.dateMessage.label" default="Date Message" /></span>
					
						<span class="property-value" aria-labelledby="dateMessage-label"><g:formatDate date="${mensajeInstance?.dateMessage}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensajeInstance?.ownerMessage}">
				<li class="fieldcontain">
					<span id="ownerMessage-label" class="property-label"><g:message code="mensaje.ownerMessage.label" default="Owner Message" /></span>
					
						<span class="property-value" aria-labelledby="ownerMessage-label"><g:link controller="user" action="show" id="${mensajeInstance?.ownerMessage?.id}">${mensajeInstance?.ownerMessage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:mensajeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mensajeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
