create database ads;

CREATE TABLE cars (
                      id SERIAL PRIMARY KEY,
                      model TEXT,
                      mark TEXT,
                      body TEXT
);
CREATE TABLE posts (
                      id SERIAL PRIMARY KEY,
                      description TEXT,
                      status BOOLEAN,
                      user_id INTEGER,
                      car_id INTEGER,
                      FOREIGN KEY NOT NULL (user_id) REFERENCES users (Id),
                      FOREIGN KEY NOT NULL (car_id) REFERENCES cars (Id)
);
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
    CONSTRAINT email_unique UNIQUE (email)
);