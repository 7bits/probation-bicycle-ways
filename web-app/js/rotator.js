function Rotator(type) {
    this.id = 0;
    this.start = start;
    this.stop = stop;
    }
    
function start() {
    if(this.id == 0){
        $('div#rotator ul li').css({opacity: 0.0});
        $('div#rotator ul li:first').css({opacity: 1.0});
        this.id = setInterval('rotate()', 375);
    }
    else{
        throw "Rotator already started.";
    }
}

function stop() {
    if(this.id != 0){
        clearInterval(this.id);
        this.id = 0;
    }
    else{
        throw "Rotator wasn't started.";
    }
}

function rotate() {
    var current = ($('div#rotator ul li.show')? $('div#rotator ul li.show') : $('div#rotator ul li:first'));
    var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div#rotator ul li:first') :current.next()) : $('div#rotator ul li:first'));
    next.css({opacity: 0.0})
        .addClass('show')
        .animate({opacity: 1.0}, 125);
    current.animate({opacity: 0.0}, 125)
        .removeClass('show');
};