
<%@ page import="classblast.admin.Notificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'notificacion.label', default: 'Notificacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-notificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-notificacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list notificacion">
			
				<g:if test="${notificacionInstance?.communityRelated}">
				<li class="fieldcontain">
					<span id="communityRelated-label" class="property-label"><g:message code="notificacion.communityRelated.label" default="Community Related" /></span>
					
						<span class="property-value" aria-labelledby="communityRelated-label"><g:link controller="parche" action="show" id="${notificacionInstance?.communityRelated?.id}">${notificacionInstance?.communityRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.groupRelated}">
				<li class="fieldcontain">
					<span id="groupRelated-label" class="property-label"><g:message code="notificacion.groupRelated.label" default="Group Related" /></span>
					
						<span class="property-value" aria-labelledby="groupRelated-label"><g:link controller="grupo" action="show" id="${notificacionInstance?.groupRelated?.id}">${notificacionInstance?.groupRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.meetingRelated}">
				<li class="fieldcontain">
					<span id="meetingRelated-label" class="property-label"><g:message code="notificacion.meetingRelated.label" default="Meeting Related" /></span>
					
						<span class="property-value" aria-labelledby="meetingRelated-label"><g:link controller="mesaredonda" action="show" id="${notificacionInstance?.meetingRelated?.id}">${notificacionInstance?.meetingRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.notificationDate}">
				<li class="fieldcontain">
					<span id="notificationDate-label" class="property-label"><g:message code="notificacion.notificationDate.label" default="Notification Date" /></span>
					
						<span class="property-value" aria-labelledby="notificationDate-label"><g:formatDate date="${notificacionInstance?.notificationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.notificationType}">
				<li class="fieldcontain">
					<span id="notificationType-label" class="property-label"><g:message code="notificacion.notificationType.label" default="Notification Type" /></span>
					
						<span class="property-value" aria-labelledby="notificationType-label"><g:fieldValue bean="${notificacionInstance}" field="notificationType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.postRelated}">
				<li class="fieldcontain">
					<span id="postRelated-label" class="property-label"><g:message code="notificacion.postRelated.label" default="Post Related" /></span>
					
						<span class="property-value" aria-labelledby="postRelated-label"><g:link controller="publicacion" action="show" id="${notificacionInstance?.postRelated?.id}">${notificacionInstance?.postRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.talkRelated}">
				<li class="fieldcontain">
					<span id="talkRelated-label" class="property-label"><g:message code="notificacion.talkRelated.label" default="Talk Related" /></span>
					
						<span class="property-value" aria-labelledby="talkRelated-label"><g:link controller="conversacion" action="show" id="${notificacionInstance?.talkRelated?.id}">${notificacionInstance?.talkRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificacionInstance?.userRelated}">
				<li class="fieldcontain">
					<span id="userRelated-label" class="property-label"><g:message code="notificacion.userRelated.label" default="User Related" /></span>
					
						<span class="property-value" aria-labelledby="userRelated-label"><g:link controller="user" action="show" id="${notificacionInstance?.userRelated?.id}">${notificacionInstance?.userRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:notificacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${notificacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
