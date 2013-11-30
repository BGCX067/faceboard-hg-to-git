
<%@ page import="classblast.admin.Archivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-archivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="archivo.course.label" default="Course" /></th>
					
						<g:sortableColumn property="fileDescription" title="${message(code: 'archivo.fileDescription.label', default: 'File Description')}" />
					
						<g:sortableColumn property="fileLink" title="${message(code: 'archivo.fileLink.label', default: 'File Link')}" />
					
						<g:sortableColumn property="fileTitle" title="${message(code: 'archivo.fileTitle.label', default: 'File Title')}" />
					
						<g:sortableColumn property="fileType" title="${message(code: 'archivo.fileType.label', default: 'File Type')}" />
					
						<th><g:message code="archivo.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${archivoInstanceList}" status="i" var="archivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${archivoInstance.id}">${fieldValue(bean: archivoInstance, field: "course")}</g:link></td>
					
						<td>${fieldValue(bean: archivoInstance, field: "fileDescription")}</td>
					
						<td>${fieldValue(bean: archivoInstance, field: "fileLink")}</td>
					
						<td>${fieldValue(bean: archivoInstance, field: "fileTitle")}</td>
					
						<td>${fieldValue(bean: archivoInstance, field: "fileType")}</td>
					
						<td>${fieldValue(bean: archivoInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${archivoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
