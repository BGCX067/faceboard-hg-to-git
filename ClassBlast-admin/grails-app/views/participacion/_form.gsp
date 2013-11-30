<%@ page import="classblast.admin.Participacion" %>



<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'beginningDate', 'error')} required">
	<label for="beginningDate">
		<g:message code="participacion.beginningDate.label" default="Beginning Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginningDate" precision="day"  value="${participacionInstance?.beginningDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="participacion.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${participacionInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'endingDate', 'error')} required">
	<label for="endingDate">
		<g:message code="participacion.endingDate.label" default="Ending Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endingDate" precision="day"  value="${participacionInstance?.endingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="participacion.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grade" value="${fieldValue(bean: participacionInstance, field: 'grade')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'image1', 'error')} ">
	<label for="image1">
		<g:message code="participacion.image1.label" default="Image1" />
		
	</label>
	<g:textField name="image1" value="${participacionInstance?.image1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'image2', 'error')} ">
	<label for="image2">
		<g:message code="participacion.image2.label" default="Image2" />
		
	</label>
	<g:textField name="image2" value="${participacionInstance?.image2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'image3', 'error')} ">
	<label for="image3">
		<g:message code="participacion.image3.label" default="Image3" />
		
	</label>
	<g:textField name="image3" value="${participacionInstance?.image3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'meetingRelated', 'error')} required">
	<label for="meetingRelated">
		<g:message code="participacion.meetingRelated.label" default="Meeting Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="meetingRelated" name="meetingRelated.id" from="${classblast.admin.Mesaredonda.list()}" optionKey="id" required="" value="${participacionInstance?.meetingRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participacionInstance, field: 'userRelated', 'error')} required">
	<label for="userRelated">
		<g:message code="participacion.userRelated.label" default="User Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userRelated" name="userRelated.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${participacionInstance?.userRelated?.id}" class="many-to-one"/>
</div>

