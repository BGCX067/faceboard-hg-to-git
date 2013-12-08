<div id="post_list">
	<g:set var="i" value="${1}"/>
	<g:each in="${grupo.postList}" var="postitem">
		<g:set var="i" value="${i+2}"/>
		<g:render template="/modules/postmodule" model="['post':postitem,'formRemoteId':i]" />
	</g:each>
</div>