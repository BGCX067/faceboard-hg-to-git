<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Crear un nuevo grupo</title>
</head>
<body>
	<g:form action="createGroupProcess" name="createGroupForm"
		class="registerForm">
		<g:img dir="images/icons" file="signup-48.ico" class="middle"
			class="middle leftSideForm" />
		<span>Creación de nuevo grupo</span>
		<br />
		<br />
		<g:if test="${errorList.size()>0}">
			<p class="ui-error-validation">
				<g:img dir="images/icons" file="validerror-32.ico" class="middle" />
				No puedes dejar campos vacíos
			</p>
			<br />
		</g:if>
		<label for="groupname">Nombre del grupo</label>
		<g:textField name="group_name" />
		<br />
		<br />
		<label for="description">Descripción</label>
		<g:textArea name="group_description"></g:textArea>
		<br />
		<br />
		<label for="course_related">Curso asociado</label>
		<g:select name="course_related" from="${courseList.courseName}"
			noSelection="['':'-Escoge un curso-']" keys="${courseList.id }" />
		<br />
		<br />
		<g:submitButton name="sbutton" value="Crear grupo" />
	</g:form>
</body>
</html>