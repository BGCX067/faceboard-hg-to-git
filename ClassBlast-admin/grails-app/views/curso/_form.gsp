<%@ page import="classblast.admin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'bookList', 'error')} ">
	<label for="bookList">
		<g:message code="curso.bookList.label" default="Book List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursoInstance?.bookList?}" var="b">
    <li><g:link controller="cuaderno" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cuaderno" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cuaderno.label', default: 'Cuaderno')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'careerList', 'error')} ">
	<label for="careerList">
		<g:message code="curso.careerList.label" default="Career List" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'courseName', 'error')} ">
	<label for="courseName">
		<g:message code="curso.courseName.label" default="Course Name" />
		
	</label>
	<g:textField name="courseName" value="${cursoInstance?.courseName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'facultyList', 'error')} ">
	<label for="facultyList">
		<g:message code="curso.facultyList.label" default="Faculty List" />
		
	</label>
	<g:select name="facultyList" from="${classblast.admin.Facultad.list()}" multiple="multiple" optionKey="id" size="5" value="${cursoInstance?.facultyList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'groupList', 'error')} ">
	<label for="groupList">
		<g:message code="curso.groupList.label" default="Group List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursoInstance?.groupList?}" var="g">
    <li><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grupo" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grupo.label', default: 'Grupo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'semesterList', 'error')} ">
	<label for="semesterList">
		<g:message code="curso.semesterList.label" default="Semester List" />
		
	</label>
	<g:select name="semesterList" from="${classblast.admin.Semestre.list()}" multiple="multiple" optionKey="id" size="5" value="${cursoInstance?.semesterList*.id}" class="many-to-many"/>
</div>

