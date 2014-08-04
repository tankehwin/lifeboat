CREATE TABLE lifeboat_user_login (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(20),
	password varchar(30),
	acc_fk int, -- connected to lifeboat_user
	date_created datetime,
	date_updated datetime
);