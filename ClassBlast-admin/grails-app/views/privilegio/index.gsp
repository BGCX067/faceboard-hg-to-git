
<%@ page import="classblast.admin.Privilegio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'privilegio.label', default: 'Privilegio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-privilegio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-privilegio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="privilegeDescription" title="${message(code: 'privilegio.privilegeDescription.label', default: 'Privilege Description')}" />
					
						<g:sortableColumn property="privilegeValue" title="${message(code: 'privilegio.privilegeValue.label', default: 'Privilege Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${privilegioInstanceList}" status="i" var="privilegioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${privilegioInstance.id}">${fieldValue(bean: privilegioInstance, field: "privilegeDescription")}</g:link></td>
					
						<td><g:formatBoolean boolean="${privilegioInstance.privilegeValue}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${privilegioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
