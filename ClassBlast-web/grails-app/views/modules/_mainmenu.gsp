<section class="sec-main-menu">
	<h3>Menú principal</h3>
	<g:link>Home</g:link>- &gt; 
	<g:link>Cursos</g:link>- &gt; 
	<br/><br/>
	<ul class="list-menu">
		<li><g:link>Cursos</g:link>
			<g:if test="${groupList!=[]}">
				<ul>
					<g:each in="${groupList}" var="groupItem">
						<li><g:link controller="group">${groupItem.groupName}</g:link></li>
					</g:each>
				</ul>
			</g:if>
			<g:else>
				<ul><li><g:message message="No está en ningún curso"/></li></ul>
			</g:else>
		</li>
		<li><g:link>Notificaciones</g:link></li>
		<li><g:link>Perfil</g:link></li>
		<li><g:link>Publicaciones</g:link></li>
		<li><g:link>Parches</g:link>
			<g:if test="${communityList!=[]}">
				<ul>
					<g:each in="${groupList}" var="communityItem">
						<li><g:link controller="community">${communityItem.communityName}</g:link></li>
					</g:each>
				</ul>
			</g:if>
			<g:else>
				<ul><li><g:message message="No está en ningún parche"/></li></ul>
			</g:else>
		</li>
		<li><g:link>Comentarios</g:link></li>
		<li><g:link>Tareas</g:link></li>
	</ul>
	<g:link>Atrás</g:link>
</section>

