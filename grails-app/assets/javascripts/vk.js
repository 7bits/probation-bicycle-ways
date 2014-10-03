$("document").ready(function () {
    document.getElementById('vk').innerHTML = VK.Share.button({
        url: 'http://velo-omsk.org/',
        title: 'Велодорожки нашего города!',
        description: 'Омску нужны велодорожки. ' +
            'Построить их может Департамент транспорта и развития транспортной инфраструктуры.' +
            ' Для этого нужно знать, где проходят основные веломаршруты.' +
            'В этом может помочь любой велосипедист.' +
            ' Нужно установить на телефон приложение, которое ежедневно будет отслеживать веломаршруты и наносить их на карту, или загрузить свой маршрут на сайт.' +
            ' Постепенно станет понятно, где омичи любят кататься больше всего.' +
            ' В итоге мы предложим готовый проект специалистам из Департамента, и велодорожки появятся в самых нужных и удобных местах Омска.' +
            ' Поддержите нашу идею – построим велодорожки вместе!',
        image: 'http://velo-omsk.org/static/images/cartoon1.png',
        noparse: true
    },{
        type: 'round',
        text: 'Опубликовать'
    });
});