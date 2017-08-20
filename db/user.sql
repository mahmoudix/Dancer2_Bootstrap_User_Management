CREATE TABLE user (
    id int(11) NOT NULL AUTO_INCREMENT,
            username varchar(32) NOT NULL,
    password varchar(40) DEFAULT NULL,
    name varchar(128) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    deleted tinyint(1) NOT NULL DEFAULT '0',
    lastlogin datetime DEFAULT NULL,
    pw_changed datetime DEFAULT NULL,
    pw_reset_code varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id	INTEGER PRIMARY KEY,
    username VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(40) NOT NULL,
    email           VARCHAR(255) DEFAULT NUL UNIQUE,
    deleted	tinyint(1) NOT NULL DEFAULT '0',
    lastlogin datetime DEFAULT NULL,
    pw_changed datetime DEFAULT NULL,
    pw_reset_code varchar(255) DEFAULT NULL,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP
);
