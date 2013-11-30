<%@ page import="classblast.admin.Mesaredonda" %>



<div class="fieldcontain ${hasErrors(bean: mesaredondaInstance, field: 'entryList', 'error')} ">
	<label for="entryList">
		<g:message code="mesaredonda.entryList.label" default="Entry List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${mesaredondaInstance?.entryList?}" var="e">
    <li><g:link controller="participacion" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="participacion" action="create" params="['mesaredonda.id': mesaredondaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'participacion.label', default: 'Participacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: mesaredondaInstance, field: 'meetingDate', 'error')} required">
	<label for="meetingDate">
		<g:message code="mesaredonda.meetingDate.label" default="Meeting Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="meetingDate" precision="day"  value="${mesaredondaInstance?.meetingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: mesaredondaInstance, field: 'meetingRolList', 'error')} ">
	<label for="meetingRolList">
		<g:message code="mesaredonda.meetingRolList.label" default="Meeting Rol List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${mesaredondaInstance?.meetingRolList?}" var="m">
    <li><g:link controller="rol" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rol" action="create" params="['mesaredonda.id': mesaredondaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: mesaredondaInstance, field: 'meetingTopic', 'error')} ">
	<label for="meetingTopic">
		<g:message code="mesaredonda.meetingTopic.label" default="Meeting Topic" />
		
	</label>
	<g:textField name="meetingTopic" value="${mesaredondaInstance?.meetingTopic}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mesaredondaInstance, field: 'partakerList', 'error')} ">
	<label for="partakerList">
		<g:message code="mesaredonda.partakerList.label" default="Partaker List" />
		
	</label>
	
</div>

