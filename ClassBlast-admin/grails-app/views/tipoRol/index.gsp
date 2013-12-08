
<%@ page import="classblast.admin.TipoRol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoRol.label', default: 'TipoRol')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoRol" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoRol" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="rolDescription" title="${message(code: 'tipoRol.rolDescription.label', default: 'Rol Description')}" />
					
						<g:sortableColumn property="rolType" title="${message(code: 'tipoRol.rolType.label', default: 'Rol Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoRolInstanceList}" status="i" var="tipoRolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoRolInstance.id}">${fieldValue(bean: tipoRolInstance, field: "rolDescription")}</g:link></td>
					
						<td>${fieldValue(bean: tipoRolInstance, field: "rolType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoRolInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
