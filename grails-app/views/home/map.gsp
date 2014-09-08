<g:applyLayout name="main">
    <head>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'map.css')}"/>
        <g:javascript src="notify.js"/>
        <g:javascript src="mapload.js"/>
    </head>

    <body>
        <g:hiddenField id="user_id" name="user_id" value="${sec.loggedInUserInfo(field:'id')}" />
        <div id="loader_background" style="display: none">
            <div id="rotator">
                <ul>
                    <li class="show"><g:img id="logo" dir="images/bicycle" file="1.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="2.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="3.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="4.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="5.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="6.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="7.png" width="68" height="41" /></li>
                    <li><g:img id="logo" dir="images/bicycle" file="8.png" width="68" height="41" /></li>
                </ul>
            </div>
        </div>
        <div id="routes" class="routes">
        <sec:ifLoggedIn>
            <div class="controls_body">
            <div class="controls">
                <sec:ifLoggedIn>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <span class="" style="font-weight: normal"><img src="../img/icon1.png" class="icon" alt="Показать на карте" height="19" width="19" style="margin-top: 9px; margin-right: 4px">Показать на карте</span>
                        <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle" style="display:inline-block;border-bottom:dashed;
                        border-bottom-width: 1px;"> <p id="route" class="button_text">все маршруты</p> </a>
                        <ul class="dropdown-menu pull-right">
                            <g:form>
                                <ul>
                                    <li><input type="radio" name="myGroup" checked="checked" value="All" id="get_all_routes"><label for="get_all_routes"><div class = "radio_text">Все маршруты</div></label></li>
                                    <li><input type="radio" name="myGroup" value="Mine" id="get_users_routes"><label for="get_users_routes"><div class = "radio_text">Мои маршруты</div></label></li>
                                </ul>
                            </g:form>
                        </ul>
                    </li>
                    <li class="dropdown" style="width: 187px">
                        <a href="#" data-toggle="dropdown" class="control_button dropdown-toggle"><img src="../img/icon2.png" class="icon" alt="Добавить маршрут" height="16" width="16"><p class="button_text">Добавить маршрут</p></a>
                        <ul class="dropdown-menu pull-left">
                            <li>Загрузить GPS-трек</li>
                            <div id="formCopy">
                                <g:uploadForm id="load_file" url="[action:'loadFile',controller:'route']" method="post" enctype="multipart/form-data" class="file_load">
                                    <div class="file_input">
                                        <div class="file_button">Выбрать файл</div>
                                        <p class="file_name" id="file_name">Файл не выбран</p>
                                        <input type="file" type="submit" id="userfile" class="userfile" name="userFile"/>
                                    </div>
                                    <div id="load_input" class="load_input">
                                        <img id="upload_icon" src="../img/Waypoint.png" class="icon" alt="Добавить маршрут" height="24" width="17">
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
            <div id="map-canvas" class="map"></div>
        </div>
    </body>
</g:applyLayout>