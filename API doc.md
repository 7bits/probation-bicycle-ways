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
В data лежит userFile, содержащий файл пользователя  

####Войти

url: j_spring_security_check  
type: post  
dataType: json  
j_username: имя пользователя  
j_password: пароль  
Возвращает всегда 200 (пока)  

####Выйти

url: logout  
type: post  
dataType: json  
Возвращает всегда 200 (пока)  

