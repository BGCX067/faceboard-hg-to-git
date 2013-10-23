<!DOCTYPE html>
<head>
<g:set var="controller" value="${myDomainObjList[0]}" />
<meta name="layout" content="basic" />
<title>Bienvenido a ClassBlast</title>
</head>
<body>
	<table width="100%" border="1" height="400px" bordercolor="#ffffff">
  <tr>
    <td height="300px" colspan="4" ><center><g:img dir="images" file="Propuesta 3.png" class="middle" /></center></td>
  </tr>
  <tr>
    <td width="25%"><center><b>Explora</b></center></td>
    <td width="25%"><center><b>Acerca</b></center></td>
    <td width="25%"><center><b><g:link controller="user" action="login">
	Ingresa
	</g:link></center></b></td>
    <td  width="25%"><center><b><g:link controller="user" action="register">
	Regístrate
	</g:link></center></b></td>
  </tr>
</table>	
</body>
</html>