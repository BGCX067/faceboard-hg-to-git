<%@ page import="classblast.web.Seccion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seccion.label', default: 'Seccion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-seccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="inicio"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-seccion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list seccion">
			
				<g:if test="${seccionInstance?.noteList}">
				<li class="fieldcontain">
					<span id="noteList-label" class="property-label"><g:message code="seccion.noteList.label" default="Note List" /></span>
					
						<g:each in="${seccionInstance.noteList}" var="n">
						<span class="property-value" aria-labelledby="noteList-label"><g:link controller="apunte" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${seccionInstance?.sectionName}">
				<li class="fieldcontain">
					<span id="sectionName-label" class="property-label"><g:message code="seccion.sectionName.label" default="Section Name" /></span>
					
						<span class="property-value" aria-labelledby="sectionName-label"><g:fieldValue bean="${seccionInstance}" field="sectionName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:seccionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${seccionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>