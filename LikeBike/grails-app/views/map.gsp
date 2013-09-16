<!DOCTYPE html>
<html>
  <head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <g:javascript src="mapload.js" />
    <link rel="stylesheet" href="${resource(dir:'css', file: 'likebike.css')}" />
  </head>

  <body onload="initialize()">
    <sec:ifLoggedIn>
        <p class = "text">Logged in as <sec:username/> (<g:link controller='logout'>  Logout</g:link>) </p> 
    </sec:ifLoggedIn> 
    <sec:ifNotLoggedIn>
        <p class = "text">You don't logged. You can login to: (<g:link controller='login'>  Login</g:link>) </p>
    </sec:ifNotLoggedIn>
    <header>
      <g:img id="razmetka" dir="images" file="razmetka.png"/>
      <g:img id="logo" dir="images" file="logo.png"/>
      <p id="labelDownloadApp">Скачать приложение:</p>
      <a href="#"><g:img id="buttonAndroidLink" dir="images" file="android.png"/></a>
      <a href="#"><g:img id="buttonAppStoreLink" dir="images" file="appStore.png"/></a>
    </header>
    <menu>
      <ul id="menuList">
        <li class="menuListItem">
          <p class="menuText"><a class="menuA" href="/">О ПРОЕКТЕ</a></p>
        </li>
        <li class="menuListItem">
            <p class="menuText">КАРТА МАРШРУТОВ</p>
        </li>
      </ul>
      <div id="signIn">
        <a href="#"><span id="signInUnderLineText" class="signInText">Войти</span></a>
        <span class="signInText">с помощью</span>
        <g:img id="vkHeader" dir="images" file="vk.png"/>
      </div>
    </menu>
    <sec:ifNotLoggedIn>
      <p class="text">Login to add your route (<g:link controller='login'>Login</g:link>) </p>
    </sec:ifNotLoggedIn>
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
                <input type="submit" name="upload" id="upload" value="Импортировать" />
              </div>
          </div>  
        </form> 
      </sec:ifLoggedIn>
      <div id="map-canvas"></div>  
    </div>
    <footer>
      <ul id="footer_menu"> 
        <li class="footer_button"><a href="#">О НАС</a></li>  
        <li class="footer_button"><a href="#">ПРИЛОЖЕНИЕ</a></li>           
      </ul>
      <g:img id="vk" dir="images" file="vk.png"/>
      <g:img id="mini_logo" dir="images" file="mini_logo.png"/>
      <g:img id="android_logo" dir="images" file="android_logo.png"/>
      <g:img id="apple_logo" dir="images" file="apple_logo.png"/>
    </footer>
  </body>
</html>