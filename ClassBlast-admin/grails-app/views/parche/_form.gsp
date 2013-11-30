<%@ page import="classblast.admin.Parche" %>



<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'communityDescription', 'error')} ">
	<label for="communityDescription">
		<g:message code="parche.communityDescription.label" default="Community Description" />
		
	</label>
	<g:textField name="communityDescription" value="${parcheInstance?.communityDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'communityName', 'error')} ">
	<label for="communityName">
		<g:message code="parche.communityName.label" default="Community Name" />
		
	</label>
	<g:textField name="communityName" value="${parcheInstance?.communityName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'communityRolList', 'error')} ">
	<label for="communityRolList">
		<g:message code="parche.communityRolList.label" default="Community Rol List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${parcheInstance?.communityRolList?}" var="c">
    <li><g:link controller="rol" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rol" action="create" params="['parche.id': parcheInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'communityType', 'error')} required">
	<label for="communityType">
		<g:message code="parche.communityType.label" default="Community Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="communityType" from="${classblast.admin.Parche$CommunityType?.values()}" keys="${classblast.admin.Parche$CommunityType.values()*.name()}" required="" value="${parcheInstance?.communityType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'courseRelated', 'error')} required">
	<label for="courseRelated">
		<g:message code="parche.courseRelated.label" default="Course Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseRelated" name="courseRelated.id" from="${classblast.admin.Curso.list()}" optionKey="id" required="" value="${parcheInstance?.courseRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="parche.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${parcheInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'postList', 'error')} ">
	<label for="postList">
		<g:message code="parche.postList.label" default="Post List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${parcheInstance?.postList?}" var="p">
    <li><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publicacion" action="create" params="['parche.id': parcheInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publicacion.label', default: 'Publicacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'semesterRelated', 'error')} required">
	<label for="semesterRelated">
		<g:message code="parche.semesterRelated.label" default="Semester Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="semesterRelated" name="semesterRelated.id" from="${classblast.admin.Semestre.list()}" optionKey="id" required="" value="${parcheInstance?.semesterRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parcheInstance, field: 'userList', 'error')} ">
	<label for="userList">
		<g:message code="parche.userList.label" default="User List" />
		
	</label>
	
</div>

