<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - Classblast</title>
</head>
<body>
	<g:render template="/modules/scripting"/>
	<g:render template="/modules/groupmenu" model="${[group:group]}"/>
	<g:if test="${groupNotFound}">
		Lo siento pero el grupo que buscas no existe :p
	</g:if>
	<g:else>
		<!-- <h2></h2> -->
		<h3>Tareas publicadas</h3>
	</g:else>
	
</body>
</html>