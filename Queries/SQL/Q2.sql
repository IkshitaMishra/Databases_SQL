
/*

Used Oracle Live SQL  https://livesql.oracle.com/



*/


CREATE TABLE enrollment  
(  
SID INTEGER NOT NULL,  
ClassName CHAR(30) NOT NULL,  
Grade CHAR(30) NOT NULL
);


INSERT ALL   
    INTO enrollment (SID, ClassName, Grade) VALUES (123, 'ART123' , 'A')  
    INTO enrollment (SID, ClassName, Grade) VALUES (123, 'BUS456' , 'B')  
    INTO enrollment (SID, ClassName, Grade) VALUES (666, 'REL100' , 'D')  
    INTO enrollment (SID, ClassName, Grade) VALUES (666, 'ECO966' , 'A')  
    INTO enrollment (SID, ClassName, Grade) VALUES (666, 'BUS456' , 'B')  
    INTO enrollment (SID, ClassName, Grade) VALUES (345, 'BUS456' , 'A')  
    INTO enrollment (SID, ClassName, Grade) VALUES (345, 'ECO966' , 'F')  
SELECT * FROM dual;

SELECT ClassName, COUNT(ClassName) AS Total  
FROM enrollment  
GROUP BY ClassName  
ORDER BY COUNT(ClassName) ASC , ClassName ASC;


