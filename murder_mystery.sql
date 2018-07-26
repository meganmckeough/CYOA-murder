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

ALTER TABLE characters ADD created_at TIMESTAMP;

ALTER TABLE characters DROP created_at;

ALTER TABLE characters ADD created_at TIMESTAMP NOT NULL DEFAULT NOW();

CREATE TABLE segments (
	id SERIAL4 PRIMARY KEY,
	story_id VARCHAR(100),
	content TEXT,
	options TEXT
);

UPDATE segments SET content='You enter the conservatory with apprehension, but there is nothing but a dark, glass-walled room - empty. You decide to take a look around anyway. It is not long before you find it. A long, thin letter opener, hidden in a pot plant. As the rain lashes the roof of the conservatory, you reach down and grasp the handle. You are just examining the engraved initials ("J.A") when someone clears their throat behind you. You whip around and are confronted with a tall man in round glasses and a neat moustache. Your hand tightens around the letter opener as your instincts kick in.  You quickly lash out with the letter opener, slashing his cheek and splashing blood on his butler uniform. While he is stunned, you push him aside and run for the door. Once in the hallway, you block the door from the outside to prevent his escape.' WHERE story_id='32';

ALTER TABLE characters RENAME COLUMN outcome TO ending;

CREATE TABLE endings (
	id SERIAL4 PRIMARY KEY,
	story_id VARCHAR(100),
	name TEXT
);

ALTER TABLE endings
  ADD content TEXT;