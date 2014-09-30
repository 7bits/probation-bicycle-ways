function getUrl(){
    return document.body.getAttribute("data-url");
}

function getParameterByName(name) {

    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    if(results)
        return results[1] || 0;
    else{
        return null;
    }
}