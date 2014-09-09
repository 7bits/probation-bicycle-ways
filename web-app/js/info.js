$('document').ready(function () {
    document.getElementById('close_info').onclick = function () {
        document.getElementById('parent_info').style.display = 'none';
    }
    var file_error = getParameterByName("file_error");
    if (file_error == 1) {
        document.getElementById('parent_info').style.display = 'block';
        document.getElementById('p_info').innerHTML = 'Неправильный формат файла!';
    }
    if (file_error == 2) {
        document.getElementById('parent_info').style.display = 'block';
        document.getElementById('p_info').innerHTML = 'Пустой файл!';
    }
});