Создание БД

CREATE DATABASE likeBike character set utf8 collate utf8_general_ci;
GRANT All ON likeByke.* TO 'likebike'@'localhost' IDENTIFIED BY 'likebike';

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

INSERT INTO route(id, version, name) values(1, 0, "myWayOne");

INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 1, 0, 54.984207,  73.386926, 0, 1);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 2, 0, 54.984108,  73.385767, 1, 1);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 3, 0, 54.982677,  73.380531, 2, 1);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 4, 0, 54.981566,  73.380488, 3, 1);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 5, 0, 54.972865,  73.382377, 4, 1);

INSERT INTO route(id, version, name) values(2, 0, "myWayTwo");

INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 6, 0, 54.967508, 73.352379, 0, 2);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 7, 0, 54.967298, 73.352508, 1, 2);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 8, 0, 54.966841, 73.350276, 2, 2);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values( 9, 0, 54.965360, 73.350212, 3, 2);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(10, 0, 54.965248, 73.352057, 4, 2);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(11, 0, 54.963446, 73.357057, 5, 2);

INSERT INTO route(id, version, name) values(3, 0, "myWayThree");

INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(12, 0, 54.981998, 73.377227, 0, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(13, 0, 54.982738, 73.380510, 1, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(14, 0, 54.981628, 73.380553, 2, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(15, 0, 54.981850, 73.383342, 3, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(16, 0, 54.980912, 73.383450, 4, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(17, 0, 54.981011, 73.385456, 5, 3);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(18, 0, 54.980452, 73.385528, 6, 3);

INSERT INTO route(id, version, name) values(4, 0, "myWayFour");

INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(19, 0, 55.026251, 73.282228, 0, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(20, 0, 55.026189, 73.279211, 1, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(21, 0, 55.026149, 73.279096, 2, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(22, 0, 55.025637, 73.279152, 3, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(23, 0, 55.025500, 73.279578, 4, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(24, 0, 55.025610, 73.282266, 5, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(25, 0, 55.025619, 73.283379, 6, 4);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(26, 0, 55.026251, 73.282228, 7, 4);

INSERT INTO route(id, version, name) values(5, 0, "myWayFive");

INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(27, 0, 54.972701, 73.382428, 0, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(28, 0, 54.982772, 73.380110, 1, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(29, 0, 54.985573, 73.377728, 2, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(30, 0, 54.991027, 73.373415, 3, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(31, 0, 54.991310, 73.365068, 4, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(32, 0, 54.990805, 73.364747, 5, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(33, 0, 54.989336, 73.366356, 6, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(34, 0, 54.989053, 73.371184, 7, 5);
INSERT INTO point(id, version, latitude, longitude, route_index, route_id) values(35, 0, 54.986418, 73.373888, 8, 5);