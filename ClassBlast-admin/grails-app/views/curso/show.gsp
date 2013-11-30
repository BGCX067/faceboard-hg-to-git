
<%@ page import="classblast.admin.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-curso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-curso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list curso">
			
				<g:if test="${cursoInstance?.bookList}">
				<li class="fieldcontain">
					<span id="bookList-label" class="property-label"><g:message code="curso.bookList.label" default="Book List" /></span>
					
						<g:each in="${cursoInstance.bookList}" var="b">
						<span class="property-value" aria-labelledby="bookList-label"><g:link controller="cuaderno" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.careerList}">
				<li class="fieldcontain">
					<span id="careerList-label" class="property-label"><g:message code="curso.careerList.label" default="Career List" /></span>
					
						<g:each in="${cursoInstance.careerList}" var="c">
						<span class="property-value" aria-labelledby="careerList-label"><g:link controller="carrera" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.courseName}">
				<li class="fieldcontain">
					<span id="courseName-label" class="property-label"><g:message code="curso.courseName.label" default="Course Name" /></span>
					
						<span class="property-value" aria-labelledby="courseName-label"><g:fieldValue bean="${cursoInstance}" field="courseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.facultyList}">
				<li class="fieldcontain">
					<span id="facultyList-label" class="property-label"><g:message code="curso.facultyList.label" default="Faculty List" /></span>
					
						<g:each in="${cursoInstance.facultyList}" var="f">
						<span class="property-value" aria-labelledby="facultyList-label"><g:link controller="facultad" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.groupList}">
				<li class="fieldcontain">
					<span id="groupList-label" class="property-label"><g:message code="curso.groupList.label" default="Group List" /></span>
					
						<g:each in="${cursoInstance.groupList}" var="g">
						<span class="property-value" aria-labelledby="groupList-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.semesterList}">
				<li class="fieldcontain">
					<span id="semesterList-label" class="property-label"><g:message code="curso.semesterList.label" default="Semester List" /></span>
					
						<g:each in="${cursoInstance.semesterList}" var="s">
						<span class="property-value" aria-labelledby="semesterList-label"><g:link controller="semestre" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cursoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cursoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
