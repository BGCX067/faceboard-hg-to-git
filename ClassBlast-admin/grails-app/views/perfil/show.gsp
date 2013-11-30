
<%@ page import="classblast.admin.Perfil" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-perfil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-perfil" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list perfil">
			
				<g:if test="${perfilInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="perfil.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${perfilInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.genericRol}">
				<li class="fieldcontain">
					<span id="genericRol-label" class="property-label"><g:message code="perfil.genericRol.label" default="Generic Rol" /></span>
					
						<span class="property-value" aria-labelledby="genericRol-label"><g:link controller="rol" action="show" id="${perfilInstance?.genericRol?.id}">${perfilInstance?.genericRol?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.profileDescription}">
				<li class="fieldcontain">
					<span id="profileDescription-label" class="property-label"><g:message code="perfil.profileDescription.label" default="Profile Description" /></span>
					
						<span class="property-value" aria-labelledby="profileDescription-label"><g:fieldValue bean="${perfilInstance}" field="profileDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.profileOwner}">
				<li class="fieldcontain">
					<span id="profileOwner-label" class="property-label"><g:message code="perfil.profileOwner.label" default="Profile Owner" /></span>
					
						<span class="property-value" aria-labelledby="profileOwner-label"><g:link controller="user" action="show" id="${perfilInstance?.profileOwner?.id}">${perfilInstance?.profileOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="perfil.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${perfilInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:perfilInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${perfilInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
