<div id="newusersrecord${userItem.id}">
	<span style="float: left">
	 <g:link controller="profile" params="${[profileid:userItem.id]}">
	 ${userItem.firstName} ${userItem.lastName}</g:link></span> 
	<span id="addUserCommand${userItem.id}" style="float:left">
	<g:link onclick="hide('#addUserCommand${userItem.id}');
					show_inline('#defineRolOfNewUser${userItem.id}');
					return(false)">Agregar</g:link>
</span> 
<span id="defineRolOfNewUser${userItem.id}" style="display:none;float:left"> 
	<g:formRemote
		name="adduser"
		url="[action:'addUserTo',params:[userId:userItem.id]]"
		before="if(!confirm('¿Está seguro de que desea agregar este usuario?')){return false};"
		after="pressClick('#deleteSearchResults')"
		update="newusersdtable">
		<span style="font-size: 0.8em">Defina el rol del usuario: </span>
		<g:select name="rol_field2" from="${rolList.rolDescription}"
			noSelection="['':'-Seleccione']" keys="${rolList.id }" />
		<g:submitButton name="accept_user_button2" value="Hecho"
			update="requestsdtable" />
		<button onclick="hide('#defineRolOfNewUser${userItem.id}');show_inline('#addUserCommand${userItem.id}');return(false)">Cancelar</button>
	</g:formRemote>
</span> 
</div>