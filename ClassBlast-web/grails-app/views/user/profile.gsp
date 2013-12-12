<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Bienvenido a ClassBlast - Mi perfil</title>
</head>
<body>
	<script type="text/javascript">
		$(function(){$("#edit_profile").hide()})
	</script>
	<g:render template="/modules/mainmenu" />
	<h2>
		${profile.firstName}
		${profile.lastName}
	</h2>
	<h4>
		${rolOfUser.rolType.rolType}
	</h4>
	<g:render template="/modules/profilesearchmodule" />
	<g:if test="${isOtherUser}">
		<g:link>Enviar mensaje</g:link>
	</g:if>
	<p>
		Email:
		${profile.email}
	</p>
	<p>
		Fecha de registro:
		${profile.registerDate}
	</p>
	<div id="groups">
		<h3>Mis cursos</h3>
		<g:if test="${profile.groupList.size()>0}">
			<g:each in="${groupMap}" var="groupItem">
				<g:link controller="group" params="[groupid:groupItem.group.id]">
				${groupItem.group.groupName}
				</g:link>(${groupItem.rol})<br/>
			</g:each>
		</g:if>
		<g:else>
			<p>No estás en ningún curso actualmente</p>
		</g:else>
	</div>
	
	<div id="communities">
		<h3>Mis parches</h3>
		<g:if test="${profile.communityList.size()>0}">
			<g:each in="${profile.community}" var="communityItem">
				<g:link controller="community" params="[communityid:communityItem.id]">
				${communityItem.communityName}
				</g:link><br/>
			</g:each>
		</g:if>
		<g:else>
			<p>No estás en ningún parche actualmente</p>
		</g:else>
	</div>
	
	<g:actionSubmit value="Editar mi perfil" onclick="show('#edit_profile')"/>
	
	<div id="edit_profile">
	<g:formRemote url="['action':editProfile]" name="edit_profile_fr">
	</g:formRemote>
	</div>
</body>
</html>