<%@ page import="classblast.admin.Publicacion" %>



<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'commentList', 'error')} ">
	<label for="commentList">
		<g:message code="publicacion.commentList.label" default="Comment List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${publicacionInstance?.commentList?}" var="c">
    <li><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comentario" action="create" params="['publicacion.id': publicacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comentario.label', default: 'Comentario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'communityRelated', 'error')} required">
	<label for="communityRelated">
		<g:message code="publicacion.communityRelated.label" default="Community Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="communityRelated" name="communityRelated.id" from="${classblast.admin.Parche.list()}" optionKey="id" required="" value="${publicacionInstance?.communityRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'groupRelated', 'error')} required">
	<label for="groupRelated">
		<g:message code="publicacion.groupRelated.label" default="Group Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${publicacionInstance?.groupRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'postBody', 'error')} ">
	<label for="postBody">
		<g:message code="publicacion.postBody.label" default="Post Body" />
		
	</label>
	<g:textField name="postBody" value="${publicacionInstance?.postBody}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'postDate', 'error')} required">
	<label for="postDate">
		<g:message code="publicacion.postDate.label" default="Post Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="postDate" precision="day"  value="${publicacionInstance?.postDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: publicacionInstance, field: 'postOwner', 'error')} required">
	<label for="postOwner">
		<g:message code="publicacion.postOwner.label" default="Post Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="postOwner" name="postOwner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${publicacionInstance?.postOwner?.id}" class="many-to-one"/>
</div>

