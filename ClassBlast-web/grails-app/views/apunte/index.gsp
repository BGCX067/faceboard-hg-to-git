
<%@ page import="classblast.web.Apunte" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apunte.label', default: 'Apunte')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-apunte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-apunte" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="apunte.section.label" default="Section" /></th>
					
						<g:sortableColumn property="contenidoHtml" title="${message(code: 'apunte.contenidoHtml.label', default: 'Contenido Html')}" />
					
						<g:sortableColumn property="fechaApunte" title="${message(code: 'apunte.fechaApunte.label', default: 'Fecha Apunte')}" />
					
						<th><g:message code="apunte.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${apunteInstanceList}" status="i" var="apunteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${apunteInstance.id}">${fieldValue(bean: apunteInstance, field: "section")}</g:link></td>
					
						<td>${fieldValue(bean: apunteInstance, field: "contenidoHtml")}</td>
					
						<td><g:formatDate date="${apunteInstance.fechaApunte}" /></td>
					
						<td>${fieldValue(bean: apunteInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${apunteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
