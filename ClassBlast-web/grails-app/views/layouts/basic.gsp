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
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'basic.css')}"
	type="text/css">
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'logo.png')}" type="image/x-icon">
<g:layoutHead />
<r:layoutResources />
<style>
h3	{
	text-align: center 
  }

table.index {
	width: 100%;
	border-spacing:0;
    border-collapse:collapse;
}
td.index{
	border: 1px;
	border-bottom:solid #AEEDED;
	padding: 1.5% 1.5%;
}

.index td:hover{
  	background-color: #8BC600;
}

#head{
	background-color:#5882FA;
	width: 75%;
}
#main{
	background-color:#ffffff;
	width: 50%;
	height: 400px;
}
#footer {
	width: 25%;
}
</style>
</head>
<body>
	<p style="font-size: 2.2em; color: #000000">
	<g:img height="40px" dir="images" file="logo.png" class="middle" />
	Classblast
	</p>
	<div class="main-container">
	<g:layoutBody />
	</div>
</body>
</html>
