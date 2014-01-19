<g:set var="userItem" value="${requestItem.userInterested}" />
<g:link controller="profile" params="${[profileid:userItem.id]}">
${userItem.firstName} ${userItem.lastName}</g:link>
<span id="acceptRequestCommand${requestItem.id}" style="float:left">
	<g:link onclick="hide('#acceptRequestCommand${requestItem.id}');
					hide('#rejectRequestCommand${requestItem.id}');
					show_inline('#defineRolOfNew${requestItem.id}');
					return(false)">Aceptar</g:link>
</span> 
<span id="defineRolOfNew${requestItem.id}" style="display:none;float:left"> 
	<g:formRemote
		name="adduser"
		url="[action:'acceptRequest',params:[requestId:requestItem.id]]"
		before="if(!confirm('¿Está seguro de que desea aceptar esta solicitud?')){return false};"
		update="requestsdtable" after="pressClick('#deleteSearchResults')">
		<span style="font-size: 0.8em">Defina el rol del usuario: </span>
		<g:select name="rol_field" from="${rolList.rolDescription}"
			noSelection="['':'-Seleccione']" keys="${rolList.id }" />
		<g:submitButton name="accept_user_button" value="Hecho"
			update="requestsdtable" />
		<button onclick="hide('#defineRolOfNew${requestItem.id}');show_inline('#acceptRequestCommand${requestItem.id}');show_inline('#rejectRequestCommand${requestItem.id}');return(false)">Cancelar</button>
	</g:formRemote>
</span> 
<span id="rejectRequestCommand${requestItem.id}" style="float:left"> 
	<g:remoteLink
		params="${[requestId:requestItem.id]}" action="rejectRequest"
		before="if(!confirm('¿Está seguro de que desea rechazar esta solicitud?')){return false};"
		update="requestsdtable">Rechazar</g:remoteLink>
</span>