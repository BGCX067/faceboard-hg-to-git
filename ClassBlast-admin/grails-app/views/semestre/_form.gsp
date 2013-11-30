<%@ page import="classblast.admin.Semestre" %>



<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'period', 'error')} required">
	<label for="period">
		<g:message code="semestre.period.label" default="Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="period" type="number" value="${semestreInstance.period}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="semestre.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${semestreInstance.year}" required=""/>
</div>

