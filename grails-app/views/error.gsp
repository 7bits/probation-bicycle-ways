<!DOCTYPE html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}"
                                  type="text/css">
</head>

<body>
    <g:renderException exception="${exception}"/>
    <ul class="errors">
        <li>An error has occurred</li>
    </ul>
</body>
</html>
