<h3>
	Usuarios en este
	${mode=='grupo'?'grupo':'parche'}
</h3>
<p style="font-size: 0.8em";color:gray">
	Estos son los usuarios que están incluidos en este
	${mode=='grupo'?'grupo':'parche'}. Podrá modificar sus roles, ver sus
	perfiles o si lo desea eliminarlos de los usuarios del
	${mode=='grupo'?'grupo':'parche'}
</p>
<p>
	Buscar
	<g:formRemote name="searchUserInPanel" id="searchUserInPanel"
		url="[action:'searchUserInAdmin']" update="usersdtable"
		before="show('#deleteSearchResults');if( true ) { " after="}">
		<g:textField name="userdescription" />
		<g:select name="modesearch"
			from="${['Por nombre','Por usuario de login','Por correo']}" />
		<g:actionSubmit value=".." id="hidden_search_user_submit" style="display:none"/>
	</g:formRemote>
	<g:remoteLink action="deleteSearchResults" style="display:none" 
					update="usersdtable" id="deleteSearchResults" 
					before="hide('#deleteSearchResults');clear_element('input#userdescription');if(true){" after="}">
		Eliminar busqueda
	</g:remoteLink>
<div id="usersdtable">
	<g:render template="/modules/userspanel/usersdtable" />
</div>
</p>