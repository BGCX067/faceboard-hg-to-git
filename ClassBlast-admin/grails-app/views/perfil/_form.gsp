<%@ page import="classblast.admin.Perfil" %>



<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="perfil.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${perfilInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'genericRol', 'error')} required">
	<label for="genericRol">
		<g:message code="perfil.genericRol.label" default="Generic Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genericRol" name="genericRol.id" from="${classblast.admin.Rol.list()}" optionKey="id" required="" value="${perfilInstance?.genericRol?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'profileDescription', 'error')} ">
	<label for="profileDescription">
		<g:message code="perfil.profileDescription.label" default="Profile Description" />
		
	</label>
	<g:textField name="profileDescription" value="${perfilInstance?.profileDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'profileOwner', 'error')} required">
	<label for="profileOwner">
		<g:message code="perfil.profileOwner.label" default="Profile Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profileOwner" name="profileOwner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${perfilInstance?.profileOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="perfil.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${perfilInstance?.username}"/>
</div>

