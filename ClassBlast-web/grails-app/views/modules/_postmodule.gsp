<div class="post-section">
	<script type="text/javascript">
	
	</script>
	${post.postOwner.firstName}
	${post.postOwner.lastName}
	<br />
	${post.postBody}
	${post.postDate}
	<g:link url="#" onclick="">Editar</g:link>
	<span id="editPost"> <g:remoteLink action="editPost"
			update="post_list" id="${post.id}"></g:remoteLink>
	</span>
	<g:link url="#" onclick="confirmMessage(${post.id})">Borrar</g:link>
	<span id="delete${post.id}"> <g:remoteLink action="deletePost"
			update="post_list" id="${post.id}" onSuccess="repaint()"></g:remoteLink>
	</span> 
	<span class="add_comment" id="add_comment${post.id}"> 
		<g:link url="#"
			onclick="load_comment_field(${post.id})">Agregar comentario</g:link>
	</span> 
	<span class="comment_field" id="comment_field${post.id}"> 
		<g:formRemote
			url="[action:'addComment']" name="mycommentfield${post.id}"
			update="comment_list${post.id}" 
			onSuccess="clear('#comment_field${post.id} textarea');repaintCommentList(${post.id})">
			<label for="comment-body">Comentario</label>
			<g:hiddenField name="post_id" value="${post.id}" />
			<g:textArea name="comment_body" />
			<g:actionSubmit value="Listo" onclick="return(processCreateComment(${post.id}))"/>
		</g:formRemote>
	</span>

	<div id="comment_list${post.id}">
		<g:render template="/modules/commentlistmodule"
			model="['commentList':post.commentList]"></g:render>
	</div>


</div>