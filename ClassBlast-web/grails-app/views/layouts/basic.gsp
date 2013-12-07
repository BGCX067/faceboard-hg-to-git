<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}"
	type="text/css">
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'logo.png')}" type="image/x-icon">
<script type="javascript" src="${resource(dir: 'js',file: "application.js") }"></script>
<g:layoutHead />
<title><g:layoutTitle default="Grails"/></title>
<style>
h3	{
	text-align: center 
  }
h3:hover{
	background-color: #8BC600;
}
#container{
}
#main{
	width:99.5%;
	height:400px;
	border: 1px;
	border:solid #8BC600;
}
#menu{
	width:24%;
	float: left;
	padding: 0.5% 0.5%;
	border: 0.5px;
	border-bottom:solid #8BC600;
}
#header{
	width: 100%;
	height: 40px;
	background-color:#0AA3C1;
}
#logo {
	float:left;
	width:40%
}
#logo p{
	font-size:1.7em;
	margin-top:2px;
	color: #ffffff;
}
#loginTools{
	color:#ffffff;
	width:29%;
	float:left;
	padding:5px;
}
#search{
	width: 29%;
	float:left;
	padding:5px;	
}
#search input{
	border-radius:3px;
	padding-left:5px;
	color:gray;
	font-size:1.2em;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logo">
			<g:link controller="main">
			<p id="logo">
			<g:img height="20px" dir="images" file="logo.png" class="middle" />
			Classblast
			</p>
			</g:link>		
		</div>
		<div id="loginTools">
			<g:pageProperty name="page.userinfocontent"/>
		</div>
		<div id="search">
			<g:form controller="contentsearch" action="searchprocess" name="formcontentsearch" method="post">
			<g:textField name="course_search" 
							 onfocus="if(this.value == 'Buscar cursos') {this.value=''}" 
							 onblur="if(this.value == ''){this.value ='Buscar cursos'}" 
							 value="Buscar cursos"/>
			<g:link url="#" onclick="document.formcontentsearch.submit()">
			<g:img height="20px" dir="images/icons" class="middle" file="search-24.ico"/>
			</g:link>
			</g:form>
		</div>
	</div>
	<div class="main-container">
	<g:layoutBody />
	</div>
</body>
</html>
