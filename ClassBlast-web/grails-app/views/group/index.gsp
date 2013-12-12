<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - Classblast</title>
</head>
<body>
	<g:render template="/modules/groupmenu" model="${[group:group]}"/>
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
		update="post_list" url="[controller:'group',action:'createPost']"
		onSuccess="repaintPostForm()">
			<label for="post_title">Título</label>
			<g:textField name="post_title"/><br/><br/>
			<label for="post_body">Mensaje</label>
			<g:textArea name="post_body"/>
			<g:actionSubmit value="Crear" onclick="return(processCreatePost())"/>
		</g:formRemote>
		<g:render template="/modules/postlistmodule" 
			model="['postList':grupo.postList]"/>
	</g:else>
	
</body>
</html>