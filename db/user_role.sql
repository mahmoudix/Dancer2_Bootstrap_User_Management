CREATE TABLE user_role (
    users_id int(11) NOT NULL,
    role_id int(11) NOT NULL,
    PRIMARY KEY (users_id, role_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

