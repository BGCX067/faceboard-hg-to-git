<div class="post-section">
	<script type="text/javascript">
		$(function() {
			$("#delete_post").click(function() {
				if (confirm("¿Estás seguro?")) {
					$(this).removeAttr("id");
					//$(this).click();
				}
			})
		})
		
	</script>
	${post.postOwner.firstName}
	${post.postOwner.lastName}
	<br />
	${post.postBody}
	${post.postDate}
	<g:remoteLink action="editPost" update="post_list" id="${post.id}" >Editar</g:remoteLink>
	<g:remoteLink action="deletePost" update="post_list" id="${post.id}">Borrar</g:remoteLink>
	<ul>
		<g:each in="${post.commentList}" var="commentItem">
			<li><g:render template="/modules/commentmodule" /></li>
		</g:each>
	</ul>
	<script type="text/javascript">
	function reload(){
		$('#post_list').fadeOut()
		$('#post_list').fadeIn()
	}
	</script>
</div>