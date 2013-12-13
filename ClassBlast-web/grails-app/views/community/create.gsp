<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Crear un nuevo parche</title>
</head>
<body>
	<g:form action="createCommunityProcess" name="createCommunityForm"
		class="registerForm">
		<g:img dir="images/icons" file="signup-48.ico" class="middle"
			class="middle leftSideForm" />
		<span>Creación de nuevo parche</span>
		<br />
		<br />
		<g:if test="${errorList.size()>0}">
			<p class="ui-error-validation">
				<g:img dir="images/icons" file="validerror-32.ico" class="middle" />
				No puedes dejar campos vacíos
			</p>
			<br />
		</g:if>
		<label for="communityname">Nombre del parche</label>
		<g:textField name="community_name" />
		<br />
		<br />
		<label for="description">Descripción</label>
		<g:textArea name="community_description"></g:textArea>
		<br />
		<br />
		<label for="course_related">Escoge tags que representen
			palabras clave del parche</label>
		<g:each in="[1,2,3,4,5,6,7,8,9,10]" var="i">
			<g:textField name="tag${i}" style="width:50px;font-size:0.8em" />
		</g:each>
		<br />
		<label>Estado del grupo</label>
		<g:select name="community_state" 
				from="${['Abierto', 'Cerrado']}"
				noSelection="['':'-Seleccione-']"/><br/>
		<g:submitButton name="sbutton" value="Crear parche" />
	</g:form>
</body>
</html>