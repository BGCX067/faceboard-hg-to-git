
<%@ page import="classblast.admin.Cuaderno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cuaderno.label', default: 'Cuaderno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cuaderno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cuaderno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cuaderno">
			
				<g:if test="${cuadernoInstance?.bookName}">
				<li class="fieldcontain">
					<span id="bookName-label" class="property-label"><g:message code="cuaderno.bookName.label" default="Book Name" /></span>
					
						<span class="property-value" aria-labelledby="bookName-label"><g:fieldValue bean="${cuadernoInstance}" field="bookName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cuadernoInstance?.bookOwner}">
				<li class="fieldcontain">
					<span id="bookOwner-label" class="property-label"><g:message code="cuaderno.bookOwner.label" default="Book Owner" /></span>
					
						<span class="property-value" aria-labelledby="bookOwner-label"><g:link controller="user" action="show" id="${cuadernoInstance?.bookOwner?.id}">${cuadernoInstance?.bookOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cuadernoInstance?.courseRelated}">
				<li class="fieldcontain">
					<span id="courseRelated-label" class="property-label"><g:message code="cuaderno.courseRelated.label" default="Course Related" /></span>
					
						<span class="property-value" aria-labelledby="courseRelated-label"><g:link controller="curso" action="show" id="${cuadernoInstance?.courseRelated?.id}">${cuadernoInstance?.courseRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cuadernoInstance?.sectionList}">
				<li class="fieldcontain">
					<span id="sectionList-label" class="property-label"><g:message code="cuaderno.sectionList.label" default="Section List" /></span>
					
						<g:each in="${cuadernoInstance.sectionList}" var="s">
						<span class="property-value" aria-labelledby="sectionList-label"><g:link controller="seccion" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cuadernoInstance?.semesterRelated}">
				<li class="fieldcontain">
					<span id="semesterRelated-label" class="property-label"><g:message code="cuaderno.semesterRelated.label" default="Semester Related" /></span>
					
						<span class="property-value" aria-labelledby="semesterRelated-label"><g:link controller="semestre" action="show" id="${cuadernoInstance?.semesterRelated?.id}">${cuadernoInstance?.semesterRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cuadernoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cuadernoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
