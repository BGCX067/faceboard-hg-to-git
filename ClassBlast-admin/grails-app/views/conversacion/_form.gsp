<%@ page import="classblast.admin.Conversacion" %>



<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'communityRelated', 'error')} required">
	<label for="communityRelated">
		<g:message code="conversacion.communityRelated.label" default="Community Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="communityRelated" name="communityRelated.id" from="${classblast.admin.Parche.list()}" optionKey="id" required="" value="${conversacionInstance?.communityRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'groupRelated', 'error')} required">
	<label for="groupRelated">
		<g:message code="conversacion.groupRelated.label" default="Group Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupRelated" name="groupRelated.id" from="${classblast.admin.Grupo.list()}" optionKey="id" required="" value="${conversacionInstance?.groupRelated?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'messageList', 'error')} ">
	<label for="messageList">
		<g:message code="conversacion.messageList.label" default="Message List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conversacionInstance?.messageList?}" var="m">
    <li><g:link controller="mensaje" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="mensaje" action="create" params="['conversacion.id': conversacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mensaje.label', default: 'Mensaje')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'talkCategory', 'error')} required">
	<label for="talkCategory">
		<g:message code="conversacion.talkCategory.label" default="Talk Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="talkCategory" from="${classblast.admin.Conversacion$Category?.values()}" keys="${classblast.admin.Conversacion$Category.values()*.name()}" required="" value="${conversacionInstance?.talkCategory?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'user1Related', 'error')} required">
	<label for="user1Related">
		<g:message code="conversacion.user1Related.label" default="User1 Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user1Related" name="user1Related.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${conversacionInstance?.user1Related?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conversacionInstance, field: 'user2Related', 'error')} required">
	<label for="user2Related">
		<g:message code="conversacion.user2Related.label" default="User2 Related" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user2Related" name="user2Related.id" from="${classblast.admin.User.list()}" optionKey="id" required="" value="${conversacionInstance?.user2Related?.id}" class="many-to-one"/>
</div>

