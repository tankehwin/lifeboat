CREATE TABLE lifeboat_events_attendance (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	attendee_fk int, -- connected to lifeboat_user
	date_created datetime,
	date_updated datetime
);