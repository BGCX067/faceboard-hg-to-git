<section class="sec-main-menu">
	<h3>Menú principal</h3>
	<g:link>Home</g:link>- &gt; 
	<g:link>Cursos</g:link>- &gt; 
	<br/><br/>
	<ul class="list-menu">
		<li><g:link onclick="return(false)" style="cursor:default">Cursos</g:link>
			<ul>
				<g:if test="${true}">
					<li><g:link controller="group" action="create">Crear nuevo grupo</g:link></li>
				</g:if>
				<g:if test="${groupList!=[]}">
					<g:each in="${groupList}" var="groupItem">
						<li><g:link controller="group" 
						params="[groupid:groupItem.id]">${groupItem.groupName}</g:link></li>
					</g:each>
				</g:if>
				<g:else>
					<li><g:message message="No está en ningún curso"/></li>
				</g:else>
			</ul>
		</li>
		<li><g:link controller="alert">Notificaciones</g:link></li>
		<li><g:link controller="profile">Perfil</g:link></li>
		<li><g:link controller="post">Publicaciones</g:link></li>
		<li><g:link onclick="return(false)" style="cursor:default">Parches</g:link>
			<ul>
				<g:if test="${true}">
					<li><g:link controller="community" action="create">Crear nuevo parche</g:link></li>
				</g:if>
				<g:if test="${communityList!=[]}">
					<g:each in="${communityList}" var="communityItem">
						<li><g:link controller="community"
						params="[communityid:communityItem.id]">${communityItem.communityName}</g:link></li>
					</g:each>
				</g:if>
				<g:else>
					<li><g:message message="No está en ningún parche"/></li>
				</g:else>
			</ul>
		</li>
		<li><g:link>Comentarios</g:link></li>
		<li><g:link>Tareas</g:link></li>
	</ul>
	<g:link onclick="javascript:history.go(-1)" 
		url="javascript:history.go(-1)">Atrás</g:link>
</section>

