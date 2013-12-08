<%@ page import="classblast.admin.TipoRol" %>



<div class="fieldcontain ${hasErrors(bean: tipoRolInstance, field: 'privilegeList', 'error')} ">
	<label for="privilegeList">
		<g:message code="tipoRol.privilegeList.label" default="Privilege List" />
		
	</label>
	<g:select name="privilegeList" from="${classblast.admin.Privilegio.list()}" multiple="multiple" optionKey="id" size="5" value="${tipoRolInstance?.privilegeList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoRolInstance, field: 'rolDescription', 'error')} ">
	<label for="rolDescription">
		<g:message code="tipoRol.rolDescription.label" default="Rol Description" />
		
	</label>
	<g:textField name="rolDescription" value="${tipoRolInstance?.rolDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoRolInstance, field: 'rolList', 'error')} ">
	<label for="rolList">
		<g:message code="tipoRol.rolList.label" default="Rol List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoRolInstance?.rolList?}" var="r">
    <li><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rol" action="create" params="['tipoRol.id': tipoRolInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoRolInstance, field: 'rolType', 'error')} ">
	<label for="rolType">
		<g:message code="tipoRol.rolType.label" default="Rol Type" />
		
	</label>
	<g:textField name="rolType" value="${tipoRolInstance?.rolType}"/>
</div>

