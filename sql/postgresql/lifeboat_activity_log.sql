CREATE TABLE lifeboat_activity_log (
	id serial PRIMARY KEY,
	name_full varchar(100),
	act_type int, 
	description varchar(200),
	actor_fk int, -- connected to lifeboat_user
	date_created timestamp,
	date_updated timestamp
);