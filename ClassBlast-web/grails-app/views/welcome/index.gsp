<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast - Inicio</title>
</head>
<body>
	<table class="index">
		<tr>
			<td colspan="3" id="head" class="index">
			</td>
			<td class="index">
				<g:link controller="user" action="logout">
				<!--<g:img height="50px" dir="images" file="logout.jpg" class="middle" />-->
				<h3>Cerrar Sesión</h3>
				</g:link>
			</td> 
		</tr>
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