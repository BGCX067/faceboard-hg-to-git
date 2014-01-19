<g:applyLayout name="basic">
	<title><g:layoutTitle default="Grails" /></title>
	<head>
<g:layoutHead />
	</head>
	<body>
		<content tag="userinfocontent"> <g:link controller="user"
			action="login">
			<p id="loginTools">Ingresar</p>
		</g:link> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <g:link controller="user"
			action="register">
			<p id="loginTools">Registrarse</p>
		</g:link> </content>
		<content tag="userchat"> &nbsp; </content>
		<g:layoutBody />
	</body>
</g:applyLayout>
