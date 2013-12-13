<ul>
<g:each in="${commentList}" var="commentItem">
	<li><g:render template="/modules/commentmodule" model="['comment':commentItem]"/></li>
</g:each>
</ul>