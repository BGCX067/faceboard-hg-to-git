<%@ page import="classblast.web.Seccion" %>



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

