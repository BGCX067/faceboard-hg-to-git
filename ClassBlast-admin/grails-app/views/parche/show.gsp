
<%@ page import="classblast.admin.Parche" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parche.label', default: 'Parche')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parche" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parche" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parche">
			
				<g:if test="${parcheInstance?.communityDescription}">
				<li class="fieldcontain">
					<span id="communityDescription-label" class="property-label"><g:message code="parche.communityDescription.label" default="Community Description" /></span>
					
						<span class="property-value" aria-labelledby="communityDescription-label"><g:fieldValue bean="${parcheInstance}" field="communityDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.communityName}">
				<li class="fieldcontain">
					<span id="communityName-label" class="property-label"><g:message code="parche.communityName.label" default="Community Name" /></span>
					
						<span class="property-value" aria-labelledby="communityName-label"><g:fieldValue bean="${parcheInstance}" field="communityName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.communityRolList}">
				<li class="fieldcontain">
					<span id="communityRolList-label" class="property-label"><g:message code="parche.communityRolList.label" default="Community Rol List" /></span>
					
						<g:each in="${parcheInstance.communityRolList}" var="c">
						<span class="property-value" aria-labelledby="communityRolList-label"><g:link controller="rol" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.communityType}">
				<li class="fieldcontain">
					<span id="communityType-label" class="property-label"><g:message code="parche.communityType.label" default="Community Type" /></span>
					
						<span class="property-value" aria-labelledby="communityType-label"><g:fieldValue bean="${parcheInstance}" field="communityType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.courseRelated}">
				<li class="fieldcontain">
					<span id="courseRelated-label" class="property-label"><g:message code="parche.courseRelated.label" default="Course Related" /></span>
					
						<span class="property-value" aria-labelledby="courseRelated-label"><g:link controller="curso" action="show" id="${parcheInstance?.courseRelated?.id}">${parcheInstance?.courseRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="parche.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${parcheInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.postList}">
				<li class="fieldcontain">
					<span id="postList-label" class="property-label"><g:message code="parche.postList.label" default="Post List" /></span>
					
						<g:each in="${parcheInstance.postList}" var="p">
						<span class="property-value" aria-labelledby="postList-label"><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.semesterRelated}">
				<li class="fieldcontain">
					<span id="semesterRelated-label" class="property-label"><g:message code="parche.semesterRelated.label" default="Semester Related" /></span>
					
						<span class="property-value" aria-labelledby="semesterRelated-label"><g:link controller="semestre" action="show" id="${parcheInstance?.semesterRelated?.id}">${parcheInstance?.semesterRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${parcheInstance?.userList}">
				<li class="fieldcontain">
					<span id="userList-label" class="property-label"><g:message code="parche.userList.label" default="User List" /></span>
					
						<g:each in="${parcheInstance.userList}" var="u">
						<span class="property-value" aria-labelledby="userList-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:parcheInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${parcheInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
