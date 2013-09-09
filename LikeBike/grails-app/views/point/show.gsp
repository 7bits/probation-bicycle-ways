
<%@ page import="likebike.Point" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-point" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-point" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list point">
			
				<g:if test="${pointInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="point.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${pointInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pointInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="point.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${pointInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pointInstance?.routeIndex}">
				<li class="fieldcontain">
					<span id="routeIndex-label" class="property-label"><g:message code="point.routeIndex.label" default="Route Index" /></span>
					
						<span class="property-value" aria-labelledby="routeIndex-label"><g:fieldValue bean="${pointInstance}" field="routeIndex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pointInstance?.route}">
				<li class="fieldcontain">
					<span id="route-label" class="property-label"><g:message code="point.route.label" default="Route" /></span>
					
						<span class="property-value" aria-labelledby="route-label"><g:link controller="route" action="show" id="${pointInstance?.route?.id}">${pointInstance?.route?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pointInstance?.id}" />
					<g:link class="edit" action="edit" id="${pointInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
