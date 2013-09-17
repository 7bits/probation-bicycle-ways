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
    
    <div id="parent_reg"   style="display: block">
      <div id="reg">
          <g:form url="[action:'myRegister',controller:'register']" name='registerForm'>
            <g:if test='${emailSent}'>
              <br/>
              <g:message code='spring.security.ui.register.sent'/>
            </g:if>
            <g:else>
              <br/>
                <table>
                  <tbody>
                    <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                                             size='40' labelCodeDefault='Username' value=""/>
                    <s2ui:textFieldRow name='email' bean="${command}" value=""
                                             size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>
                    <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                                                 size='40' labelCodeDefault='Password' value=""/>
                    <s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                                                 size='40' labelCodeDefault='Password (again)' value=""/>
                  </tbody>
                </table>
                <g:submitButton name="update" value="Register"/>
            </g:else>
          </g:form>
          <p id="close_reg">Close</p>
      </div>
    </div>
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
            <p class="menuText">О ПРОЕКТЕ</p>
        </li>
        <li class="menuListItem">
            <p class="menuText"><a class="menuA" href="map">КАРТА МАРШРУТОВ</a></p>
        </li>
        <li class="menuListItem">
            <p style="cursor: pointer;" id="p_reg">Регистрация</p>
        </li>
      </ul>
      <div id="signIn">
        <span id="signInUnderLineText" class="signInText">
          <sec:ifLoggedIn>
            Вы зашли как <sec:username/> (<g:link controller='logout'>  Выйти</g:link>)
          </sec:ifLoggedIn> 
          <sec:ifNotLoggedIn> 
            (<g:link controller='login'>Войти</g:link>)
          </sec:ifNotLoggedIn>
        </span>
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
    <div id="info">
      <h1 id="hText">Омску нужны велодорожки.</h1>
      <p id="mainText">
        Построить их может Департамент транспорта и развития транспортной инфраструктуры. Для этого нужно знать, где проходят основные веломаршруты.<br /><br />
В этом может помочь любой велосипедист. Нужно установить на телефон приложение, которое ежедневно будет отслеживать веломаршруты и наносить их на карту, или загрузить свой маршрут на сайт. Постепенно станет понятно, где омичи любят кататься больше всего.<br /><br /> 
В итоге мы предложим готовый проект специалистам из Департамента, и велодорожки появятся в самых нужных и удобных местах Омска. Поддержите нашу идею – построим велодорожки вместе!
      </p>
      <div id="watch" class="infoDiv">
        <g:img id="watchImg" class="infoImg" dir="images" file="watch_img.png"/>
        <hr class="line"> 
        <p class="doText">Просматривайте маршруты друзей!</p>
      </div>
      <div id="share" class="infoDiv">
        <g:img id="shareImg" class="infoImg" dir="images" file="share_img.png"/>
        <hr class="line"> 
        <p class="doText">Делитесь своими планами.</p>
      </div>
      <div id="getIn" class="infoDiv">
        <g:img id="getInImg" class="infoImg" dir="images" file="getIn_img.png"/>
        <hr class="line"> 
        <p class="doText">Участвуйте в будущем города.</p>
      </div>
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