<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <g:javascript src="mapload.js"/>
    <g:javascript src="info.js"/>
    <g:render template="/home/main"/>
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>
<g:render template="/home/info"/>
<g:hiddenField id="user_id" name="user_id" value="${sec.loggedInUserInfo(field:'id')}" />
<div id="routes" class="routes">
<sec:ifLoggedIn>
    <div class="controls">
        <sec:ifLoggedIn>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle"><img src="img/icon1.png" class="icon" alt="Показать на карте" height="19" width="19"><p class="button_text">Показать на карте</p></a>
                <ul class="dropdown-menu">
                    <g:form>
                        <ul>
                            <li><input type="radio" name="myGroup" checked="checked" value="All" id="get_all_routes"><label for="get_all_routes"><div class = "radio_text">Все маршруты</div></label></li>
                            <li><input type="radio" name="myGroup" value="Mine" id="get_users_routes"><label for="get_users_routes"><div class = "radio_text">Мои маршруты</div></label></li>
                        </ul>
                    </g:form>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle"><img src="img/icon2.png" class="icon" alt="Добавить маршрут" height="16" width="16"><p class="button_text">Добавить маршрут</p></a>
                <ul class="dropdown-menu pull-right">
                    <li>Загрузить GPS-трек</li>
                    <div id="formCopy">
                        <g:uploadForm id="load_file" url="[action:'loadFile',controller:'route']" method="post" enctype="multipart/form-data" class="file_load">
                            <input type="file" type="submit" id="userfile" class="userfile" name="userFile"/>
                            <div id="load_input" class="load_input">
                                <img id="upload_icon" src="img/Waypoint.png" class="icon" alt="Добавить маршрут" height="24" width="17">
                                <input type="submit" name="upload" id="upload" class="upload" value="Загрузить маршрут"/>
                            </div>
                        </g:uploadForm>
                    </div>
                </ul>
            </li>
        </ul>
        </sec:ifLoggedIn>
    </div>
    </sec:ifLoggedIn>
    <div id="map-canvas" class="map"></div>
</div>
<g:render template="/home/footer"/>
%{--</br>--}%
%{--</br>--}%
%{--</br>--}%
%{--</br>--}%
%{--</br>--}%
%{--</br>--}%
<button id="screen">screen</button>
<img id="route_img">
</body>
</html>