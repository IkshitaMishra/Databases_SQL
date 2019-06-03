/*

Used  https://livesql.oracle.com/ Oracle Live SQL

*/

CREATE TABLE junkmail  
(  
Name CHAR(30) NOT NULL,  
Address CHAR(30) NOT NULL, 
ID INTEGER NOT NULL,  
SameFam INTEGER NULL 
);


INSERT ALL   
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Alice', 'A' , 10 , NULL)  
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Bob', 'B' , 15, NULL)  
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Carmen', 'C' , 22, NULL)  
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Diego', 'A' , 9 , 10)  
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Ella', 'B' , 3, 15)  
    INTO junkmail ( Name, Address, ID,SameFam) VALUES ('Farkhad', 'D' ,11, NULL)  
SELECT * FROM dual ;



DELETE
FROM junkmail
WHERE ID IN (
SELECT SameFam
FROM junkmail 
WHERE SameFam IS NOT NULL);


Select * from junkmail;