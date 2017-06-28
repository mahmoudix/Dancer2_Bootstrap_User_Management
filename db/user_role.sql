CREATE TABLE user_role (
    user_id int(11) NOT NULL,
    role_id int(11) NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

