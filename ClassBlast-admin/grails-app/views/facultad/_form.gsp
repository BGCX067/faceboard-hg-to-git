<%@ page import="classblast.admin.Facultad" %>



<div class="fieldcontain ${hasErrors(bean: facultadInstance, field: 'careerList', 'error')} ">
	<label for="careerList">
		<g:message code="facultad.careerList.label" default="Career List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${facultadInstance?.careerList?}" var="c">
    <li><g:link controller="carrera" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carrera" action="create" params="['facultad.id': facultadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carrera.label', default: 'Carrera')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: facultadInstance, field: 'facultyName', 'error')} ">
	<label for="facultyName">
		<g:message code="facultad.facultyName.label" default="Faculty Name" />
		
	</label>
	<g:textField name="facultyName" value="${facultadInstance?.facultyName}"/>
</div>

