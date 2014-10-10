/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
    VK.init({apiId: 4512659});
    window.onload = function () {
        VK.Widgets.Auth('vk_auth', {width: "200", authUrl: getUrl() + '/login/vk'});
        VK.Widgets.Like("vk_like", {type: "mini",
            pageTitle:"Велодорожки нашего города!",
            pageDescription:"Омску нужны велодорожки!",
            pageUrl:"http://velo-omsk.org/"
        });
    }
});
