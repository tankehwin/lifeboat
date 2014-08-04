CREATE TABLE lifeboat_events (
	id serial PRIMARY KEY,
	name varchar(100),
	description text,
	evt_type int,
	organiser_fk int, -- connected to lifeboat_user
	date_start timestamp,
	date_end timestamp,
	date_created timestamp,
	date_updated timestamp
);