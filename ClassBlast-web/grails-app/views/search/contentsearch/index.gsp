<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="${templateToRender}" />
<title>Resultados de la busqueda - Classblast</title>
<style>
</style>
</head>
<body>
	<br/><br/>
	<h2>
		Resultados de la búsqueda
		<i>${searchWord}</i>
	</h2><br/><br/>
	<h3 style="text-align:left">Grupos</h3>
	<g:if test="${groupResultList.size()>0}">
		<g:each in="${groupResultList}" var="groupItem">
			<g:link controller="group" params="[groupid:groupItem.id]">
				${groupItem.groupName}
			</g:link>
			<br />&gt;&gt;&gt;
		${groupItem.groupDescription}
			<hr />
		</g:each>
	</g:if>
	<g:else>
		<p style="font-size: 0.8em; color: gray">No hay grupos que
			coincidan con su búsqueda</p>
	</g:else>

	<h3 style="text-align:left">Cursos</h3>
	<g:if test="${courseResultList.size()>0}">
		<g:each in="${courseResultList}" var="courseItem">
			${courseItem.courseName}<br />
		</g:each>
	</g:if>
	<g:else>
		<p style="font-size: 0.8em; color: gray">No hay cursos que
			coincidan con su búsqueda</p>
	</g:else>
	<h3 style="text-align:left">Parches</h3>
	<g:if test="${communityResultList.size()>0}">
		<g:each in="${communityResultList}" var="communityItem">
			<g:link controller="community"
				params="[communityid:communityItem.id]">
				${communityItem.communityName}
			</g:link>
			<br />&gt;&gt;&gt;
		${communityItem.communityDescription}
			<hr />
		</g:each>
	</g:if>
	<g:else>
		<p style="font-size: 0.8em; color: gray">No hay parches que
			coincidan con su búsqueda</p>
	</g:else>
</body>
</html>