<%@ page import="likebyke.Point" %>



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

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'route', 'error')} required">
	<label for="route">
		<g:message code="point.route.label" default="Route" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="route" name="route.id" from="${likebyke.Route.list()}" optionKey="id" required="" value="${pointInstance?.route?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'route_index', 'error')} required">
	<label for="route_index">
		<g:message code="point.route_index.label" default="Routeindex" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="route_index" type="number" value="${pointInstance.route_index}" required=""/>
</div>

