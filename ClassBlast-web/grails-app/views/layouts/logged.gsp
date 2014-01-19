<g:applyLayout name="basic">
	<head>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mainmenu.css')}"
		type="text/css">
		<g:layoutHead />
		<title><g:layoutTitle default="Grails"/></title>
	</head>
	<body>
		<content tag="userinfocontent"> 
			<g:link controller="profile">
			<span style="color:white">${session["user"].login }</span>
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link >
			<g:img class="middle" dir="images/icons" file="notification-24.ico"></g:img>
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link onclick="showChat();return false">
			<g:img class="middle" dir="images/icons" file="chat-24.ico" onclick="return false"></g:img>
			</g:link>
			&nbsp;&nbsp;&nbsp;
			<g:link controller="user" action="logout" >
			<g:img class="middle" dir="images/icons" file="logout-32.ico"></g:img>
			</g:link>
		 </content>
		 <content tag="userchat">
		 <div id="chat_container">
		 	<h5>CHAT PÚBLICO
		 	<g:link onclick="hideChat();return false" style="float:right">Ocultar</g:link>
		 	</h5>
		 	<div id="messages_subcontainer">
		 		<g:render template="/modules/chat/mymessagechat" model="['myerrormessage':'no','mymessagelist':[]]"/>
		 	</div>
		 	<br/><g:link controller="chat" action="seeMoreMessages()" update="messages_subcontainer">
		 			Cargar mensajes anteriores
		 		</g:link>
		 	<g:formRemote name="updateRemote" url="[controller:'chat',action:'refreshPanel']"
		 	update="messages_subcontainer">
		 		<g:hiddenField name="numberOfMessages" id="numberOfMessages" value="10"/>
		 		<g:actionSubmit value="Actualizar" style="display:none" id="updateRemoteButton"/>
		 	</g:formRemote>
		 	<g:formRemote name="chatRemote" url="[controller:'chat',action:'sendPublicMessage']"
		 	update="messages_subcontainer">
		 		<g:textArea name="messagetosend"></g:textArea>
		 		<g:actionSubmit value="Enviar" name="sendMessageButton"/>
		 	</g:formRemote>
		 </div>
		 </content> 
		<g:layoutBody />
	</body>
</g:applyLayout>
