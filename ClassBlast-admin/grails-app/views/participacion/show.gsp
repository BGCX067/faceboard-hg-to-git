
<%@ page import="classblast.admin.Participacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participacion.label', default: 'Participacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-participacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-participacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list participacion">
			
				<g:if test="${participacionInstance?.beginningDate}">
				<li class="fieldcontain">
					<span id="beginningDate-label" class="property-label"><g:message code="participacion.beginningDate.label" default="Beginning Date" /></span>
					
						<span class="property-value" aria-labelledby="beginningDate-label"><g:formatDate date="${participacionInstance?.beginningDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.body}">
				<li class="fieldcontain">
					<span id="body-label" class="property-label"><g:message code="participacion.body.label" default="Body" /></span>
					
						<span class="property-value" aria-labelledby="body-label"><g:fieldValue bean="${participacionInstance}" field="body"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.endingDate}">
				<li class="fieldcontain">
					<span id="endingDate-label" class="property-label"><g:message code="participacion.endingDate.label" default="Ending Date" /></span>
					
						<span class="property-value" aria-labelledby="endingDate-label"><g:formatDate date="${participacionInstance?.endingDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="participacion.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${participacionInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.image1}">
				<li class="fieldcontain">
					<span id="image1-label" class="property-label"><g:message code="participacion.image1.label" default="Image1" /></span>
					
						<span class="property-value" aria-labelledby="image1-label"><g:fieldValue bean="${participacionInstance}" field="image1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.image2}">
				<li class="fieldcontain">
					<span id="image2-label" class="property-label"><g:message code="participacion.image2.label" default="Image2" /></span>
					
						<span class="property-value" aria-labelledby="image2-label"><g:fieldValue bean="${participacionInstance}" field="image2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.image3}">
				<li class="fieldcontain">
					<span id="image3-label" class="property-label"><g:message code="participacion.image3.label" default="Image3" /></span>
					
						<span class="property-value" aria-labelledby="image3-label"><g:fieldValue bean="${participacionInstance}" field="image3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.meetingRelated}">
				<li class="fieldcontain">
					<span id="meetingRelated-label" class="property-label"><g:message code="participacion.meetingRelated.label" default="Meeting Related" /></span>
					
						<span class="property-value" aria-labelledby="meetingRelated-label"><g:link controller="mesaredonda" action="show" id="${participacionInstance?.meetingRelated?.id}">${participacionInstance?.meetingRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${participacionInstance?.userRelated}">
				<li class="fieldcontain">
					<span id="userRelated-label" class="property-label"><g:message code="participacion.userRelated.label" default="User Related" /></span>
					
						<span class="property-value" aria-labelledby="userRelated-label"><g:link controller="user" action="show" id="${participacionInstance?.userRelated?.id}">${participacionInstance?.userRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:participacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${participacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
