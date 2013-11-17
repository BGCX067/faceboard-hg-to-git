
<%@ page import="classblast.web.Apunte" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apunte.label', default: 'Apunte')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-apunte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-apunte" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list apunte">
			
				<g:if test="${apunteInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="apunte.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:link controller="seccion" action="mostrar" id="${apunteInstance?.section?.id}">${apunteInstance?.section?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${apunteInstance?.contenidoHtml}">
				<li class="fieldcontain">
					<span id="contenidoHtml-label" class="property-label"><g:message code="apunte.contenidoHtml.label" default="Contenido Html" /></span>
					
						<span class="property-value" aria-labelledby="contenidoHtml-label"><g:fieldValue bean="${apunteInstance}" field="contenidoHtml"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apunteInstance?.fechaApunte}">
				<li class="fieldcontain">
					<span id="fechaApunte-label" class="property-label"><g:message code="apunte.fechaApunte.label" default="Fecha Apunte" /></span>
					
						<span class="property-value" aria-labelledby="fechaApunte-label"><g:formatDate date="${apunteInstance?.fechaApunte}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${apunteInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="apunte.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="tema" action="show" id="${apunteInstance?.topic?.id}">${apunteInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:apunteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${apunteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
