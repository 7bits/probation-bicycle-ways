/**
 * Created by anton on 06/08/14.
 */

$(document).ready(function(){
    if($("#myCarousel").length > 0) {
    $("#myCarousel").carousel(
        {
            interval:3000
        }
    );
    }
});