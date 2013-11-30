<%@ page import="classblast.admin.Cuaderno" %>



<div class="fieldcontain ${hasErrors(bean: cuadernoInstance, field: 'bookName', 'error')} ">
	<label for="bookName">
		<g:message code="cuaderno.bookName.label" default="Book Name" />
		
	</label>
	<g:textField name="bookName" value="${cuadernoInstance?.bookName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cuadernoInstance, field: 'bookOwner', 'error')} required">
	<label for="bookOwner">
		<g:message code="cuaderno.bookOwner.label" default="Book Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bookOwner" name="bookOwner.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${cuadernoInstance?.bookOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cuadernoInstance, field: 'courseRelated', 'error')} required">
	<label for="courseRelated">
		<g:message code="cuaderno.courseRelated.label" default="Course Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseRelated" name="courseRelated.id" from="${classblast.admin.Curso.list()}" optionKey="id" required="" value="${cuadernoInstance?.courseRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cuadernoInstance, field: 'sectionList', 'error')} ">
	<label for="sectionList">
		<g:message code="cuaderno.sectionList.label" default="Section List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cuadernoInstance?.sectionList?}" var="s">
    <li><g:link controller="seccion" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="seccion" action="create" params="['cuaderno.id': cuadernoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'seccion.label', default: 'Seccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cuadernoInstance, field: 'semesterRelated', 'error')} required">
	<label for="semesterRelated">
		<g:message code="cuaderno.semesterRelated.label" default="Semester Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="semesterRelated" name="semesterRelated.id" from="${classblast.admin.Semestre.list()}" optionKey="id" required="" value="${cuadernoInstance?.semesterRelated?.id}" class="many-to-one"/>
</div>

