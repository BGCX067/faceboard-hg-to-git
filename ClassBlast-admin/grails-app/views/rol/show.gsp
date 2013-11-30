
<%@ page import="classblast.admin.Rol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-rol" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-rol" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rol">
			
				<g:if test="${rolInstance?.communityRelated}">
				<li class="fieldcontain">
					<span id="communityRelated-label" class="property-label"><g:message code="rol.communityRelated.label" default="Community Related" /></span>
					
						<span class="property-value" aria-labelledby="communityRelated-label"><g:link controller="parche" action="show" id="${rolInstance?.communityRelated?.id}">${rolInstance?.communityRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolInstance?.groupRelated}">
				<li class="fieldcontain">
					<span id="groupRelated-label" class="property-label"><g:message code="rol.groupRelated.label" default="Group Related" /></span>
					
						<span class="property-value" aria-labelledby="groupRelated-label"><g:link controller="grupo" action="show" id="${rolInstance?.groupRelated?.id}">${rolInstance?.groupRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolInstance?.meetingRelated}">
				<li class="fieldcontain">
					<span id="meetingRelated-label" class="property-label"><g:message code="rol.meetingRelated.label" default="Meeting Related" /></span>
					
						<span class="property-value" aria-labelledby="meetingRelated-label"><g:link controller="mesaredonda" action="show" id="${rolInstance?.meetingRelated?.id}">${rolInstance?.meetingRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolInstance?.rolOwner}">
				<li class="fieldcontain">
					<span id="rolOwner-label" class="property-label"><g:message code="rol.rolOwner.label" default="Rol Owner" /></span>
					
						<span class="property-value" aria-labelledby="rolOwner-label"><g:link controller="user" action="show" id="${rolInstance?.rolOwner?.id}">${rolInstance?.rolOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${rolInstance?.rolType}">
				<li class="fieldcontain">
					<span id="rolType-label" class="property-label"><g:message code="rol.rolType.label" default="Rol Type" /></span>
					
						<span class="property-value" aria-labelledby="rolType-label"><g:link controller="tipoRol" action="show" id="${rolInstance?.rolType?.id}">${rolInstance?.rolType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:rolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${rolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
