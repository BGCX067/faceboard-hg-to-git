<%@ page import="classblast.web.Apunte" %>



<div class="fieldcontain ${hasErrors(bean: apunteInstance, field: 'section', 'error')} ">
	<label for="section">
		<g:message code="apunte.section.label" default="Section" />
		
	</label>
	<g:select id="section" name="section.id" from="${classblast.web.Seccion.list()}" optionKey="id" value="${apunteInstance?.section?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apunteInstance, field: 'contenidoHtml', 'error')} ">
	<label for="contenidoHtml">
		<g:message code="apunte.contenidoHtml.label" default="Contenido Html" />
		
	</label>
	<g:textField name="contenidoHtml" value="${apunteInstance?.contenidoHtml}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apunteInstance, field: 'fechaApunte', 'error')} required">
	<label for="fechaApunte">
		<g:message code="apunte.fechaApunte.label" default="Fecha Apunte" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaApunte" precision="day"  value="${apunteInstance?.fechaApunte}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: apunteInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="apunte.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${classblast.web.Tema.list()}" optionKey="id" required="" value="${apunteInstance?.topic?.id}" class="many-to-one"/>
</div>

