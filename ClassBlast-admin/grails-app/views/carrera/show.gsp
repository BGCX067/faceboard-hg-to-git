
<%@ page import="classblast.admin.Carrera" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrera.label', default: 'Carrera')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carrera" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carrera" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carrera">
			
				<g:if test="${carreraInstance?.careerName}">
				<li class="fieldcontain">
					<span id="careerName-label" class="property-label"><g:message code="carrera.careerName.label" default="Career Name" /></span>
					
						<span class="property-value" aria-labelledby="careerName-label"><g:fieldValue bean="${carreraInstance}" field="careerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.courseList}">
				<li class="fieldcontain">
					<span id="courseList-label" class="property-label"><g:message code="carrera.courseList.label" default="Course List" /></span>
					
						<g:each in="${carreraInstance.courseList}" var="c">
						<span class="property-value" aria-labelledby="courseList-label"><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.faculty}">
				<li class="fieldcontain">
					<span id="faculty-label" class="property-label"><g:message code="carrera.faculty.label" default="Faculty" /></span>
					
						<span class="property-value" aria-labelledby="faculty-label"><g:link controller="facultad" action="show" id="${carreraInstance?.faculty?.id}">${carreraInstance?.faculty?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carreraInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carreraInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
