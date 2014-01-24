<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Configurar parche</title>
</head>
<body>
	<g:if test="${communityNotFound}">
		La url ingresada es inválida
		<g:link onclick="javascript:history.go(-1)"
			url="javascript:history.go(-1)">Volver</g:link>
	</g:if>
	<g:else>
		<g:form action="editCommunityProcess" name="editCommunityForm"
			class="registerForm" params="[communityid:params.communityid]">
			<g:img dir="images/icons" file="signup-48.ico" class="middle"
				class="middle leftSideForm" />
			<span>Configuración de parche</span>
			<br />
			<br />
			
			<label for="communityname">Nombre del parche</label>
			<g:textField name="community_name" value="${parche.communityName}" />
			<br />
			<br />
			<label for="description">Descripción</label>
			<g:textArea name="community_description"
				value="${parche.communityDescription}"></g:textArea>
			<br />
			<br />
			<label for="course_related">Escoge tags que representen
				palabras clave del parche</label>
			<g:set var="i" value="${0}"/>
			<g:each in="${parche.tagList}" var="tagItem">
				<g:textField name="tag${++i}"  value="${tagItem.tagDescription}"
				style="width:50px;font-size:0.8em" />
			</g:each>
			<g:each in="${1..tagListFree}" var="i">
				<g:textField name="tag${parche.tagList.size()+i}"
					style="width:50px;font-size:0.8em" />
			</g:each>
			<br />
			<label>Estado del grupo</label>
			<g:select name="community_state" from="${['Abierto', 'Cerrado']}"
				noSelection="['':'-Seleccione-']" value="${parche.communityType}" />
			<br />
			<g:submitButton name="sbutton" value="Guardar cambios" />
		</g:form>
	</g:else>
</body>
</html>