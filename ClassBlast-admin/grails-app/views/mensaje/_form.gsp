<%@ page import="classblast.admin.Mensaje" %>



<div class="fieldcontain ${hasErrors(bean: mensajeInstance, field: 'conversation', 'error')} required">
	<label for="conversation">
		<g:message code="mensaje.conversation.label" default="Conversation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conversation" name="conversation.id" from="${classblast.admin.Conversacion.list()}" optionKey="id" required="" value="${mensajeInstance?.conversation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensajeInstance, field: 'dateMessage', 'error')} required">
	<label for="dateMessage">
		<g:message code="mensaje.dateMessage.label" default="Date Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateMessage" precision="day"  value="${mensajeInstance?.dateMessage}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: mensajeInstance, field: 'ownerMessage', 'error')} required">
	<label for="ownerMessage">
		<g:message code="mensaje.ownerMessage.label" default="Owner Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ownerMessage" name="ownerMessage.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${mensajeInstance?.ownerMessage?.id}" class="many-to-one"/>
</div>

