
<%@ page import="classblast.admin.Privilegio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'privilegio.label', default: 'Privilegio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-privilegio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-privilegio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list privilegio">
			
				<g:if test="${privilegioInstance?.privilegeDescription}">
				<li class="fieldcontain">
					<span id="privilegeDescription-label" class="property-label"><g:message code="privilegio.privilegeDescription.label" default="Privilege Description" /></span>
					
						<span class="property-value" aria-labelledby="privilegeDescription-label"><g:fieldValue bean="${privilegioInstance}" field="privilegeDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${privilegioInstance?.privilegeValue}">
				<li class="fieldcontain">
					<span id="privilegeValue-label" class="property-label"><g:message code="privilegio.privilegeValue.label" default="Privilege Value" /></span>
					
						<span class="property-value" aria-labelledby="privilegeValue-label"><g:formatBoolean boolean="${privilegioInstance?.privilegeValue}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${privilegioInstance?.rolList}">
				<li class="fieldcontain">
					<span id="rolList-label" class="property-label"><g:message code="privilegio.rolList.label" default="Rol List" /></span>
					
						<g:each in="${privilegioInstance.rolList}" var="r">
						<span class="property-value" aria-labelledby="rolList-label"><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:privilegioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${privilegioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
