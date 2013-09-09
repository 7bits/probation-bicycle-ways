<%@ page import="likebike.Route" %>



<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="route.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${routeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'point', 'error')} ">
	<label for="point">
		<g:message code="route.point.label" default="Point" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${routeInstance?.point?}" var="p">
    <li><g:link controller="point" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="point" action="create" params="['route.id': routeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'point.label', default: 'Point')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: routeInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="route.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${likebike.User.list()}" optionKey="id" required="" value="${routeInstance?.user?.id}" class="many-to-one"/>
</div>

