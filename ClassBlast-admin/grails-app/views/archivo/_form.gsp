<%@ page import="classblast.admin.Archivo" %>



<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="archivo.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${archivoInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'fileDescription', 'error')} ">
	<label for="fileDescription">
		<g:message code="archivo.fileDescription.label" default="File Description" />
		
	</label>
	<g:textField name="fileDescription" value="${archivoInstance?.fileDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'fileLink', 'error')} ">
	<label for="fileLink">
		<g:message code="archivo.fileLink.label" default="File Link" />
		
	</label>
	<g:textField name="fileLink" value="${archivoInstance?.fileLink}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'fileTitle', 'error')} ">
	<label for="fileTitle">
		<g:message code="archivo.fileTitle.label" default="File Title" />
		
	</label>
	<g:textField name="fileTitle" value="${archivoInstance?.fileTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'fileType', 'error')} required">
	<label for="fileType">
		<g:message code="archivo.fileType.label" default="File Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fileType" from="${classblast.admin.Archivo$Filetype?.values()}" keys="${classblast.admin.Archivo$Filetype.values()*.name()}" required="" value="${archivoInstance?.fileType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="archivo.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${archivoInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'uploadDateOfFile', 'error')} required">
	<label for="uploadDateOfFile">
		<g:message code="archivo.uploadDateOfFile.label" default="Upload Date Of File" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="uploadDateOfFile" precision="day"  value="${archivoInstance?.uploadDateOfFile}"  />
</div>

