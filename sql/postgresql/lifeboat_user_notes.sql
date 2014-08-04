CREATE TABLE lifeboat_user_notes (
	id serial PRIMARY KEY,
	name_full varchar(100),
	note_type int, 
	description text,
	subject_fk int, -- connected to lifeboat_user; the one we write about
	reporter_fk int, -- connected to lifeboat_user; the one making the note
	date_created timestamp,
	date_updated timestamp
);