
<%@ page import="classblast.admin.Rol" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-rol" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-rol" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="rol.communityRelated.label" default="Community Related" /></th>
					
						<th><g:message code="rol.groupRelated.label" default="Group Related" /></th>
					
						<th><g:message code="rol.meetingRelated.label" default="Meeting Related" /></th>
					
						<th><g:message code="rol.rolOwner.label" default="Rol Owner" /></th>
					
						<th><g:message code="rol.rolType.label" default="Rol Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rolInstanceList}" status="i" var="rolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rolInstance.id}">${fieldValue(bean: rolInstance, field: "communityRelated")}</g:link></td>
					
						<td>${fieldValue(bean: rolInstance, field: "groupRelated")}</td>
					
						<td>${fieldValue(bean: rolInstance, field: "meetingRelated")}</td>
					
						<td>${fieldValue(bean: rolInstance, field: "rolOwner")}</td>
					
						<td>${fieldValue(bean: rolInstance, field: "rolType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${rolInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
