<g:applyLayout name="basic">
	<title><g:layoutTitle default="Grails" /></title>
	<head>
		<g:layoutHead />
	</head>
	<body>
		<content tag="userinfocontent">
		<g:link controller="user" action="login">Ingresar</g:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<g:link controller="user" action="register">Registrarse</g:link>
		</content>
		<g:layoutBody />
	</body>
</g:applyLayout>
