DROP TABLE IF EXISTS mpa,films,genre,film_genre,directors,film_directors,users,likes,friends CASCADE;

CREATE TABLE IF NOT EXISTS mpa (
    id INTEGER PRIMARY KEY,
    mpa_name varchar(8)
);

CREATE TABLE IF NOT EXISTS films (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(50) NOT NULL,
    description varchar,
    release_date date,
    duration integer NOT NULL ,
    mpa_id INTEGER references mpa (id)
);

CREATE TABLE IF NOT EXISTS genre (
    id INTEGER PRIMARY KEY,
    name varchar(30)
);

CREATE TABLE IF NOT EXISTS film_genre (
    film_id INTEGER references films (id) ON DELETE CASCADE,
    genre_id INTEGER references genre (id)
);

CREATE TABLE IF NOT EXISTS directors (
    id INTEGER PRIMARY KEY,
    name varchar(80)
);

CREATE TABLE IF NOT EXISTS film_directors (
    film_id INTEGER references films (id) ON DELETE CASCADE,
    director_id INTEGER references directors (id)
);

CREATE TABLE IF NOT EXISTS users (
     user_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
     email varchar(40),
     login varchar(30),
     name varchar(30),
     birthday_date date,
     friends integer
);

CREATE TABLE IF NOT EXISTS likes (
    id INTEGER references films (id) ON DELETE CASCADE,
    user_id integer references users (user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS friends (
    user_id INTEGER references users (user_id) ON DELETE CASCADE,
    friends_id integer,
    status boolean
);
