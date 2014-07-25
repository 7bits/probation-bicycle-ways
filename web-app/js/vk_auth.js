/**
 * Created by anton on 23/07/14.
 */

$("document").ready(function () {
    document.getElementById('vk_auth').innerHTML = VK.init({apiId: 1});

    VK.Widgets.Auth("vk_auth", {width: "200px", onAuth: function(data) {
        document.getElementById('hi').innerHTML ="Hi, " + data['first_name'] + " " + data["last_name"];
        } });
});
