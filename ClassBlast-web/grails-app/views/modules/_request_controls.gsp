<span id="request_group"> <g:formRemote name="send_request"
		url="[action:'sendRequest']" update="request_group">
		<g:actionSubmit value="Solicitar Ingreso" disabled="${isRequestSent}" />
	</g:formRemote> <g:if test="${isRequestSent}">
		<g:formRemote name="cancel_request" url="[action:'cancelRequest']"
			update="request_group">
			<span>Solicitud enviada</span>
			<g:actionSubmit value="Cancelar solicitud" />
		</g:formRemote>
	</g:if>
</span>
