
<%@ page import="classblast.admin.Mesaredonda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mesaredonda.label', default: 'Mesaredonda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mesaredonda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mesaredonda" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mesaredonda">
			
				<g:if test="${mesaredondaInstance?.entryList}">
				<li class="fieldcontain">
					<span id="entryList-label" class="property-label"><g:message code="mesaredonda.entryList.label" default="Entry List" /></span>
					
						<g:each in="${mesaredondaInstance.entryList}" var="e">
						<span class="property-value" aria-labelledby="entryList-label"><g:link controller="participacion" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${mesaredondaInstance?.meetingDate}">
				<li class="fieldcontain">
					<span id="meetingDate-label" class="property-label"><g:message code="mesaredonda.meetingDate.label" default="Meeting Date" /></span>
					
						<span class="property-value" aria-labelledby="meetingDate-label"><g:formatDate date="${mesaredondaInstance?.meetingDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesaredondaInstance?.meetingRolList}">
				<li class="fieldcontain">
					<span id="meetingRolList-label" class="property-label"><g:message code="mesaredonda.meetingRolList.label" default="Meeting Rol List" /></span>
					
						<g:each in="${mesaredondaInstance.meetingRolList}" var="m">
						<span class="property-value" aria-labelledby="meetingRolList-label"><g:link controller="rol" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${mesaredondaInstance?.meetingTopic}">
				<li class="fieldcontain">
					<span id="meetingTopic-label" class="property-label"><g:message code="mesaredonda.meetingTopic.label" default="Meeting Topic" /></span>
					
						<span class="property-value" aria-labelledby="meetingTopic-label"><g:fieldValue bean="${mesaredondaInstance}" field="meetingTopic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mesaredondaInstance?.partakerList}">
				<li class="fieldcontain">
					<span id="partakerList-label" class="property-label"><g:message code="mesaredonda.partakerList.label" default="Partaker List" /></span>
					
						<g:each in="${mesaredondaInstance.partakerList}" var="p">
						<span class="property-value" aria-labelledby="partakerList-label"><g:link controller="user" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:mesaredondaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mesaredondaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
