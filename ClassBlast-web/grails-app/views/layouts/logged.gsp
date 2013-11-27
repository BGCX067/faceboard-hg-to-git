<g:applyLayout name="basic">
	<title><g:layoutTitle default="Grails" /></title>
	<head>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mainmenu.css')}"
		type="text/css">
		<g:layoutHead />
	</head>
	<body>
		<content tag="userinfocontent"> 
			<g:link >
			${session["user"].login }
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link >
			<g:img class="middle" dir="images/icons" file="notification-24.ico"></g:img>
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link >
			<g:img class="middle" dir="images/icons" file="chat-24.ico"></g:img>
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link controller="user" action="logout" >
			<g:img class="middle" dir="images/icons" file="logout-32.ico"></g:img>
			</g:link>
		 </content>
		<g:layoutBody />
	</body>
</g:applyLayout>
