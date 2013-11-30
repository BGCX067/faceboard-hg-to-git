
<%@ page import="classblast.admin.Mensaje" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensaje.label', default: 'Mensaje')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mensaje" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mensaje" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="mensaje.conversation.label" default="Conversation" /></th>
					
						<g:sortableColumn property="dateMessage" title="${message(code: 'mensaje.dateMessage.label', default: 'Date Message')}" />
					
						<th><g:message code="mensaje.ownerMessage.label" default="Owner Message" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mensajeInstanceList}" status="i" var="mensajeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mensajeInstance.id}">${fieldValue(bean: mensajeInstance, field: "conversation")}</g:link></td>
					
						<td><g:formatDate date="${mensajeInstance.dateMessage}" /></td>
					
						<td>${fieldValue(bean: mensajeInstance, field: "ownerMessage")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mensajeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
