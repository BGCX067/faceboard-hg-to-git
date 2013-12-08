<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - Classblast</title>
</head>
<body>
	<g:render template="/modules/scripting"/>
	<g:if test="${groupNotFound}">
		Lo siento pero el grupo que buscas no existe :p
	</g:if>
	<g:else>
		<h2>${grupo.groupName}</h2>
		<h3>${grupo.groupDescription}</h3>
		<g:if test="${isAdmin}">
			<g:link action="setup">Editar</g:link>
			<g:link action="delete">Eliminar grupo</g:link>
			<g:link action="userspanel">Administrar usuarios</g:link>
		</g:if>
		
		<p>Escribe una publicación</p>
		<g:formRemote name="mf" on404="alert('not found!)" 
		update="post_list" url="[controller:'group',action:'createPost']">
			<label for="post_title">Título</label>
			<input type="text" name="post_title"/><br/><br/>
			<label for="post_body">Mensaje</label>
			<g:textArea name="post_body"/>
			<g:actionSubmit value="Crear" />
		</g:formRemote>
		<div id="post_list">
			<g:render template="/modules/postlistmodule" model="['grupo':grupo]"/>
		</div>
	</g:else>
	
</body>
</html>