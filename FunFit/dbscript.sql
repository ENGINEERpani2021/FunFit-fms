create database funfit;
use funfit;
----------------
create table Batches(batch_id int primary key auto_increment, batch_type varchar(10), batch_time varchar(10));
----------------
create table participants(participant_id INT AUTO_INCREMENT PRIMARY KEY, batch_id INT, participant_name VARCHAR(25), participant_age INT, participant_email VARCHAR(50),participant_phn VARCHAR(12), foreign key(batch_id) references batches(batch_id) on delete cascade);
----------------
create table id(last_inserted_id INT) -- pointer for batch table for last incremented row
----------------- 
create table participant_id(last_inserted_id INT) -- pointer for participant table last incremented row
-----------------
DELIMITER &&
CREATE PROCEDURE createBatch (IN type VARCHAR(10), IN time VARCHAR(10))
BEGIN
    INSERT INTO batches VALUES (null, type, time);
    UPDATE id SET last_inserted_id = LAST_INSERT_ID();
END && DELIMITER ;
-----------------
DELIMITER &&
CREATE PROCEDURE createParticipant (IN batch_id INT, IN name VARCHAR(25), IN age INT, IN email VARCHAR(50), IN phn VARCHAR(12))
BEGIN
    INSERT INTO participants VALUES (null, batch_id, name, age, email, phn);
    UPDATE participant_id SET last_inserted_id = LAST_INSERT_ID();
END && DELIMITER ;
-----------------