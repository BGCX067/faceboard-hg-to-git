<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="logged" />
<title>Bienvenido a ClassBlast - Inicio</title>
<style>
#conr {
	width: 100%;
}
.divi {
	border: solid #8BC600;
	border-width: 5px;
}
#ma {
	width: 78%;
	float: left;
	height: 500px;
}

#me {
	width: 20%;
	float: left;
	height: 500px;
}
</style>
</head>
<body>
	<div id="con">
		<div id="ma" class="divi">
			<g:render template="/welcome/pendingtasks"/>
			<g:render template="/welcome/importanttopics" model="${[groupList:groupList,communityList:communityList]}"/>
			<g:render template="/welcome/postnotes" model="${[groupList:groupList,communityList:communityList]}"/>
			<g:render template="/welcome/coursesalerts" model="${[groupList:groupList,communityList:communityList]}"/>
		</div>
		<div id="me" class="divi">
			<g:render template="/modules/mainmenu" model="${[groupList:groupList,communityList:communityList]}"/>
		</div>
	</div>
	
	
</body>
</html>