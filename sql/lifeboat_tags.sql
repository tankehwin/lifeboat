CREATE TABLE lifeboat_tags (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(100),
	tag_type int, 
	description varchar(100),
	date_created datetime,
	date_updated datetime
);