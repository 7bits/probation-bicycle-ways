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
    <div id="cartoon">
      <ul id="cartoon_ul"> 
        <li class="cartoon_li">
          <g:img id="cartoon_one_img" class="cartoon_img" dir="images" file="cartoon1.png"/>
          <p class="cartoon_p">1. Запусти приложение <br />и прокатись!</p>    
        </li>  
        <li class="cartoon_li">
          <g:img id="cartoon_second_img" class="cartoon_img" dir="images" file="cartoon2.png"/>
          <p class="cartoon_p">2. Приложение отметит <br />твой маршрут на карте.</p>
        </li>
        <li class="cartoon_li">
          <g:img id="cartoon_third_img" class="cartoon_img" dir="images" file="cartoon3.png"/>
          <p id="cartoonThirdP" class="cartoon_p">3. Статистику маршрутов увидит <br />администрация и построит <br /> велодорожки в нужных местах.</p>
        </li>           
      </ul> 
    </div>
    <div id="routes">
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