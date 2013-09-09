<%@ page import="likebike.Point" %>



<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="point.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: pointInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="point.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: pointInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'routeIndex', 'error')} required">
	<label for="routeIndex">
		<g:message code="point.routeIndex.label" default="Route Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="routeIndex" type="number" value="${pointInstance.routeIndex}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'route', 'error')} required">
	<label for="route">
		<g:message code="point.route.label" default="Route" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="route" name="route.id" from="${likebike.Route.list()}" optionKey="id" required="" value="${pointInstance?.route?.id}" class="many-to-one"/>
</div>

