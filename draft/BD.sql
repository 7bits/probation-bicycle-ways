Создание БД

CREATE DATABASE likeByke character set utf8 collate utf8_general_ci;
GRANT All ON likeByke.* TO 'sbogdanov'@'localhost' IDENTIFIED BY 'mysql';
CREATE TABLE User(
	`id` int(20) not null,
	primary key(id)) engine=InnoDB character set=utf8;
CREATE TABLE Route(
	`id` int(20) not null,
	`user_id` varchar(50) not null, 
	primary key(id), 
	foreign key (user_id) references Departaments(User)) engine=InnoDB character set=utf8;        
CREATE TABLE Point(
	`id` int(20) not null, 
	`latitude` int(20) not null, 
	`longitude` int(20) not null,
	`count` int(20) not null,
	`route_id` int(20) not null,
	primary key(id),
	foreign key (route_id) references Route(id)) engine=InnoDB character set=utf8;

Заполнение БД