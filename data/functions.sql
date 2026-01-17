DELIMITER //

-- Create a new user
CREATE FUNCTION adduser(username VARCHAR(10), password VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    INSERT INTO users (username, password) VALUES (username, password);
    RETURN CONCAT('User "', username, '" created.');
END //

-- Delete a user by ID
CREATE FUNCTION deleteuser(user_id INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DELETE FROM users WHERE id = user_id;
    RETURN CONCAT('User with ID ', user_id, ' deleted.');
END //

-- Display all usernames
CREATE FUNCTION display_all_users()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE usernames TEXT;
    SELECT GROUP_CONCAT(username SEPARATOR ', ') INTO usernames FROM users;
    RETURN usernames;
END //

-- Display all users with their primary keys
CREATE FUNCTION display_all_users_with_pk()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE users_info TEXT;
    SELECT GROUP_CONCAT(CONCAT(id, ':', username) SEPARATOR ', ') INTO users_info FROM users;
    RETURN users_info;
END //

-- Display the last created user
CREATE FUNCTION display_last_created_user()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE last_user TEXT;
    SELECT username INTO last_user FROM users ORDER BY id DESC LIMIT 1;
    RETURN last_user;
END //

-- Display the first created user
CREATE FUNCTION display_first_created_user()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE first_user TEXT;
    SELECT username INTO first_user FROM users ORDER BY id ASC LIMIT 1;
    RETURN first_user;
END //

-- Create users table
CREATE PROCEDURE create_users_table()
BEGIN
    CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        email VARCHAR(100),
        full_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    );
END //

DELIMITER ;
