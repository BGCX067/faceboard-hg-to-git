
<%@ page import="classblast.admin.Parche" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parche.label', default: 'Parche')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parche" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parche" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="communityDescription" title="${message(code: 'parche.communityDescription.label', default: 'Community Description')}" />
					
						<g:sortableColumn property="communityName" title="${message(code: 'parche.communityName.label', default: 'Community Name')}" />
					
						<g:sortableColumn property="communityType" title="${message(code: 'parche.communityType.label', default: 'Community Type')}" />
					
						<th><g:message code="parche.courseRelated.label" default="Course Related" /></th>
					
						<g:sortableColumn property="creationDate" title="${message(code: 'parche.creationDate.label', default: 'Creation Date')}" />
					
						<th><g:message code="parche.semesterRelated.label" default="Semester Related" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parcheInstanceList}" status="i" var="parcheInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parcheInstance.id}">${fieldValue(bean: parcheInstance, field: "communityDescription")}</g:link></td>
					
						<td>${fieldValue(bean: parcheInstance, field: "communityName")}</td>
					
						<td>${fieldValue(bean: parcheInstance, field: "communityType")}</td>
					
						<td>${fieldValue(bean: parcheInstance, field: "courseRelated")}</td>
					
						<td><g:formatDate date="${parcheInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: parcheInstance, field: "semesterRelated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parcheInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
