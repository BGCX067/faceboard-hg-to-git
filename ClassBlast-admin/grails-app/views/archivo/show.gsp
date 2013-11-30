
<%@ page import="classblast.admin.Archivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-archivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list archivo">
			
				<g:if test="${archivoInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="archivo.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="grupo" action="show" id="${archivoInstance?.course?.id}">${archivoInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.fileDescription}">
				<li class="fieldcontain">
					<span id="fileDescription-label" class="property-label"><g:message code="archivo.fileDescription.label" default="File Description" /></span>
					
						<span class="property-value" aria-labelledby="fileDescription-label"><g:fieldValue bean="${archivoInstance}" field="fileDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.fileLink}">
				<li class="fieldcontain">
					<span id="fileLink-label" class="property-label"><g:message code="archivo.fileLink.label" default="File Link" /></span>
					
						<span class="property-value" aria-labelledby="fileLink-label"><g:fieldValue bean="${archivoInstance}" field="fileLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.fileTitle}">
				<li class="fieldcontain">
					<span id="fileTitle-label" class="property-label"><g:message code="archivo.fileTitle.label" default="File Title" /></span>
					
						<span class="property-value" aria-labelledby="fileTitle-label"><g:fieldValue bean="${archivoInstance}" field="fileTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.fileType}">
				<li class="fieldcontain">
					<span id="fileType-label" class="property-label"><g:message code="archivo.fileType.label" default="File Type" /></span>
					
						<span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${archivoInstance}" field="fileType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="archivo.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${archivoInstance?.owner?.id}">${archivoInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.uploadDateOfFile}">
				<li class="fieldcontain">
					<span id="uploadDateOfFile-label" class="property-label"><g:message code="archivo.uploadDateOfFile.label" default="Upload Date Of File" /></span>
					
						<span class="property-value" aria-labelledby="uploadDateOfFile-label"><g:formatDate date="${archivoInstance?.uploadDateOfFile}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:archivoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${archivoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
