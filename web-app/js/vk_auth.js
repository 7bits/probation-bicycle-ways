/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
        window.onload = function () {
        VK.init({apiId: 4512659});
        var result = VK.Widgets.Auth('vk_auth', {authUrl: '../vk/auth'});
        var i=0;
    }
});
