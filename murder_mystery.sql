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

CREATE TABLE records (
	id SERIAL4 PRIMARY KEY,
	content TEXT
);


CREATE TABLE user_characters (
	id SERIAL4 PRIMARY KEY,
	user_id VARCHAR(100),
	char_id VARCHAR(100)
);

ALTER TABLE user_characters ADD created_at TIMESTAMP NOT NULL DEFAULT NOW();

ALTER TABLE records   
RENAME TO scores;  


UPDATE scores SET content='Tom finished as Detective Niall Redmond, who was the victim of curiosity and mystery cliches.' WHERE id=16;
UPDATE scores SET content='Sam finished as Detective Phryne Fisher, who was the victim of curiosity and mystery cliches.' WHERE id=15;

UPDATE endings SET story_id='38' WHERE id=9;

UPDATE scores SET content='swoopy finished as Detective Gump Lord, who was the victim of curiosity and mystery cliches.' WHERE id=33;
UPDATE scores SET content='Julie finished as Detective Inspector Rex, who ascended to their doom... and discovered a grim secret?' WHERE id=31;
UPDATE scores SET content='Dan finished as Detective Syndicated Inbox, who didnt know when to turn back, or give up.' WHERE id='28';
UPDATE scores SET content='Melissa finished as Detective Jessica Jones, who was the victim of curiosity and mystery cliches.' WHERE id='26';
UPDATE scores SET content='Dan finished as Detective Rhodia Teabox who took off without solving the crime, and got a beer.' WHERE id='23';
UPDATE scores SET content='Dan finished as Detective Biro Stickynote who ascended to their doom... and discovered a grim secret?' WHERE id=21;