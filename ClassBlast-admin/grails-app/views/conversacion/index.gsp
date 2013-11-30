
<%@ page import="classblast.admin.Conversacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conversacion.label', default: 'Conversacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conversacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conversacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="conversacion.communityRelated.label" default="Community Related" /></th>
					
						<th><g:message code="conversacion.groupRelated.label" default="Group Related" /></th>
					
						<g:sortableColumn property="talkCategory" title="${message(code: 'conversacion.talkCategory.label', default: 'Talk Category')}" />
					
						<th><g:message code="conversacion.user1Related.label" default="User1 Related" /></th>
					
						<th><g:message code="conversacion.user2Related.label" default="User2 Related" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conversacionInstanceList}" status="i" var="conversacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conversacionInstance.id}">${fieldValue(bean: conversacionInstance, field: "communityRelated")}</g:link></td>
					
						<td>${fieldValue(bean: conversacionInstance, field: "groupRelated")}</td>
					
						<td>${fieldValue(bean: conversacionInstance, field: "talkCategory")}</td>
					
						<td>${fieldValue(bean: conversacionInstance, field: "user1Related")}</td>
					
						<td>${fieldValue(bean: conversacionInstance, field: "user2Related")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conversacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
