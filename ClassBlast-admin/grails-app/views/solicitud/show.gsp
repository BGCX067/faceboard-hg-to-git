
<%@ page import="classblast.admin.Solicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solicitud" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solicitud">
			
				<g:if test="${solicitudInstance?.communityRelated}">
				<li class="fieldcontain">
					<span id="communityRelated-label" class="property-label"><g:message code="solicitud.communityRelated.label" default="Community Related" /></span>
					
						<span class="property-value" aria-labelledby="communityRelated-label"><g:link controller="parche" action="show" id="${solicitudInstance?.communityRelated?.id}">${solicitudInstance?.communityRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.groupRelated}">
				<li class="fieldcontain">
					<span id="groupRelated-label" class="property-label"><g:message code="solicitud.groupRelated.label" default="Group Related" /></span>
					
						<span class="property-value" aria-labelledby="groupRelated-label"><g:link controller="grupo" action="show" id="${solicitudInstance?.groupRelated?.id}">${solicitudInstance?.groupRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.requestDate}">
				<li class="fieldcontain">
					<span id="requestDate-label" class="property-label"><g:message code="solicitud.requestDate.label" default="Request Date" /></span>
					
						<span class="property-value" aria-labelledby="requestDate-label"><g:formatDate date="${solicitudInstance?.requestDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.requestState}">
				<li class="fieldcontain">
					<span id="requestState-label" class="property-label"><g:message code="solicitud.requestState.label" default="Request State" /></span>
					
						<span class="property-value" aria-labelledby="requestState-label"><g:fieldValue bean="${solicitudInstance}" field="requestState"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:solicitudInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${solicitudInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
