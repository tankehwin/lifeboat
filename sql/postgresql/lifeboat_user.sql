CREATE TABLE lifeboat_user (
	id serial PRIMARY KEY,
	name_full varchar(100),
	name_short varchar(20),
	dob timestamp,
	org_name varchar(50), -- could be a school name, or company name etc.
	org_type varchar(20), -- university, company, school, none
	email varchar(50),
	phone varchar(15),
	cellgroup_fk int, -- connected to lifeboat_org_cellgroup
	acc_type int, -- 1 = admin, 2 = user
	date_joined timestamp,
	date_created timestamp,
	date_updated timestamp
);