<div class="comment-section">
	<div id="show_comment${comment.id}">
		${comment.owner.firstName}
		${comment.owner.lastName}
		<br />
		${comment.commentBody }

		${comment.commentDate }
		<g:if test="${isAdmin}">
			<g:link url="#"
				onclick="confirmDelCommentMessage(${comment.postLinked.id},${comment.id})">Borrar</g:link>
			<span id="deleteComment${comment.id}"> <g:remoteLink
					id="${comment.id}" update="comment_list${comment.postLinked.id}"
					action="deleteComment"
					onSuccess="repaintCommentList(${comment.postLinked.id})"></g:remoteLink>
			</span>
			<g:link class="edit_comment_command" onclick="enableEditComment(${comment.id},'${comment.commentBody}');return(false)">Editar</g:link>
		</g:if>
	</div>
	<div id="edit_comment${comment.id}" class="comment_edit"
		style="display: none">
		<g:formRemote name="ec" on404="alert('not found!)"
			update="comment_list${comment.postLinked.id}" url="[action:'editComment']">
			<div id="pu-tfield">
				<g:textField name="comment_body" value="${comment.commentBody }"/>
				<g:hiddenField name="comment_id" value="${comment.id}" />
			</div>
			<div id="pu-bt">
				<g:actionSubmit value="Listo" onclick="repaintComment(${comment.id})"/>
				<g:actionSubmit value="Cancelar" onclick="repaintComment(${comment.id});return(false)"/>
			</div>
		</g:formRemote>
	</div>
</div>