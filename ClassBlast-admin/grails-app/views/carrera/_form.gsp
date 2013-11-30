<%@ page import="classblast.admin.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'careerName', 'error')} ">
	<label for="careerName">
		<g:message code="carrera.careerName.label" default="Career Name" />
		
	</label>
	<g:textField name="careerName" value="${carreraInstance?.careerName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'courseList', 'error')} ">
	<label for="courseList">
		<g:message code="carrera.courseList.label" default="Course List" />
		
	</label>
	<g:select name="courseList" from="${classblast.admin.Curso.list()}" multiple="multiple" optionKey="id" size="5" value="${carreraInstance?.courseList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'faculty', 'error')} required">
	<label for="faculty">
		<g:message code="carrera.faculty.label" default="Faculty" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="faculty" name="faculty.id" from="${classblast.admin.Facultad.list()}" optionKey="id" required="" value="${carreraInstance?.faculty?.id}" class="many-to-one"/>
</div>

