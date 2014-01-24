<div id="post_list">
	<g:if test="${postList.size()>0}">
		<g:set var="i" value="${1}" />
		<g:each in="${postList}" var="postitem">
			<g:set var="i" value="${i+2}" />
			<g:set var="isOwn" value="${isAdmin || postitem.postOwner==session.user }"/>
			<g:render template="/modules/postmodule"
				model="['post':postitem,'formRemoteId':i,'isOwn':isOwn]" />
		</g:each>
	</g:if>
	<g:else>
		<p>No hay publicaciones que mostrar</p>
	</g:else>
</div>