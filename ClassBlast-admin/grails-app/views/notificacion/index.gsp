
<%@ page import="classblast.admin.Notificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'notificacion.label', default: 'Notificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-notificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-notificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="notificacion.communityRelated.label" default="Community Related" /></th>
					
						<th><g:message code="notificacion.groupRelated.label" default="Group Related" /></th>
					
						<th><g:message code="notificacion.meetingRelated.label" default="Meeting Related" /></th>
					
						<g:sortableColumn property="notificationDate" title="${message(code: 'notificacion.notificationDate.label', default: 'Notification Date')}" />
					
						<g:sortableColumn property="notificationType" title="${message(code: 'notificacion.notificationType.label', default: 'Notification Type')}" />
					
						<th><g:message code="notificacion.postRelated.label" default="Post Related" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${notificacionInstanceList}" status="i" var="notificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${notificacionInstance.id}">${fieldValue(bean: notificacionInstance, field: "communityRelated")}</g:link></td>
					
						<td>${fieldValue(bean: notificacionInstance, field: "groupRelated")}</td>
					
						<td>${fieldValue(bean: notificacionInstance, field: "meetingRelated")}</td>
					
						<td><g:formatDate date="${notificacionInstance.notificationDate}" /></td>
					
						<td>${fieldValue(bean: notificacionInstance, field: "notificationType")}</td>
					
						<td>${fieldValue(bean: notificacionInstance, field: "postRelated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${notificacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
