
<%@ page import="classblast.web.Tema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tema.label', default: 'Tema')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tema" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="tema.sectionRelated.label" default="Section Related" /></th>
					
						<g:sortableColumn property="topicTitle" title="${message(code: 'tema.topicTitle.label', default: 'Topic Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${temaInstanceList}" status="i" var="temaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${temaInstance.id}">${fieldValue(bean: temaInstance, field: "sectionRelated")}</g:link></td>
					
						<td>${fieldValue(bean: temaInstance, field: "topicTitle")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${temaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
