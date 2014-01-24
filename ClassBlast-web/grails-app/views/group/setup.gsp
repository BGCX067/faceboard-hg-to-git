<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Configurar grupo</title>
</head>
<body>
	<g:if test="${groupNotFound}">
		La url ingresada es inválida
		<g:link onclick="javascript:history.go(-1)"
			url="javascript:history.go(-1)">Volver</g:link>
	</g:if>
	<g:else>
		<g:form action="editGroupProcess" name="editGroupForm"
			class="registerForm" params="[groupid:params.groupid]">
			<g:img dir="images/icons" file="signup-48.ico" class="middle"
				class="middle leftSideForm" />
			<span>Configuración de grupo</span>
			<br />
			<br />

			<label for="groupname">Nombre del grupo</label>
			<g:textField name="group_name" value="${grupo.groupName}" />
			<br />
			<br />
			<label for="description">Descripción</label>
			<g:textArea name="group_description"
				value="${grupo.groupDescription}"></g:textArea>
			<br />
			<label for="course_related">Curso asociado</label>
			<g:select name="course_related" from="${courseList.courseName}"
				noSelection="['':'-Escoge un curso-']" keys="${courseList.id }" value="${grupo.courseRelated.id}" />
			<g:submitButton name="sbutton" value="Guardar cambios" />
		</g:form>
	</g:else>
</body>
</html>