
<%@ page import="classblast.admin.Publicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacion.label', default: 'Publicacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-publicacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-publicacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list publicacion">
			
				<g:if test="${publicacionInstance?.commentList}">
				<li class="fieldcontain">
					<span id="commentList-label" class="property-label"><g:message code="publicacion.commentList.label" default="Comment List" /></span>
					
						<g:each in="${publicacionInstance.commentList}" var="c">
						<span class="property-value" aria-labelledby="commentList-label"><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionInstance?.communityRelated}">
				<li class="fieldcontain">
					<span id="communityRelated-label" class="property-label"><g:message code="publicacion.communityRelated.label" default="Community Related" /></span>
					
						<span class="property-value" aria-labelledby="communityRelated-label"><g:link controller="parche" action="show" id="${publicacionInstance?.communityRelated?.id}">${publicacionInstance?.communityRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionInstance?.groupRelated}">
				<li class="fieldcontain">
					<span id="groupRelated-label" class="property-label"><g:message code="publicacion.groupRelated.label" default="Group Related" /></span>
					
						<span class="property-value" aria-labelledby="groupRelated-label"><g:link controller="grupo" action="show" id="${publicacionInstance?.groupRelated?.id}">${publicacionInstance?.groupRelated?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionInstance?.postBody}">
				<li class="fieldcontain">
					<span id="postBody-label" class="property-label"><g:message code="publicacion.postBody.label" default="Post Body" /></span>
					
						<span class="property-value" aria-labelledby="postBody-label"><g:fieldValue bean="${publicacionInstance}" field="postBody"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionInstance?.postDate}">
				<li class="fieldcontain">
					<span id="postDate-label" class="property-label"><g:message code="publicacion.postDate.label" default="Post Date" /></span>
					
						<span class="property-value" aria-labelledby="postDate-label"><g:formatDate date="${publicacionInstance?.postDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionInstance?.postOwner}">
				<li class="fieldcontain">
					<span id="postOwner-label" class="property-label"><g:message code="publicacion.postOwner.label" default="Post Owner" /></span>
					
						<span class="property-value" aria-labelledby="postOwner-label"><g:link controller="user" action="show" id="${publicacionInstance?.postOwner?.id}">${publicacionInstance?.postOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:publicacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${publicacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
