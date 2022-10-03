DROP TABLE IF EXISTS mpa,films,genre,film_genre,users,likes,friends, reviews CASCADE;

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

CREATE TABLE IF NOT EXISTS reviews (
    review_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    content varchar(100),
    is_positive boolean,
    user_id INTEGER references users (user_id) ON DELETE CASCADE,
    film_id INTEGER references films (id) ON DELETE CASCADE,
    useful INTEGER
);
