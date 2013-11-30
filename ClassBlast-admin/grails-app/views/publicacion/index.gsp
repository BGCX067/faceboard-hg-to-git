
<%@ page import="classblast.admin.Publicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacion.label', default: 'Publicacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-publicacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-publicacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="publicacion.communityRelated.label" default="Community Related" /></th>
					
						<th><g:message code="publicacion.groupRelated.label" default="Group Related" /></th>
					
						<g:sortableColumn property="postBody" title="${message(code: 'publicacion.postBody.label', default: 'Post Body')}" />
					
						<g:sortableColumn property="postDate" title="${message(code: 'publicacion.postDate.label', default: 'Post Date')}" />
					
						<th><g:message code="publicacion.postOwner.label" default="Post Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${publicacionInstanceList}" status="i" var="publicacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${publicacionInstance.id}">${fieldValue(bean: publicacionInstance, field: "communityRelated")}</g:link></td>
					
						<td>${fieldValue(bean: publicacionInstance, field: "groupRelated")}</td>
					
						<td>${fieldValue(bean: publicacionInstance, field: "postBody")}</td>
					
						<td><g:formatDate date="${publicacionInstance.postDate}" /></td>
					
						<td>${fieldValue(bean: publicacionInstance, field: "postOwner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${publicacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
