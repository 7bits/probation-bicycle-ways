<!DOCTYPE html>
<html>
<head>
    <title>Velo-Sity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'likebike.css')}"/>
</head>

<body>
<g:render template="/home/header"/>
<g:render template="/home/register"/>
<g:render template="/home/login"/>
<div id="cartoon">
    <ul id="cartoon_ul">
        <li class="cartoon_li">
            <g:img id="cartoon_one_img" class="cartoon_img" dir="images" file="cartoon1.png"/>
            <p class="cartoon_p">1. Запусти приложение <br/>и прокатись!</p>
        </li>
        <li class="cartoon_li">
            <g:img id="cartoon_second_img" class="cartoon_img" dir="images" file="cartoon2.png"/>
            <p class="cartoon_p">2. Приложение отметит <br/>твой маршрут на карте.</p>
        </li>
        <li class="cartoon_li">
            <g:img id="cartoon_third_img" class="cartoon_img" dir="images" file="cartoon3.png"/>
            <p id="cartoonThirdP"
               class="cartoon_p">3. Статистику маршрутов увидит <br/>администрация и построит <br/> велодорожки в нужных местах.
            </p>
        </li>
    </ul>
</div>

<div id="info">
    <h1 id="hText">Омску нужны велодорожки.</h1>

    <p id="mainText">
        Построить их может Департамент транспорта и развития транспортной инфраструктуры. Для этого нужно знать, где проходят основные веломаршруты.<br/><br/>
        В этом может помочь любой велосипедист. Нужно установить на телефон приложение, которое ежедневно будет отслеживать веломаршруты и наносить их на карту, или загрузить свой маршрут на сайт. Постепенно станет понятно, где омичи любят кататься больше всего.<br/><br/>
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
<g:render template="/home/footer"/>
</body>
</html>