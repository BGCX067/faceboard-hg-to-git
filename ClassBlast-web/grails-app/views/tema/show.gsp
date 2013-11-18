
<%@ page import="classblast.web.Tema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tema.label', default: 'Tema')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tema" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tema">
			
				<g:if test="${temaInstance?.sectionRelated}">
				<li class="fieldcontain">
					<span id="sectionRelated-label" class="property-label"><g:message code="tema.sectionRelated.label" default="Section Related" /></span>
					
						<span class="property-value" aria-labelledby="sectionRelated-label"><g:link controller="seccion" action="mostrar" id="${temaInstance?.sectionRelated?.id}">${temaInstance?.sectionRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${temaInstance?.topicTitle}">
				<li class="fieldcontain">
					<span id="topicTitle-label" class="property-label"><g:message code="tema.topicTitle.label" default="Topic Title" /></span>
					
						<span class="property-value" aria-labelledby="topicTitle-label"><g:fieldValue bean="${temaInstance}" field="topicTitle"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:temaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${temaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
