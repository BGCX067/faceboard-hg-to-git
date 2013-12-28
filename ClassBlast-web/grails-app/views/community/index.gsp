<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>parche - Classblast</title>
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

#pu-tfield input {
	width: 100%;
}

#pu-bt {
	
}
</style>
</head>
<body>
	<g:if test="${communityNotFound}">
		Lo siento pero el parche que buscas no existe
		<g:link onclick="javascript:history.go(-1)"
			url="javascript:history.go(-1)">Volver</g:link>
	</g:if>
	<g:else>
		<div id="con">
			<div id="ma" class="divi">
				<h2>
					${parche.communityName}
				</h2>
				<p style="color: #AAAAAA; padding: 5px 5px;">
					${parche.communityDescription}
				</p>
				<g:if test="${isUserInCommunity}">
					<g:if test="${isAdmin}">
						<div id="sub">
							<div id="sub-me">
								<g:link action="setup" params="[communityid:params.communityid]">Editar</g:link>
							</div>
							<div id="sub-me">
								<g:link action="delete">Eliminar parche</g:link>
							</div>
							<div id="sub-me">
								<g:link action="userspanel" params="[communityid:params.communityid]">Administrar usuarios</g:link>
							</div>
						</div>
					</g:if>
					<div style="width: 70%; border: solid #8BC600; margin: auto;">
						<div>Escribe una publicación</div>
						<g:formRemote name="mf" on404="alert('not found!)"
							update="post_list"
							url="[controller:'community',action:'createPost']"
							onSuccess="repaintPostForm()">
							<div id="pu-tfield">
								<g:textArea name="post_body" />
							</div>
							<div id="pu-bt">
								<g:actionSubmit value="Crear"
									onclick="return(processCreatePost())" />
							</div>
						</g:formRemote>
					</div>
					<div>
						<g:render template="/modules/postlistmodule"
							model="['postList':parche.postList]" />
					</div>
				</g:if>
				<g:else>
					<g:render template="/modules/request_controls"/>
				</g:else>
			</div>
			<div id="me" class="divi">
				<g:render template="/modules/mainmenu"
					model="${[groupList:groupList,communityList:communityList]}" />
			</div>
		</div>
	</g:else>

</body>
</html>