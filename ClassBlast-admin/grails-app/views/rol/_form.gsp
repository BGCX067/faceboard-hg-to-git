<%@ page import="classblast.admin.Rol" %>



<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'communityRelated', 'error')} required">
	<label for="communityRelated">
		<g:message code="rol.communityRelated.label" default="Community Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="communityRelated" name="communityRelated.id" from="${classblast.admin.Parche.list()}" optionKey="id" required="" value="${rolInstance?.communityRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'groupRelated', 'error')} required">
	<label for="groupRelated">
		<g:message code="rol.groupRelated.label" default="Group Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${rolInstance?.groupRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'meetingRelated', 'error')} required">
	<label for="meetingRelated">
		<g:message code="rol.meetingRelated.label" default="Meeting Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="meetingRelated" name="meetingRelated.id" from="${classblast.admin.Mesaredonda.list()}" optionKey="id" required="" value="${rolInstance?.meetingRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'rolOwner', 'error')} required">
	<label for="rolOwner">
		<g:message code="rol.rolOwner.label" default="Rol Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rolOwner" name="rolOwner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${rolInstance?.rolOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'rolType', 'error')} required">
	<label for="rolType">
		<g:message code="rol.rolType.label" default="Rol Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rolType" name="rolType.id" from="${classblast.admin.TipoRol.list()}" optionKey="id" required="" value="${rolInstance?.rolType?.id}" class="many-to-one"/>
</div>

