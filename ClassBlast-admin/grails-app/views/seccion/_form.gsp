<%@ page import="classblast.admin.Seccion" %>



<div class="fieldcontain ${hasErrors(bean: seccionInstance, field: 'groupRelated', 'error')} ">
	<label for="groupRelated">
		<g:message code="seccion.groupRelated.label" default="Group Related" />
		
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" value="${seccionInstance?.groupRelated?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seccionInstance, field: 'bookRelated', 'error')} ">
	<label for="bookRelated">
		<g:message code="seccion.bookRelated.label" default="Book Related" />
		
	</label>
	<g:select id="bookRelated" name="bookRelated.id" from="${classblast.admin.Cuaderno.list()}" optionKey="id" value="${seccionInstance?.bookRelated?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seccionInstance, field: 'noteList', 'error')} ">
	<label for="noteList">
		<g:message code="seccion.noteList.label" default="Note List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${seccionInstance?.noteList?}" var="n">
    <li><g:link controller="apunte" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="apunte" action="create" params="['seccion.id': seccionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'apunte.label', default: 'Apunte')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: seccionInstance, field: 'sectionName', 'error')} ">
	<label for="sectionName">
		<g:message code="seccion.sectionName.label" default="Section Name" />
		
	</label>
	<g:textField name="sectionName" value="${seccionInstance?.sectionName}"/>
</div>

