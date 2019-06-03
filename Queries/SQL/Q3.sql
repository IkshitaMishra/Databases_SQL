
/*

Used Oracle Live SQL  https://livesql.oracle.com/



*/


CREATE TABLE projects  
(  
ProjectId CHAR(30) NOT NULL,  
Step  INTEGER NOT NULL,  
Status CHAR(30) NOT NULL
);


INSERT ALL   
    INTO projects ( ProjectId, Step, Status) VALUES ('P100', 0 , 'C')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P100', 1 , 'W')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P100', 2 , 'W')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P201', 0 , 'C')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P201', 1 , 'C')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P333', 0 , 'W')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P333', 1 , 'W')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P333', 2 , 'W')  
    INTO projects ( ProjectId, Step, Status) VALUES ('P333', 3 , 'W')  
SELECT * FROM dual ;




SELECT P2.PROJECTID 
FROM 
    (SELECT DISTINCT PROJECTID 
    FROM PROJECTS  
    WHERE STEP <> 0 AND STATUS = 'W') P1 
    JOIN PROJECTS P2   
    ON P1.PROJECTID = P2.PROJECTID 
WHERE P2.STEP = 0 AND P2.STATUS = 'C' ;