CREATE TABLE lifeboat_tags (
	id serial PRIMARY KEY,
	name varchar(100),
	tag_type int, 
	description varchar(100),
	date_created timestamp,
	date_updated timestamp
);