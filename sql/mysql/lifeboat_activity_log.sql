CREATE TABLE lifeboat_activity_log (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name_full varchar(100),
	act_type int, 
	description varchar(200),
	actor_fk int, -- connected to lifeboat_user
	date_created datetime,
	date_updated datetime
);