
<%@ page import="classblast.admin.Conversacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conversacion.label', default: 'Conversacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conversacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conversacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conversacion">
			
				<g:if test="${conversacionInstance?.communityRelated}">
				<li class="fieldcontain">
					<span id="communityRelated-label" class="property-label"><g:message code="conversacion.communityRelated.label" default="Community Related" /></span>
					
						<span class="property-value" aria-labelledby="communityRelated-label"><g:link controller="parche" action="show" id="${conversacionInstance?.communityRelated?.id}">${conversacionInstance?.communityRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conversacionInstance?.groupRelated}">
				<li class="fieldcontain">
					<span id="groupRelated-label" class="property-label"><g:message code="conversacion.groupRelated.label" default="Group Related" /></span>
					
						<span class="property-value" aria-labelledby="groupRelated-label"><g:link controller="grupo" action="show" id="${conversacionInstance?.groupRelated?.id}">${conversacionInstance?.groupRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conversacionInstance?.messageList}">
				<li class="fieldcontain">
					<span id="messageList-label" class="property-label"><g:message code="conversacion.messageList.label" default="Message List" /></span>
					
						<g:each in="${conversacionInstance.messageList}" var="m">
						<span class="property-value" aria-labelledby="messageList-label"><g:link controller="mensaje" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conversacionInstance?.talkCategory}">
				<li class="fieldcontain">
					<span id="talkCategory-label" class="property-label"><g:message code="conversacion.talkCategory.label" default="Talk Category" /></span>
					
						<span class="property-value" aria-labelledby="talkCategory-label"><g:fieldValue bean="${conversacionInstance}" field="talkCategory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conversacionInstance?.user1Related}">
				<li class="fieldcontain">
					<span id="user1Related-label" class="property-label"><g:message code="conversacion.user1Related.label" default="User1 Related" /></span>
					
						<span class="property-value" aria-labelledby="user1Related-label"><g:link controller="user" action="show" id="${conversacionInstance?.user1Related?.id}">${conversacionInstance?.user1Related?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conversacionInstance?.user2Related}">
				<li class="fieldcontain">
					<span id="user2Related-label" class="property-label"><g:message code="conversacion.user2Related.label" default="User2 Related" /></span>
					
						<span class="property-value" aria-labelledby="user2Related-label"><g:link controller="user" action="show" id="${conversacionInstance?.user2Related?.id}">${conversacionInstance?.user2Related?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conversacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conversacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
