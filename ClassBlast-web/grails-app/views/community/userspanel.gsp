<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>parche - panel de control</title>

</head>
<body>
	<div id="con">
		<div id="ma" class="divi">
			<h2>
				${parche.communityName}
			</h2>
			${communityid}
			<p style="color: #AAAAAA; padding: 5px 5px;">
				${parche.communityDescription}
			</p>
			<g:if test="${isAdmin}">
				<div id="sub">
					<div id="sub-me">
						<g:link action="setup">Editar</g:link>
					</div>
					<div id="sub-me">
						<g:link action="delete">Eliminar parche</g:link>
					</div>
					<div id="sub-me">
						<g:link action="userspanel">Administrar usuarios</g:link>
					</div>
				</div>
			</g:if>
			<div
				style="width: 70%; border: solid #8BC600; margin-top: 50px; margin-left: 14.7%;">
				<div>Escribe una publicación</div>
				<g:formRemote name="mf" on404="alert('not found!)"
					update="post_list" url="[controller:'community',action:'createPost']"
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
			<div
				style="width: 70%; border: solid #8BC600; padding-top: 10px; margin: auto;">
				<g:render template="/modules/postlistmodule"
					model="['postList':parche.postList]" />
			</div>

		</div>
		<div id="me" class="divi">
			<g:render template="/modules/mainmenu" model="${[community:community]}" />
		</div>
	</div>
</body>
</html>