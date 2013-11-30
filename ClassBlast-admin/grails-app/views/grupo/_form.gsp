<%@ page import="classblast.admin.Grupo" %>



<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'courseRelated', 'error')} required">
	<label for="courseRelated">
		<g:message code="grupo.courseRelated.label" default="Course Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseRelated" name="courseRelated.id" from="${classblast.admin.Curso.list()}" optionKey="id" required="" value="${grupoInstance?.courseRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'courseSection', 'error')} required">
	<label for="courseSection">
		<g:message code="grupo.courseSection.label" default="Course Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseSection" name="courseSection.id" from="${classblast.admin.Seccion.list()}" optionKey="id" required="" value="${grupoInstance?.courseSection?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="grupo.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${grupoInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'fileList', 'error')} ">
	<label for="fileList">
		<g:message code="grupo.fileList.label" default="File List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${grupoInstance?.fileList?}" var="f">
    <li><g:link controller="archivo" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="archivo" action="create" params="['grupo.id': grupoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'archivo.label', default: 'Archivo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'groupDescription', 'error')} ">
	<label for="groupDescription">
		<g:message code="grupo.groupDescription.label" default="Group Description" />
		
	</label>
	<g:textField name="groupDescription" value="${grupoInstance?.groupDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'groupName', 'error')} ">
	<label for="groupName">
		<g:message code="grupo.groupName.label" default="Group Name" />
		
	</label>
	<g:textField name="groupName" value="${grupoInstance?.groupName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'groupRolList', 'error')} ">
	<label for="groupRolList">
		<g:message code="grupo.groupRolList.label" default="Group Rol List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${grupoInstance?.groupRolList?}" var="g">
    <li><g:link controller="rol" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rol" action="create" params="['grupo.id': grupoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'groupState', 'error')} required">
	<label for="groupState">
		<g:message code="grupo.groupState.label" default="Group State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="groupState" from="${classblast.admin.Grupo$GroupState?.values()}" keys="${classblast.admin.Grupo$GroupState.values()*.name()}" required="" value="${grupoInstance?.groupState?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'homeworkList', 'error')} ">
	<label for="homeworkList">
		<g:message code="grupo.homeworkList.label" default="Homework List" />
		
	</label>
	<g:select name="homeworkList" from="${classblast.admin.Tarea.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.homeworkList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'meetingList', 'error')} ">
	<label for="meetingList">
		<g:message code="grupo.meetingList.label" default="Meeting List" />
		
	</label>
	<g:select name="meetingList" from="${classblast.admin.Mesaredonda.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.meetingList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'postList', 'error')} ">
	<label for="postList">
		<g:message code="grupo.postList.label" default="Post List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${grupoInstance?.postList?}" var="p">
    <li><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publicacion" action="create" params="['grupo.id': grupoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publicacion.label', default: 'Publicacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'userList', 'error')} ">
	<label for="userList">
		<g:message code="grupo.userList.label" default="User List" />
		
	</label>
	
</div>

