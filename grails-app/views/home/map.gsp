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
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>
<g:render template="/home/info"/>
<div id="routes">
    <div id="map-canvas"></div>
    <sec:ifLoggedIn>
        <button id="get_all_routes">Все маршруты</button>
        <button id="get_users_routes">Мои маршруты</button>

        <h1 id="load_route_h">ЗАГРУЗИТЬ СВОЙ МАРШРУТ</h1>


        <form id="load_file" action="route/loadFile" method="post" enctype="multipart/form-data">
            <div id="form_copy">
                <div class="import_btn">
                    <p class="btn_p">Выберите файл</p>
                    <input type="file" id="userfile" class="userfile" name="userFile"/>
                </div>

                <p id="import_p">файл не выбран</p>

                <div class="import_btn">
                    <p class="btn_p">Импортировать</p>
                    <input type="submit" name="upload" id="upload" value="Импортировать"/>
                </div>
            </div>
        </form>
    </sec:ifLoggedIn>
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