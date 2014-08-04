CREATE TABLE lifeboat_user_login (
	id serial PRIMARY KEY,
	name varchar(20),
	password varchar(30),
	acc_fk int, -- connected to lifeboat_user
	date_created timestamp,
	date_updated timestamp
);