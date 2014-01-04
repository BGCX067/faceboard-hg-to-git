<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>parche - panel de control</title>

</head>
<body>
	<div id="con">
		<div id="ma" class="divi">
			<h2>
				<g:link controller="group" params="${[communityid:parche.id]}">
					${parche.communityName}
				</g:link>
			</h2>
			<p style="color: #AAAAAA; padding: 5px 5px;">
				${parche.communityDescription}
			</p>
			<g:render template="/modules/userspanel/userList"
				model="${[mode:'parche',userList:parche.userList]}" />
			<g:if test="${pendingRequestList.size()>0}">
				<g:render template="/modules/userspanel/requestpending"
					model="${[mode:'parche',requestList:pendingRequestList]}" />
			</g:if>
			<g:render template="/modules/userspanel/newuserlist"
				model="${[mode:'parche',userList:parche.userList]}" />
		</div>
		<div id="me" class="divi">
			<g:render template="/modules/mainmenu"
				model="${[groupList:groupList,communityList:communityList]}" />
		</div>
	</div>
</body>
</html>