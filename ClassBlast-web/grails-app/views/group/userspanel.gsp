<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Grupo - panel de control</title>

</head>
<body>
	<div id="con">
		<div id="ma" class="divi">
			<h2>
				<g:link controller="group" params="${[groupid:grupo.id]}">
					${grupo.groupName}
				</g:link>
			</h2>
			<p style="color: #AAAAAA; padding: 5px 5px;">
				${grupo.groupDescription}
			</p>
			<g:render template="/modules/userspanel/userList"
				model="${[mode:'grupo',userList:grupo.userList]}" />
			<g:if test="${pendingRequestList.size()>0}">
				<g:render template="/modules/userspanel/requestpending"
					model="${[mode:'grupo',requestList:pendingRequestList]}" />
			</g:if>
			<g:render template="/modules/userspanel/newuserlist"
				model="${[mode:'grupo',userList:grupo.userList]}" />
		</div>
		<div id="me" class="divi">
			<g:if test="${isUserInGroup}">
				<g:render template="/modules/groupmenu" model="${[group:group]}" />
			</g:if>
			<g:render template="/modules/mainmenu"
				model="${[groupList:groupList,communityList:communityList]}" />
		</div>
	</div>
</body>
</html>