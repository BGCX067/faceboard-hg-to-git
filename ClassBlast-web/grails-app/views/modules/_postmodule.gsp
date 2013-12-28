<div class="post-section">
	<script type="text/javascript">
	
	</script>
	<div style="width: 70%; border: solid #8BC600; margin: auto">
		<section id="show_post${post.id}">
			<div style="width: 100%; text-color: blue;">
				<h4>
					${post.postOwner.firstName}
					${post.postOwner.lastName}
				</h4>
			</div>
			<div style="padding: 5px;">
				${post.postBody}
			</div>
			<div style="padding-right: 5px; float: left;">
				<g:link onclick="enableEditPost(${post.id},'${post.postBody}');return(false)" 
				class="edit_post_command">Editar</g:link>
				<span id="editPost"> <g:remoteLink action="editPost"
						update="post_list" id="${post.id}"></g:remoteLink>
				</span>
				<g:link url="#" onclick="confirmMessage(${post.id})">Borrar</g:link>
				<span id="delete${post.id}"> <g:remoteLink
						action="deletePost" update="post_list" id="${post.id}"
						onSuccess="repaint()"></g:remoteLink>
				</span> <span class="add_comment" id="add_comment${post.id}"> <g:link
						url="#" onclick="load_comment_field(${post.id})">Agregar comentario</g:link>
				</span>
			</div>
		</section>
		<section id="edit_post${post.id}" class="post_edit"
			style="display: none">
			<g:formRemote name="ep" on404="alert('not found!)"
				update="post_list"
				url="[action:'editPost']">
				<div id="pu-tfield">
					<g:textField name="post_body" value="${post.postBody }" />
					<g:hiddenField name="post_id" value="${post.id}" />
				</div>
				<div id="pu-bt">
					<g:actionSubmit value="Listo"
						onclick="repaintPost(${post.id})" />
					<g:actionSubmit value="Cancelar"
						onclick="repaintPost(${post.id});return(false)" />
				</div>
			</g:formRemote>
		</section>
		<span class="comment_field" id="comment_field${post.id}" style="display:none"> <g:formRemote
				url="[action:'addComment']" name="mycommentfield${post.id}"
				update="comment_list${post.id}"
				onSuccess="clear('#comment_field${post.id} textarea');repaintCommentList(${post.id})">
				<label for="comment-body">Comentario</label>
				<g:hiddenField name="post_id" value="${post.id}" />
				<g:textArea name="comment_body" />
				<g:actionSubmit value="Listo"
					onclick="return(processCreateComment(${post.id}))" />
			</g:formRemote>
		</span>
		<br/><br/>
		<div id="comment_list${post.id}">
			<g:render template="/modules/commentlistmodule"
				model="['commentList':post.commentList]"></g:render>
		</div>
		<div style="padding: 5px; color: #AAAAAA;">
			<h5>
				${post.postDate}
			</h5>
		</div>
	</div>
</div>