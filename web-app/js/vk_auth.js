/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
    VK.init({apiId: 1});
        window.onload = function () {
        var result = VK.Widgets.Auth('vk_auth', {width: "200", authUrl: getUrl() + '/vk/auth'});
    }
});
