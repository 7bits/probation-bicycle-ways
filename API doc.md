####Получить все маршруты

url: route/getRoute  
Тип запроса: post

Возвращает двумерный массив маршрутов.  
Каждый маршрут есть массив точек.
Каждая точка есть пара double широта и долгота соответственно.   

Ссылка на пример json-ответа https://api.myjson.com/bins/21mzm

####Загрузить маршрут

url: route/loadFile  
type: post  
userFile, содержащий файл пользователя

####Последние обработанные маршруты
Позволяет проверить последние обработанные маршруты текущего вошедшего пользователя.

url: route/fetchProcessed  
type: post
Возвращает:
successMessage: сообщение об успехе.  
errorMessage: сообщение об ошибке  
list: список пар следующего вида:   
["название файла", код ошибки].  
код ошибки: 1 - ошибка 2 - успех.   
Пример ответа можно посмотреть здесь: http://myjson.com/4j9vp  

####Логин

url: j_spring_security_check  
type: post  
form-data: x-www-form-urlencoded  
data: j_username: логин  
      j_password: пароль  
Ответ: {success: true/false, "errorMessage": сообщение об ошибке в случае неудачи}   


