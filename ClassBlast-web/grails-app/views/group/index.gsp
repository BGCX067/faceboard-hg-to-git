<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - Classblast</title>
<style>
#conr {
	width: 100%;
}
.divi {
	border: solid #8BC600;
	border-width: 5px;
}
#ma {
	width: 78%;
	float: left;
	height: 500px;
}

#me {
	width: 20%;
	float: left;
	height: 500px;
}
#sub {
	width: 100%;
	float: left;
	text-align: center;
	border: solid #8BC600;
}
#sub-me {
	width: 32%;
	float: left;
	padding: 5px;
}

#sub-me {
	width: 32%;
	float: left;
	padding: 5px;
}
#pu-label {
}
#pu-tfield textarea{
	margin-left:4%;
	width: 90%;
	border-radius: 5px;
}

#pu-tfield input{
	margin-left:4%;
	width: 90%;
	border-radius: 5px;
}
#pu-bt {
	padding: 5px;
	margin-left:74%;
	width: 20%;
}
</style>
</head>
<body>
	<g:if test="${groupNotFound}">
		Lo siento pero el grupo que buscas no existe :p
	</g:if>
	<g:else>
		<div id="con">
			<div id="ma" class="divi">
				<h2>${grupo.groupName}</h2>
				<p style="color:#AAAAAA; padding: 5px 5px;">${grupo.groupDescription}</p>
				<g:if test="${isAdmin}">
					<div id="sub">
						<div id="sub-me">
							<g:link action="setup">Editar</g:link>
						</div>
						<div id="sub-me">
							<g:link action="delete">Eliminar grupo</g:link></div>
						<div id="sub-me">
							<g:link action="userspanel">Administrar usuarios</g:link>
						</div>
					</div>
				</g:if>	
				<div style="width:70%;border: solid #8BC600; margin-top:50px; margin-left:14.7%;">
					<div>Escribe una publicación</div>
					<g:formRemote name="mf" on404="alert('not found!)" 
					update="post_list" url="[controller:'group',action:'createPost']"
					onSuccess="repaintPostForm()">
					<div id="pu-label">
						<label for="post_title">Título</label>
					</div>
					<div id="pu-tfield">
						<g:textField name="post_title"/>
					</div>
					<div id="pu-label">
						<label for="post_body">Mensaje</label>
					</div>
					<div id="pu-tfield">
						<g:textArea name="post_body"/>
					</div>
					<div id="pu-bt">
						<g:actionSubmit value="Crear" onclick="return(processCreatePost())"/>
					</div>
					</g:formRemote>
				</div>
				<div style="width:70%;border: solid #8BC600;padding-top:10px; margin:auto;">
					<g:render template="/modules/postlistmodule" model="['postList':grupo.postList]"/>
				</div>	
			</div>
			<div id="me" class="divi">
				<g:render template="/modules/groupmenu" model="${[group:group]}"/>
			</div>			
		</div>
	</g:else>
	
</body>
</html>