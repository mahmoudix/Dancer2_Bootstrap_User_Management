CREATE TABLE role (
    id int(11) NOT NULL AUTO_INCREMENT,
    role varchar(32) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role (
    id              INTEGER PRIMARY KEY, -- autoincrements in SQLite
    role varchar(32) NOT NULL,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP
);
