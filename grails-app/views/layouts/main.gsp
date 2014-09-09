<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Velo-Omsk</title>
    <g:external dir="/img/favicon.ico"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <g:javascript src="vk_auth.js"/>
    <script type="text/javascript" src="//vk.com/js/api/openapi.js?115"></script>
    <script src="http://userapi.com/js/api/openapi.js" type="text/javascript" charset="windows-1251"></script>

    <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <g:javascript src="commonJS.js"/>
    <g:javascript src="rotator.js"/>
    <r:layoutResources/>
    <g:layoutHead/>
</head>

<body data-url="${createLink(uri: '')}">
    <g:render template="/home/rotator"/>
    <g:render template="/home/header"/>
    <g:render template="/home/login"/>
    <g:layoutBody/>
    <g:render template="/home/footer"/>
</body>
</html>
