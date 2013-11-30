
<%@ page import="classblast.admin.TipoRol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoRol.label', default: 'TipoRol')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoRol" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoRol" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoRol">
			
				<g:if test="${tipoRolInstance?.privilegeList}">
				<li class="fieldcontain">
					<span id="privilegeList-label" class="property-label"><g:message code="tipoRol.privilegeList.label" default="Privilege List" /></span>
					
						<g:each in="${tipoRolInstance.privilegeList}" var="p">
						<span class="property-value" aria-labelledby="privilegeList-label"><g:link controller="privilegio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tipoRolInstance?.rolList}">
				<li class="fieldcontain">
					<span id="rolList-label" class="property-label"><g:message code="tipoRol.rolList.label" default="Rol List" /></span>
					
						<g:each in="${tipoRolInstance.rolList}" var="r">
						<span class="property-value" aria-labelledby="rolList-label"><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tipoRolInstance?.rolType}">
				<li class="fieldcontain">
					<span id="rolType-label" class="property-label"><g:message code="tipoRol.rolType.label" default="Rol Type" /></span>
					
						<span class="property-value" aria-labelledby="rolType-label"><g:fieldValue bean="${tipoRolInstance}" field="rolType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipoRolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipoRolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
