<!DOCTYPE html>
<head>

<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast - Inicio</title>
</head>
<body>
	<table width="100%">
	<tr>
	<td width="85%"><b>HOME</b></td>
	<td><b><g:link controller="user" action="logout">
    <g:img height="50px" dir="images" file="logout.jpg" class="middle" />
	Cerrar Sesión
	</g:link></b>
	</td>
	</tr>
	</table>
	
	
	<table width="100%" border="1" height="400px" bordercolor="#ffffff">
  <tr>
    <td height="400px" width="33%"><center><b>Actividad Reciente</b></center></td>
    <td width="33%"><center><b>Hoy</b></center></td>
    <td width="33%"><center><b>Importante</b></center></td>

  </tr>
  </table>
  	<table width="100%" border="1" height="100px" bordercolor="#ffffff">
  <tr>
    <td width="25%"><center><b><g:link controller="user" action="recover">
    <g:img height="50px" dir="images" file="libro.jpg" class="middle"
		class="middle leftSideForm" />
	Mis Cursos
	</g:link></center></b></td>
    <td width="25%"><center><b><g:link controller="user" action="recover">
    <g:img height="50px" dir="images" file="estrella.png" class="middle"
	class="middle leftSideForm" />
	Favoritos
	</g:link></center></b></td>
    <td width="25%"><center><b><g:link controller="user" action="recover">
    <g:img height="50px" dir="images" file="mesa.png" class="middle"
	class="middle leftSideForm" />
	Mis Mesas
	</g:link></center></b></td>
    <td  width="25%"><center><b><g:link controller="user" action="recover">
    <g:img height="50px" dir="images" file="explora.jpg" class="middle"
	class="middle leftSideForm" />
	Explora
	</g:link></center></b></td>
  </tr>
</table>	
</body>
</html>