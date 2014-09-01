/**
 * Created by anton on 8/19/14.
 */

$(document).ready(function () {
    $("#mobile").click(function () {
        $("#panel").slideDown("slow");
        return false;
    });
    $("#panelUp").click(function () {
        $("#panel").slideUp("slow");
        return false;
    });
});

