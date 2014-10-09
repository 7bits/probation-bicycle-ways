> Base URL = velo-omsk.org


##Получить все маршруты

#####Request:

`POST /route/fetchRoute`

#####Response:
> Возвращает двумерный массив маршрутов.  
> Каждый маршрут есть массив точек.
> Каждая точка есть пара double широта и долгота соответственно.

```
[
 [[54.984088,73.37413],[54.984132,73.374093],[54.984147,73.37402],[54.984156,73.37411],[54.984201,73.374088]],
 [[55.028517,73.261992],[55.028552,73.262008],[55.028557,73.262063],[55.028544,73.262142],[55.028521,73.262238],[55.028513,73.26229],[55.028508,73.262339],[55.028506,73.262414]]
]
```

##Загрузить маршрут

#####Request:

`POST /route/loadFile`

######параметры:
* userFile - содержащий файл пользователя

#####Response:
> Empty 

##Последние обработанные маршруты
> Позволяет проверить последние обработанные маршруты текущего вошедшего пользователя.

#####Request:

`POST route/fetchProcessed`

#####Response:
* successMessage: сообщение об успехе.  
* errorMessage: сообщение об ошибке  
* list: список пар следующего вида: `["название файла", код ошибки]`
* код ошибки: 1 - ошибка 2 - успех.   

```
{
  "successMessage": "Обработаны файлы:",
  "errorMessage": "Неправильный формат файла в:",
  "list": [
    [
      "someGoodFile",
      2
    ],
    [
      "someBadFile",
      1
    ]
  ]
}
```

##Логин

#####Header:
X-Requested-With: XMLHttpRequest

#####Request:

`POST /j_spring_security_check`

######параметры
* datatype: x-www-form-urlencoded  
* data: j_username: логин  
        j_password: пароль  

#####Response:
```
{  
  success: true/false, 
  "errorMessage": сообщение об ошибке в случае неудачи, "username": "Логин" в случае успеха 
}
```  

##Проверка авторизации

#####Request:
`POST /login/checkAuth`

#####Response:

```
{
    logged: true/false,
    username: логин
}
```

##Регистрация
> Регистрирует пользователя в системе. Шлет email с ссылкой подтверждения

#####Request:

`POST /register/`

######параметры:
* username - логин 
* email
* password: пароль
* password2: повтор пароля

#####Response:
* status - true - успех false - ошибка
сообщения об ошибках в соответствующих полях: 
* username 
* email
* password
* password2

```
{
    "username": "Пользователь с таким именем уже существует",
    "email": "Не корректный email",
    "password": "Пароль должен быть 8 символов и больше",
    "password2": "Пароли не совпадают",
    "status": false
}
```

##VK login redirect URI
> Позволяет авторизовать пользователя с помощью vk API

#####redirect_uri:
`GET http://*адрес сервера*/login/code`

######параметры:
* В соответствии с vk API
