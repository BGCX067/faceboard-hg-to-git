<div id="usersrecord${userItem.id}">
	<span style="float: left"> 
	<g:link controller="profile" params="${[profileid:userItem.id]}">${userItem.firstName} ${userItem.lastName}
	</g:link>
		${userItem.login} ${userItem.email } <g:set var="userRol"
			value="${mode=='grupo'?userItem.getGroupRolOfUser(grupo):userItem.getCommunityRolOfUser(parche) }" />
		${userRol.rolType.rolDescription }
	</span> <span id="modify_rol_command${userItem.id}" style="float: left">
		<g:link url="#"
			onclick="hide('#modify_rol_command${userItem.id}');show('#modify_rol_field${userItem.id}');return(false)">Cambiar rol</g:link>
	</span> <span id="modify_rol_field${userItem.id}"
		style="float: left; display: none"> <g:formRemote
			name="changeroluser"
			url="[action:'changeRolOfUser',params:[userId:userItem.id]]"
			style="float:left"
			before="if(!confirm('¿Está seguro de que desea cambiar el rol de este usuario?')){return false};"
			update="usersrecord${userItem.id}">
			<g:select name="rol_field_to_change" from="${rolList.rolDescription}"
				noSelection="['':'-Seleccione']" keys="${rolList.id }" />
			<g:actionSubmit value="Listo" />
		</g:formRemote>
		<button
			onclick="hide('#modify_rol_field${userItem.id}');show('#modify_rol_command${userItem.id}')">Cancelar</button>
	</span>
	<g:remoteLink update="usersdtable" action="deleteUserFrom" params="${[userId:userItem.id]}"
	before="if(!confirm('¿Está seguro de que desea eliminar a este usuario?')){return false}">Eliminar del grupo</g:remoteLink>
</div>