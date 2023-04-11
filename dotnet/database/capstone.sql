USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE examples (
	example_id int IDENTITY(1,1) NOT NULL,
	title nvarchar(100) NOT NULL,
	code_language nvarchar(50) NOT NULL, 
	code nvarchar (MAX) NOT NULL,
	attribution nvarchar (300),
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO examples (title, code_language, code ) VALUES('How to make a For Each Loop', 'C#', 'int[] numbers = {1, 2 ,3 ,4 ,5, 6} ; foreach (int item in numbers) { item = item + 1; }');
INSERT INTO examples (title, code_language, code ) VALUES('How to make a List', 'C#', 'List<string> testList = new List<string>();');
INSERT INTO examples (title, code_language, code, attribution ) VALUES('How to make a List', 'C#', 'List<string> testList = new List<string>();', 'Da Boiz');

INSERT INTO examples (title, code_language, code ) VALUES('@title', '@codeLanguage', '@code');

UPDATE examples 
SET 
	title = 'tittel'

WHERE
	example_id = 2

SELECT * FROM examples



GO
SELECT * FROM examples



