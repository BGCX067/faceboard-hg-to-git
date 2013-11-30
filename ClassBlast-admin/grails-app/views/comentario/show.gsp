
<%@ page import="classblast.admin.Comentario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comentario.label', default: 'Comentario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comentario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comentario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comentario">
			
				<g:if test="${comentarioInstance?.commentBody}">
				<li class="fieldcontain">
					<span id="commentBody-label" class="property-label"><g:message code="comentario.commentBody.label" default="Comment Body" /></span>
					
						<span class="property-value" aria-labelledby="commentBody-label"><g:fieldValue bean="${comentarioInstance}" field="commentBody"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentarioInstance?.commentDate}">
				<li class="fieldcontain">
					<span id="commentDate-label" class="property-label"><g:message code="comentario.commentDate.label" default="Comment Date" /></span>
					
						<span class="property-value" aria-labelledby="commentDate-label"><g:formatDate date="${comentarioInstance?.commentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentarioInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="comentario.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${comentarioInstance?.owner?.id}">${comentarioInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentarioInstance?.postLinked}">
				<li class="fieldcontain">
					<span id="postLinked-label" class="property-label"><g:message code="comentario.postLinked.label" default="Post Linked" /></span>
					
						<span class="property-value" aria-labelledby="postLinked-label"><g:link controller="publicacion" action="show" id="${comentarioInstance?.postLinked?.id}">${comentarioInstance?.postLinked?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:comentarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${comentarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
