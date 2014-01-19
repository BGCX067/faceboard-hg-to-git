<h3>Solicitudes pendientes</h3>
<g:set var='element' value="${mode=='grupo'?'grupo':'parche'}"/>
<p style="font-size: 0.8em";color:gray">
	Estos son los usuarios que han solicitado ser incluidos en el ${element}.
	${mode=='grupo'?'Recuerde que la finalidad del grupo es realizar seguimiento y colaboración'+
		' en una asignatura, por lo tanto solo deben acceder quienes tengan alguna relación con la misma':
		'Los parches son de uso general, procura conocer a quien acepta'}</p>
	<p style="font-size: 0.8em";color:gray">Podrá aceptar las solicitudes, o si lo desea, rechazarlas. El usuario
	no será informado si es rechazado.</p>
<p>
<p>
<div id="requestsdtable">
	<g:render template="/modules/userspanel/requestsdtable" model="${[requestList:requestList]}" />
</div>
</p>