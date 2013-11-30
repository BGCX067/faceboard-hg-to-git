<%@ page import="classblast.admin.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'alertList', 'error')} ">
	<label for="alertList">
		<g:message code="user.alertList.label" default="Alert List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.alertList?}" var="a">
    <li><g:link controller="notificacion" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="notificacion" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'notificacion.label', default: 'Notificacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'bookList', 'error')} ">
	<label for="bookList">
		<g:message code="user.bookList.label" default="Book List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.bookList?}" var="b">
    <li><g:link controller="cuaderno" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cuaderno" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cuaderno.label', default: 'Cuaderno')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'commentList', 'error')} ">
	<label for="commentList">
		<g:message code="user.commentList.label" default="Comment List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.commentList?}" var="c">
    <li><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comentario" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comentario.label', default: 'Comentario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'communityList', 'error')} ">
	<label for="communityList">
		<g:message code="user.communityList.label" default="Community List" />
		
	</label>
	<g:select name="communityList" from="${classblast.admin.Parche.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.communityList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'conversation1List', 'error')} ">
	<label for="conversation1List">
		<g:message code="user.conversation1List.label" default="Conversation1 List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.conversation1List?}" var="c">
    <li><g:link controller="conversacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conversacion" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conversacion.label', default: 'Conversacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'conversation2List', 'error')} ">
	<label for="conversation2List">
		<g:message code="user.conversation2List.label" default="Conversation2 List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.conversation2List?}" var="c">
    <li><g:link controller="conversacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conversacion" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conversacion.label', default: 'Conversacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'encryptedPassword', 'error')} ">
	<label for="encryptedPassword">
		<g:message code="user.encryptedPassword.label" default="Encrypted Password" />
		
	</label>
	<g:textField name="encryptedPassword" value="${userInstance?.encryptedPassword}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groupList', 'error')} ">
	<label for="groupList">
		<g:message code="user.groupList.label" default="Group List" />
		
	</label>
	<g:select name="groupList" from="${classblast.admin.Grupo.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.groupList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'meetingList', 'error')} ">
	<label for="meetingList">
		<g:message code="user.meetingList.label" default="Meeting List" />
		
	</label>
	<g:select name="meetingList" from="${classblast.admin.Mesaredonda.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.meetingList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'postList', 'error')} ">
	<label for="postList">
		<g:message code="user.postList.label" default="Post List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.postList?}" var="p">
    <li><g:link controller="publicacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publicacion" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publicacion.label', default: 'Publicacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'registerDate', 'error')} required">
	<label for="registerDate">
		<g:message code="user.registerDate.label" default="Register Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registerDate" precision="day"  value="${userInstance?.registerDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'requestList', 'error')} ">
	<label for="requestList">
		<g:message code="user.requestList.label" default="Request List" />
		
	</label>
	<g:select name="requestList" from="${classblast.admin.Solicitud.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.requestList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'rolList', 'error')} ">
	<label for="rolList">
		<g:message code="user.rolList.label" default="Rol List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.rolList?}" var="r">
    <li><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rol" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}</g:link>
</li>
</ul>

</div>

