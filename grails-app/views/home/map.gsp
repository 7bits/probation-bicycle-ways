<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js"/>
    <g:javascript src="info.js"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'likebike.css')}"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:40,500,600,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>
<g:render template="/home/info"/>
<div id="routes">
    %{--<sec:ifLoggedIn>--}%
    <ul class="controls nav navbar-nav">
        <li class="dropdown">
            <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle"><img src="img/icon1.png" class="icon" alt="Показать на карте" height="19" width="19"><p class="button_text">Показать на карте</p></a>
            <ul class="dropdown-menu">
                <li>Показывать на карте</li>
                <g:form>
                    <g:radioGroup name="myGroup" labels="['Все маршруты','Мои маршруты']" values="['All','Mine']" value="All" >
                        <p>${it.radio} <g:message code="${it.label}" /></p>
                    </g:radioGroup>
                </g:form>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle"><img src="img/icon2.png" class="icon" alt="Добавить маршрут" height="16" width="16"><p class="button_text">Добавить маршрут</p></a>
            <ul class="dropdown-menu pull-right">
                <li>Загрузить GPS-трек</li>
                <div id="formCopy">
                    <g:uploadForm id="load_file" action="route/loadFile" method="post" enctype="multipart/form-data" class="file_load">
                        <input type="file" type="submit" id="userfile" class="userfile" name="userFile"/>
                        <div class="load_input"><img src="img/Waypoint.png" class="icon" alt="Добавить маршрут" height="24" width="17"><input type="submit" name="upload" id="upload" class="upload" value="Загрузить маршрут"/></div>
                    </g:uploadForm>
                </div>
            </ul>
        </li>
    </ul>
    %{--</sec:ifLoggedIn>--}%
    <div id="map-canvas" class="map"></div>
</div>
<g:render template="/home/footer"/>
</br>
</br>
</br>
</br>
</br>
</br>
<button id="screen">screen</button>
<img id="route_img">
</body>
</html>