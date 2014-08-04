CREATE TABLE lifeboat_events_attendance (
	id serial PRIMARY KEY,
	attendee_fk int, -- connected to lifeboat_user
	date_created timestamp,
	date_updated timestamp
);