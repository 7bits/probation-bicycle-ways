Создание БД

CREATE DATABASE likeByke character set utf8 collate utf8_general_ci;
GRANT All ON likeByke.* TO 'sbogdanov'@'localhost' IDENTIFIED BY 'mysql';

CREATE TABLE User(
	`id` int(20) not null,
	primary key(id)) engine=InnoDB character set=utf8;

CREATE TABLE Route(
	`id` int(20) not null,
	`user_id` int(20) not null, 
	primary key(id), 
	foreign key (user_id) references User(id)) engine=InnoDB character set=utf8;        

CREATE TABLE Point(
	`id` int(20) not null, 
	`latitude` float(9, 6) not null, 
	`longitude` float(9, 6) not null,
	`count` int(20) not null,
	`route_id` int(20) not null,
	primary key(id),
	foreign key (route_id) references Route(id)) engine=InnoDB character set=utf8;

Заполнение БД
	INSERT INTO User(id) values(1);

	INSERT INTO Route(id, user_id) values(1, 1);
	INSERT INTO Route(id, user_id) values(2, 1);
	INSERT INTO Route(id, user_id) values(3, 1);

	INSERT INTO Point(id, latitude, longitude, count, route_id) values(1, 73.373837, 54.983633, 1, 1);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(2, 73.373064, 54.982671, 2, 1);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(3, 73.370081, 54.982313, 3, 1);
	
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(4, 73.366348, 54.983103, 1, 2);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(5, 73.366434, 54.983794, 2, 2);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(6, 73.36888, 54.983781, 3, 2);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(7, 73.36903, 54.984929, 4, 2);
	
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(8, 73.363961, 54.985043, 1, 3);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(9, 73.36999, 54.984957, 2, 3);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(10, 73.372436, 54.984105, 3, 3);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(11, 73.374067, 54.985154, 4, 3);
	INSERT INTO Point(id, latitude, longitude, count, route_id) values(12, 73.374389, 54.985786, 5, 3);

