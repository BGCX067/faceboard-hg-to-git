<%@ page import="classblast.admin.Tema" %>



<div class="fieldcontain ${hasErrors(bean: temaInstance, field: 'sectionRelated', 'error')} required">
	<label for="sectionRelated">
		<g:message code="tema.sectionRelated.label" default="Section Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sectionRelated" name="sectionRelated.id" from="${classblast.admin.Seccion.list()}" optionKey="id" required="" value="${temaInstance?.sectionRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: temaInstance, field: 'topicTitle', 'error')} ">
	<label for="topicTitle">
		<g:message code="tema.topicTitle.label" default="Topic Title" />
		
	</label>
	<g:textField name="topicTitle" value="${temaInstance?.topicTitle}"/>
</div>

