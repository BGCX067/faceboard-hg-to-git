<div class="comment-section">
	${comment.owner.firstName} ${comment.owner.lastName}
	<br/>
	${comment.commentBody }
	${comment.commentDate }
	<g:if test="${isAdmin}">
		<g:link url="#" onclick="confirmDelCommentMessage(${comment.postLinked.id},${comment.id})">Borrar</g:link>
		<span id="deleteComment${comment.id}">
			<g:remoteLink id="${comment.id}" update="comment_list${comment.postLinked.id}" action="deleteComment"
			onSuccess="repaintCommentList(${comment.postLinked.id})"></g:remoteLink>
		</span>
		<g:remoteLink update="comment_list" action="editComment">Editar</g:remoteLink>
	</g:if>
</div>