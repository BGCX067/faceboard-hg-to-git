<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Bienvenido a ClassBlast - Inicio</title>
</head>
<body>
	<g:render template="/modules/mainmenu" model="${[groupList:groupList,communityList:communityList]}"/>
	<table class="index">
		<tr>
			<td colspan="2" id="main" class="index">
			<h3>Hoy</h3>
			</td>
			<td colspan="2" id="main" class="index">
			<h3>Recent</h3>
			</td> 
		</tr>
		<tr>
			<td id="footer" class="index">
				<g:link controller="user" action="recover">
				<!--<g:img height="50px" dir="images" file="libro.jpg" class="middle" class="middle leftSideForm" />-->
				<h3>Mis Cursos</h3>
				</g:link>
			</td>
			<td id="footer" class="index">
				<g:link controller="user" action="recover">
				<!--<g:img height="50px" dir="images" file="estrella.png" class="middle" class="middle leftSideForm" />-->
				<h3>Favoritos</h3>
				</g:link>
			</td>
			<td id="footer" class="index">
				<g:link controller="user" action="recover">
				<!--<g:img height="50px" dir="images" file="mesa.png" class="middle" class="middle leftSideForm" />-->
				<h3>Mis Mesas</h3>
				</g:link>
			</td>
			<td id="footer" class="index">
				<g:link controller="user" action="recover">
				<!--<g:img height="50px" dir="images" file="explora.jpg" class="middle" class="middle leftSideForm" />-->
				<h3>Explora</h3>
				</g:link>
			</td>
		</tr>
	</table>
</body>
</html>