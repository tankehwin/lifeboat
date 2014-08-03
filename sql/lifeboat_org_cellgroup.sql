CREATE TABLE lifeboat_org_cellgroup (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name_full varchar(100),
	name_short varchar(20),
	description text,
	leader_fk int, -- connected to lifeboat_user
	date_created datetime,
	date_updated datetime
);