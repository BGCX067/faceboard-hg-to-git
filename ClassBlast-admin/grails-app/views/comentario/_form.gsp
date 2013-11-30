<%@ page import="classblast.admin.Comentario" %>



<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'commentBody', 'error')} ">
	<label for="commentBody">
		<g:message code="comentario.commentBody.label" default="Comment Body" />
		
	</label>
	<g:textField name="commentBody" value="${comentarioInstance?.commentBody}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'commentDate', 'error')} required">
	<label for="commentDate">
		<g:message code="comentario.commentDate.label" default="Comment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="commentDate" precision="day"  value="${comentarioInstance?.commentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="comentario.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${comentarioInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comentarioInstance, field: 'postLinked', 'error')} required">
	<label for="postLinked">
		<g:message code="comentario.postLinked.label" default="Post Linked" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="postLinked" name="postLinked.id" from="${classblast.admin.Publicacion.list()}" optionKey="id" required="" value="${comentarioInstance?.postLinked?.id}" class="many-to-one"/>
</div>

