<%@ page import="classblast.admin.Privilegio" %>



<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'privilegeDescription', 'error')} ">
	<label for="privilegeDescription">
		<g:message code="privilegio.privilegeDescription.label" default="Privilege Description" />
		
	</label>
	<g:textField name="privilegeDescription" value="${privilegioInstance?.privilegeDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'privilegeValue', 'error')} ">
	<label for="privilegeValue">
		<g:message code="privilegio.privilegeValue.label" default="Privilege Value" />
		
	</label>
	<g:checkBox name="privilegeValue" value="${privilegioInstance?.privilegeValue}" />
</div>

<div class="fieldcontain ${hasErrors(bean: privilegioInstance, field: 'rolList', 'error')} ">
	<label for="rolList">
		<g:message code="privilegio.rolList.label" default="Rol List" />
		
	</label>
	<g:select name="rolList" from="${classblast.admin.Rol.list()}" multiple="multiple" optionKey="id" size="5" value="${privilegioInstance?.rolList*.id}" class="many-to-many"/>
</div>

