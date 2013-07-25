<%@ page import="likebyke.Point" %>



<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="point.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" type="number" value="${pointInstance.latitude}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="point.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" type="number" value="${pointInstance.longitude}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'routeId', 'error')} required">
	<label for="routeId">
		<g:message code="point.routeId.label" default="Route Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="routeId" name="routeId.id" from="${likebyke.Route.list()}" optionKey="id" required="" value="${pointInstance?.routeId?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'route_index', 'error')} required">
	<label for="route_index">
		<g:message code="point.route_index.label" default="Routeindex" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="route_index" type="number" value="${pointInstance.route_index}" required=""/>
</div>

