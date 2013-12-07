<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - Classblast</title>
</head>
<body>
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
		
			<label for="post-value">Escribe una publicación</label>
			<g:textArea name="post_value"/>
			<g:actionSubmit value="Crear" onclick="miFuncion('post_value')"/>
		
		<g:each in="${grupo.postList}" var="postitem">
			r
		</g:each>
	</g:else>
	
	
</body>
</html>