<%@ page import="classblast.admin.Solicitud" %>



<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'communityRelated', 'error')} required">
	<label for="communityRelated">
		<g:message code="solicitud.communityRelated.label" default="Community Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="communityRelated" name="communityRelated.id" from="${classblast.admin.Parche.list()}" optionKey="id" required="" value="${solicitudInstance?.communityRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'groupRelated', 'error')} required">
	<label for="groupRelated">
		<g:message code="solicitud.groupRelated.label" default="Group Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${solicitudInstance?.groupRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'requestDate', 'error')} required">
	<label for="requestDate">
		<g:message code="solicitud.requestDate.label" default="Request Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="requestDate" precision="day"  value="${solicitudInstance?.requestDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'requestState', 'error')} required">
	<label for="requestState">
		<g:message code="solicitud.requestState.label" default="Request State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="requestState" from="${classblast.admin.Solicitud$RequestState?.values()}" keys="${classblast.admin.Solicitud$RequestState.values()*.name()}" required="" value="${solicitudInstance?.requestState?.name()}"/>
</div>

