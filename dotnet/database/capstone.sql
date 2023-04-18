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
 For a multi line comment do /* at the beginning and */ at the end
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

INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use SELECT', 'SQL',
'SELECT a.cats FROM animals a', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to select with a filter', 'SQL',
'SELECT a.cats FROM animals a WHERE a.name = "Louise"', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use ORDER BY', 'SQL',
'SELECT a.cats FROM animals a ORDER BY cutest DESC;', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use JOIN', 'SQL',
'SELECT a.cats, t.small FROM animals a JOIN towers t ON t.tower_size = a.animal_size', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to create a table', 'SQL',
'CREATE TABLE animals 
pet_id INT PRIMARY KEY,
pet_name NVARCHAR(100),
pet_type NVARCHAR(100)', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to delte from a table', 'SQL',
'DELETE FROM animals WHERE pet_type = Dog', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to update a table in SQL', 'SQL',
'UPDATE animals SET louis = louise', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('Using order by in sql', 'SQL',
'SELECT pet_id FROM animals ORDER BY pet_cuteness ASC', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
 ('USING like in SQL', 'SQL',
 'SELECT pet_name FROM animals WHERE first_name like loui%', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use null in sql', 'SQL',
'SELECT pet_name FROM animals WHERE pet_owner = null', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('Data types in Java', 'Java',
'boolean=true (or false)
char is single Character ie C
byte is up to 8 numbers ie 12345678
short is up to 16 numbers ie 1234567891012345', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to Declare a variable', 'Java',
'string name = "Skeletor"
int favoriteNumber = 42
boolean isfourty = true;', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a for loop', 'Java',
'for (int i = 0; i <= 10; i = i + 2) {
  System.out.println(i);
}', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a for each loop', 'Java',
'String[] Skelles = {"Skeletor", "Bone Jovi", "Bone Cold steve austin", "Jack Marrow"};
for (String i : skelles) {
  System.out.println(i);
}', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a while loop', 'Java',
'int Skelle = 2;
switch (day) {
  case 1:
    System.out.println("Skeletor");
    break;
  case 2:
    System.out.println("Bone Jovi");
    break;
  case 3:
    System.out.println("Bone Cold steve austin");
    break;
}', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make an array', 'Java',
'String[] skelles = {"Jerry spinefield", "Morty McFly", "Nicholas Ribcage", "Walter Wight"};', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a map', 'Java',
'Map<String, Integer> skelles = new Hashtable<>();

skelles.put("Marrow Robbie", 1);
skelles.put("Napoleon Bone-apart", 4);
skelles.put("Robert Dreadford", 2);
skelles.put("Death Bridges", 3);', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('If statements', 'Java',
'int x = 42;
int y = 77;
if (x > y) {
  System.out.println("x is greater than y");
}', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make comments', 'Java',
'For a single line comment do //
For a mult line comment do /* at the beginning and */ at the end', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('Do while loops', 'Java',
'int i=10;
         do{
              System.out.println(i);
              i--;
         }while(i>1);', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('Data types', 'JavaScript',
'var age = 4000;
var name = Skeletor;
var truth = false;', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make an object', 'JavaScript',
'var skeleton = {
var age - 4000,
var firstName = Skel,
var lastName = tor,}', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to include an external file', 'JavaScript',
'<script src="Examplefilename.js"></script>', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use If else', 'JavaScript',
'if ((age >= 120) && (age < 4000)) {
status = "Skeleton";
} else {
status = "Human";
}', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use a while Loop', 'JavaScript',
'var i = 1;
while (i < 100) {
i *= 2
document.write(i + ", ");
}', 1)
 INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to use a For Loop', 'JavaScript',
'for (var i = 0; i < 10; i++) {
document.write(i + ": " + i*3);
}', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make an array', 'JavaScript',
'var skelles = ["Eddie Deader", "Bugs Boney", "Bone Thug"];', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make an on click event', 'JavaScript',
'<button onclick="myFunction()">Click me</button>', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to make a div', 'JavaScript',
 '<div class="card example">
	<h2> example h2 </h2>
  </h2>', 1)
INSERT INTO
examples (title, code_language, code, approved ) 
VALUES
('How to add an image', 'JavaScript',
'<img src="TestImg.png" />', 1)

SELECT * FROM examples
GO




