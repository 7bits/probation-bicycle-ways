/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
    VK.init({apiId: 4512659});
        window.onload = function () {
        VK.Widgets.Auth('vk_auth', {width: "200", authUrl: getUrl() + '/login/vk'});
    }
});
