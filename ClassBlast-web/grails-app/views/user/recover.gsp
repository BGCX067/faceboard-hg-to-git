<!DOCTYPE html>
<head>
<meta name="layout" content="nologged" />
<title>Bienvenido a ClassBlast - Recuperación de contraseña</title>
</head>
<body>
	<script type="text/javascript">
		function validateRecoverEmail() {
			return true;
		}
	</script>
	<div id="sectionRecover">
		<g:render template="/modules/recoverform" model="['send':send]"/>
	</div>


</body>
</html>