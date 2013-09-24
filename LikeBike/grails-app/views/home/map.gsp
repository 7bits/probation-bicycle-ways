<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'likebike.css')}"/>
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>
<div id="routes">
    <sec:ifLoggedIn>
        <h1 id="loadRouteH">ЗАГРУЗИТЬ СВОЙ МАРШРУТ</h1>

        <form id="load_file" action="route/loadFile" method="post" enctype="multipart/form-data">
            <div id="formCopy">
                <div class="importBtn">
                    <p class="btnP">Выберите файл</p>
                    <input type="file" id="userfile" class="userfile" name="userFile"/>
                </div>

                <p id="importP">файл не выбран</p>

                <div class="importBtn">
                    <p class="btnP">Импортировать</p>
                    <input type="submit" name="upload" id="upload" value="Импортировать"/>
                </div>
            </div>
        </form>
    </sec:ifLoggedIn>
    <div id="map-canvas"></div>
</div>
<g:render template="/home/footer"/>
</body>
</html>