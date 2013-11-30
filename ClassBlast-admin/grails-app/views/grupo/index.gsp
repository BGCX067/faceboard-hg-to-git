
<%@ page import="classblast.admin.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-grupo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-grupo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="grupo.courseRelated.label" default="Course Related" /></th>
					
						<th><g:message code="grupo.courseSection.label" default="Course Section" /></th>
					
						<g:sortableColumn property="creationDate" title="${message(code: 'grupo.creationDate.label', default: 'Creation Date')}" />
					
						<g:sortableColumn property="groupDescription" title="${message(code: 'grupo.groupDescription.label', default: 'Group Description')}" />
					
						<g:sortableColumn property="groupName" title="${message(code: 'grupo.groupName.label', default: 'Group Name')}" />
					
						<g:sortableColumn property="groupState" title="${message(code: 'grupo.groupState.label', default: 'Group State')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${grupoInstanceList}" status="i" var="grupoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${grupoInstance.id}">${fieldValue(bean: grupoInstance, field: "courseRelated")}</g:link></td>
					
						<td>${fieldValue(bean: grupoInstance, field: "courseSection")}</td>
					
						<td><g:formatDate date="${grupoInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: grupoInstance, field: "groupDescription")}</td>
					
						<td>${fieldValue(bean: grupoInstance, field: "groupName")}</td>
					
						<td>${fieldValue(bean: grupoInstance, field: "groupState")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${grupoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
