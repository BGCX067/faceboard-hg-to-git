
<%@ page import="classblast.admin.Participacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participacion.label', default: 'Participacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-participacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-participacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="beginningDate" title="${message(code: 'participacion.beginningDate.label', default: 'Beginning Date')}" />
					
						<g:sortableColumn property="body" title="${message(code: 'participacion.body.label', default: 'Body')}" />
					
						<g:sortableColumn property="endingDate" title="${message(code: 'participacion.endingDate.label', default: 'Ending Date')}" />
					
						<g:sortableColumn property="grade" title="${message(code: 'participacion.grade.label', default: 'Grade')}" />
					
						<g:sortableColumn property="image1" title="${message(code: 'participacion.image1.label', default: 'Image1')}" />
					
						<g:sortableColumn property="image2" title="${message(code: 'participacion.image2.label', default: 'Image2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${participacionInstanceList}" status="i" var="participacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${participacionInstance.id}">${fieldValue(bean: participacionInstance, field: "beginningDate")}</g:link></td>
					
						<td>${fieldValue(bean: participacionInstance, field: "body")}</td>
					
						<td><g:formatDate date="${participacionInstance.endingDate}" /></td>
					
						<td>${fieldValue(bean: participacionInstance, field: "grade")}</td>
					
						<td>${fieldValue(bean: participacionInstance, field: "image1")}</td>
					
						<td>${fieldValue(bean: participacionInstance, field: "image2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${participacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
