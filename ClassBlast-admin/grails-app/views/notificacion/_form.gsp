<%@ page import="classblast.admin.Notificacion" %>



<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'communityRelated', 'error')} required">
	<label for="communityRelated">
		<g:message code="notificacion.communityRelated.label" default="Community Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="communityRelated" name="communityRelated.id" from="${classblast.admin.Parche.list()}" optionKey="id" required="" value="${notificacionInstance?.communityRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'groupRelated', 'error')} required">
	<label for="groupRelated">
		<g:message code="notificacion.groupRelated.label" default="Group Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${notificacionInstance?.groupRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'meetingRelated', 'error')} required">
	<label for="meetingRelated">
		<g:message code="notificacion.meetingRelated.label" default="Meeting Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="meetingRelated" name="meetingRelated.id" from="${classblast.admin.Mesaredonda.list()}" optionKey="id" required="" value="${notificacionInstance?.meetingRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'notificationDate', 'error')} required">
	<label for="notificationDate">
		<g:message code="notificacion.notificationDate.label" default="Notification Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="notificationDate" precision="day"  value="${notificacionInstance?.notificationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'notificationType', 'error')} required">
	<label for="notificationType">
		<g:message code="notificacion.notificationType.label" default="Notification Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="notificationType" from="${classblast.admin.Notificacion$NotificationType?.values()}" keys="${classblast.admin.Notificacion$NotificationType.values()*.name()}" required="" value="${notificacionInstance?.notificationType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'postRelated', 'error')} required">
	<label for="postRelated">
		<g:message code="notificacion.postRelated.label" default="Post Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="postRelated" name="postRelated.id" from="${classblast.admin.Publicacion.list()}" optionKey="id" required="" value="${notificacionInstance?.postRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'talkRelated', 'error')} required">
	<label for="talkRelated">
		<g:message code="notificacion.talkRelated.label" default="Talk Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="talkRelated" name="talkRelated.id" from="${classblast.admin.Conversacion.list()}" optionKey="id" required="" value="${notificacionInstance?.talkRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: notificacionInstance, field: 'userRelated', 'error')} required">
	<label for="userRelated">
		<g:message code="notificacion.userRelated.label" default="User Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userRelated" name="userRelated.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${notificacionInstance?.userRelated?.id}" class="many-to-one"/>
</div>

