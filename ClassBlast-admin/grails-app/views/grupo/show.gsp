
<%@ page import="classblast.admin.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grupo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-grupo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grupo">
			
				<g:if test="${grupoInstance?.courseRelated}">
				<li class="fieldcontain">
					<span id="courseRelated-label" class="property-label"><g:message code="grupo.courseRelated.label" default="Course Related" /></span>
					
						<span class="property-value" aria-labelledby="courseRelated-label"><g:link controller="curso" action="show" id="${grupoInstance?.courseRelated?.id}">${grupoInstance?.courseRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.courseSection}">
				<li class="fieldcontain">
					<span id="courseSection-label" class="property-label"><g:message code="grupo.courseSection.label" default="Course Section" /></span>
					
						<span class="property-value" aria-labelledby="courseSection-label"><g:link controller="seccion" action="show" id="${grupoInstance?.courseSection?.id}">${grupoInstance?.courseSection?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="grupo.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${grupoInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.fileList}">
				<li class="fieldcontain">
					<span id="fileList-label" class="property-label"><g:message code="grupo.fileList.label" default="File List" /></span>
					
						<g:each in="${grupoInstance.fileList}" var="f">
						<span class="property-value" aria-labelledby="fileList-label"><g:link controller="archivo" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.groupDescription}">
				<li class="fieldcontain">
					<span id="groupDescription-label" class="property-label"><g:message code="grupo.groupDescription.label" default="Group Description" /></span>
					
						<span class="property-value" aria-labelledby="groupDescription-label"><g:fieldValue bean="${grupoInstance}" field="groupDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.groupName}">
				<li class="fieldcontain">
					<span id="groupName-label" class="property-label"><g:message code="grupo.groupName.label" default="Group Name" /></span>
					
						<span class="property-value" aria-labelledby="groupName-label"><g:fieldValue bean="${grupoInstance}" field="groupName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.groupRolList}">
				<li class="fieldcontain">
					<span id="groupRolList-label" class="property-label"><g:message code="grupo.groupRolList.label" default="Group Rol List" /></span>
					
						<g:each in="${grupoInstance.groupRolList}" var="g">
						<span class="property-value" aria-labelledby="groupRolList-label"><g:link controller="rol" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.groupState}">
				<li class="fieldcontain">
					<span id="groupState-label" class="property-label"><g:message code="grupo.groupState.label" default="Group State" /></span>
					
						<span class="property-value" aria-labelledby="groupState-label"><g:fieldValue bean="${grupoInstance}" field="groupState"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.homeworkList}">
				<li class="fieldcontain">
					<span id="homeworkList-label" class="property-label"><g:message code="grupo.homeworkList.label" default="Homework List" /></span>
					
						<g:each in="${grupoInstance.homeworkList}" var="h">
						<span class="property-value" aria-labelledby="homeworkList-label"><g:link controller="tarea" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.meetingList}">
				<li class="fieldcontain">
					<span id="meetingList-label" class="property-label"><g:message code="grupo.meetingList.label" default="Meeting List" /></span>
					
						<g:each in="${grupoInstance.meetingList}" var="m">
						<span class="property-value" aria-labelledby="meetingList-label"><g:link controller="mesaredonda" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.postList}">
				<li class="fieldcontain">
					<span id="postList-label" class="property-label"><g:message code="grupo.postList.label" default="Post List" /></span>
					
						<g:each in="${grupoInstance.postList}" var="p">
						<span class="property-value" aria-labelledby="postList-label"><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.userList}">
				<li class="fieldcontain">
					<span id="userList-label" class="property-label"><g:message code="grupo.userList.label" default="User List" /></span>
					
						<g:each in="${grupoInstance.userList}" var="u">
						<span class="property-value" aria-labelledby="userList-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:grupoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${grupoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
