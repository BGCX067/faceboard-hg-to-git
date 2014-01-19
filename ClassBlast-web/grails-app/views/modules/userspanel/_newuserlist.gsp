
<p style="font-size: 0.8em";color:gray">
	Buscar usuarios para agregar al
	${mode=='grupo'?'grupo':'parche'}.
	<g:formRemote name="searchNewUserInPanel" id="searchNewUserInPanel"
		url="[action:'searchNewUserInAdmin']" update="newusersdtable">
		<g:textField name="newuserdescription" />
	</g:formRemote>
<div id="newusersdtable">
	<g:render template="/modules/userspanel/newusersdtable" model="${['userList':[]]}"/>
</div>
</p>