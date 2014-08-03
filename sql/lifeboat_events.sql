CREATE TABLE lifeboat_events (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(100),
	description text,
	evt_type int,
	organiser_fk int, -- connected to lifeboat_user
	date_start datetime,
	date_end datetime,
	date_created datetime,
	date_updated datetime
);