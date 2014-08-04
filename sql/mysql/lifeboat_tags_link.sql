CREATE TABLE lifeboat_tags_link (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tag_fk int,
	link_type int, -- table type
	link_fk int, -- connected to whichever table this is tagged to
	date_created datetime,
	date_updated datetime
);