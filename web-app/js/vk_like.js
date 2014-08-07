/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
//    document.getElementById('vk_like').innerHTML = VK.Widgets.Like("vk_like", {type: "button"});
    VK.Widgets.Like("vk_like", {type: "mini",
                                pageTitle:"Велодорожки нашего города!",
                                pageDescription:"Омску нужны велодорожки!",
                                pageUrl:"http://bicycle-ways.7bits.it/"
    });
});
