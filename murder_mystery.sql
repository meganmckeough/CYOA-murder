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