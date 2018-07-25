CREATE DATABASE murder_mystery; 

CREATE TABLE users (
	id SERIAL4 PRIMARY KEY, 
	name VARCHAR(100), 
	email VARCHAR(300),
	password_digest VARCHAR(400)
);

CREATE TABLE characters (
	id SERIAL4 PRIMARY KEY,
	name VARCHAR(100),
	background VARCHAR(400),
	outcome VARCHAR(400)
);


INSERT INTO users (name, email, password) values ('megan', 'megan.mckeough@gmail.com', 'pudding');

UPDATE users SET password = 'pudding' WHERE id = 1;

ALTER TABLE characters ADD created_at TIMESTAMP;

ALTER TABLE characters DROP created_at;

ALTER TABLE characters ADD created_at TIMESTAMP NOT NULL DEFAULT NOW();

CREATE TABLE segments (
	id SERIAL4 PRIMARY KEY,
	story_id VARCHAR(100),
	content TEXT,
	options TEXT
);


INSERT INTO segments (story_id, content, options) values ('1', 'test content 1', );