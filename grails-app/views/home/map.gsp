<g:applyLayout name="main">
    <head>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'map.css')}"/>
        <g:javascript src="lib/notify.js"/>
        <g:javascript src="mapload.js"/>
    </head>

    <body>
        <g:hiddenField id="userId" name="userId" value="${sec.loggedInUserInfo(field:'id')}"/>
        <div id="routes" class="routes">
        <sec:ifLoggedIn>
            <g:if test="${loadedCode != null}">
                <g:hiddenField id="loadedMessage" name="loadedMessage" value="${loadedMessage}"/>
                <g:hiddenField id="loadedCode" name="loadedCode" value="${loadedCode}"/>
            </g:if>
            <div class="controlsBody">
                <div class="controls">
                    <sec:ifLoggedIn>
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <span class="" style="font-weight: normal"><img src="../img/icon1.png" class="icon" alt="Показать на карте" height="19" width="19" style="margin-top: 9px; margin-right: 4px">Показать на карте</span>
                            <a href="#" data-toggle="dropdown" class="controlButton dropdown-toggle" style="display:inline-block;border-bottom:dashed;
                            border-bottom-width: 1px;"> <p id="route" class="buttonText">все маршруты</p> </a>
                            <ul class="dropdown-menu pull-right">
                                <g:form>
                                    <ul>
                                        <li><input type="radio" name="myGroup" checked="checked" value="All" id="getAllRoutes"><label for="getAllRoutes"><div class = "radioText">Все маршруты</div></label></li>
                                        <li><input type="radio" name="myGroup" value="Mine" id="getUsersRoutes"><label for="getUsersRoutes"><div class = "radioText">Мои маршруты</div></label></li>
                                    </ul>
                                </g:form>
                            </ul>
                        </li>
                        <li class="dropdown" style="width: 187px">
                            <a href="#" data-toggle="dropdown" class="controlButton dropdown-toggle"><img src="../img/icon2.png" class="icon" alt="Добавить маршрут" height="16" width="16"><p class="buttonText">Добавить маршрут</p></a>
                            <ul class="dropdown-menu pull-left">
                                <li>Загрузить GPS-трек</li>
                                <div id="formCopy">
                                    <g:uploadForm id="loadFile" url="[action:'loadFile',controller:'route']" method="post" enctype="multipart/form-data" class="fileLoad">
                                        <div class="fileInput">
                                            <div class="fileButton">Выбрать файл</div>
                                            <p class="fileName" id="fileName">Файл не выбран</p>
                                            <input type="file" type="submit" id="userfile" class="userfile" name="userFile"/>
                                        </div>
                                        <div id="loadInput" class="loadInput">
                                            <img id="uploadIcon" src="../img/Waypoint.png" class="icon" alt="Добавить маршрут" height="24" width="17">
                                            <input type="submit" name="upload" id="upload" class="upload" value="Загрузить маршрут"/>
                                        </div>
                                    </g:uploadForm>
                                </div>
                            </ul>
                        </li>
                    </ul>
                    </sec:ifLoggedIn>
                </div>
            </div>
            </sec:ifLoggedIn>
            <div id="mapCanvas" class="map"></div>
        </div>
    </body>
</g:applyLayout>