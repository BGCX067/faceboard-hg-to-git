
<%@ page import="classblast.admin.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.alertList}">
				<li class="fieldcontain">
					<span id="alertList-label" class="property-label"><g:message code="user.alertList.label" default="Alert List" /></span>
					
						<g:each in="${userInstance.alertList}" var="a">
						<span class="property-value" aria-labelledby="alertList-label"><g:link controller="notificacion" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.bookList}">
				<li class="fieldcontain">
					<span id="bookList-label" class="property-label"><g:message code="user.bookList.label" default="Book List" /></span>
					
						<g:each in="${userInstance.bookList}" var="b">
						<span class="property-value" aria-labelledby="bookList-label"><g:link controller="cuaderno" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.commentList}">
				<li class="fieldcontain">
					<span id="commentList-label" class="property-label"><g:message code="user.commentList.label" default="Comment List" /></span>
					
						<g:each in="${userInstance.commentList}" var="c">
						<span class="property-value" aria-labelledby="commentList-label"><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.communityList}">
				<li class="fieldcontain">
					<span id="communityList-label" class="property-label"><g:message code="user.communityList.label" default="Community List" /></span>
					
						<g:each in="${userInstance.communityList}" var="c">
						<span class="property-value" aria-labelledby="communityList-label"><g:link controller="parche" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.conversation1List}">
				<li class="fieldcontain">
					<span id="conversation1List-label" class="property-label"><g:message code="user.conversation1List.label" default="Conversation1 List" /></span>
					
						<g:each in="${userInstance.conversation1List}" var="c">
						<span class="property-value" aria-labelledby="conversation1List-label"><g:link controller="conversacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.conversation2List}">
				<li class="fieldcontain">
					<span id="conversation2List-label" class="property-label"><g:message code="user.conversation2List.label" default="Conversation2 List" /></span>
					
						<g:each in="${userInstance.conversation2List}" var="c">
						<span class="property-value" aria-labelledby="conversation2List-label"><g:link controller="conversacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.encryptedPassword}">
				<li class="fieldcontain">
					<span id="encryptedPassword-label" class="property-label"><g:message code="user.encryptedPassword.label" default="Encrypted Password" /></span>
					
						<span class="property-value" aria-labelledby="encryptedPassword-label"><g:fieldValue bean="${userInstance}" field="encryptedPassword"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.groupList}">
				<li class="fieldcontain">
					<span id="groupList-label" class="property-label"><g:message code="user.groupList.label" default="Group List" /></span>
					
						<g:each in="${userInstance.groupList}" var="g">
						<span class="property-value" aria-labelledby="groupList-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="user.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${userInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.meetingList}">
				<li class="fieldcontain">
					<span id="meetingList-label" class="property-label"><g:message code="user.meetingList.label" default="Meeting List" /></span>
					
						<g:each in="${userInstance.meetingList}" var="m">
						<span class="property-value" aria-labelledby="meetingList-label"><g:link controller="mesaredonda" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.postList}">
				<li class="fieldcontain">
					<span id="postList-label" class="property-label"><g:message code="user.postList.label" default="Post List" /></span>
					
						<g:each in="${userInstance.postList}" var="p">
						<span class="property-value" aria-labelledby="postList-label"><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.registerDate}">
				<li class="fieldcontain">
					<span id="registerDate-label" class="property-label"><g:message code="user.registerDate.label" default="Register Date" /></span>
					
						<span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${userInstance?.registerDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.requestList}">
				<li class="fieldcontain">
					<span id="requestList-label" class="property-label"><g:message code="user.requestList.label" default="Request List" /></span>
					
						<g:each in="${userInstance.requestList}" var="r">
						<span class="property-value" aria-labelledby="requestList-label"><g:link controller="solicitud" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.rolList}">
				<li class="fieldcontain">
					<span id="rolList-label" class="property-label"><g:message code="user.rolList.label" default="Rol List" /></span>
					
						<g:each in="${userInstance.rolList}" var="r">
						<span class="property-value" aria-labelledby="rolList-label"><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
