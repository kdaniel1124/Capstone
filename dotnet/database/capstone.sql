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
	attribution_author nvarchar (300),
	attribution_url nvarchar (300),
	approved bit NOT NULL,
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO
examples (title, code_language, code, approved )
VALUES
('How to make a For Each Loop', 'C#',
'int[] numbers = {1, 2 ,3 ,4 ,5, 6};
foreach (int item in numbers)
 {
	item = item + 1; 
  }', 1);

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a List', 'C#', 'List<string> testList = new List<string>();', 1);

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make an Array', 'C#', 'int[] myNum = {10, 20, 30, 40};', 1);

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a For Loop', 'C#',
'for (int i = 1; i <= 100; i++)
 { 
	if (i % 3 == 0 && i % 5 == 0)
	{
		{Console.WriteLine("FizzBuzz")
	}
 }', 1);

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to create Concatinated String', 'C#',
'String first = "Skele";
 String Last = "Tor";
 String name = first + last;', 1);

 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to add comments', 'C#',
'For a single line comment do //
 For a mult line comment do /* at the beginning and */ at the end
 For a To Do list do // TODO:', 1)

 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to print to the console', 'C#',
'console.writeline("Hello World");', 1)

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to declare a multitude of Variables', 'C#',
'int number = 42;
 long longNumber = 42000000;
 double doubleNumber = 42.42;
 decimal decimalNumber = 42.42m;
 char forSomeReasonOnlyOneLetter = D;
 bool isMattTheBestTeacher = true;', 1)

 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to take in user input', 'C#',
'console.ReadLine();', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to set an access modifier and what they do', 'C#',
'public int (Accessible by any other code)
 private int (Only Accessible by code in the same class)
 protected int (Only Accessible by code in the same class or derived class)
 abstract class (Class is intended only to be a bse of other classes)', 1)
 

SELECT example_id, title, code_language, code, attribution_author, attribution_url FROM examples WHERE code_language LIKE '@searchString' OR title LIKE '@searchString' OR code LIKE '@searchString' OR attribution_author LIKE '@searchString'


SELECT * FROM examples
GO




