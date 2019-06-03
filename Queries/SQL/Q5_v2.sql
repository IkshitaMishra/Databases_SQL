/*

Used Oracle LIVE SQL  https://livesql.oracle.com/

Oracle has function of List Aggregation which creates a list of members in a particular group. Here, I first created a list of members in a group
eg. :
D                               Apple pie                                                                                           
D                               Upside down pineapple cake                                                                          
D                               Creme brulee  

==> 

D                               'Apple pie' , 'Upside down pineapple cake' , 'Creme brulee'


I gave a where condition which checks that a new grouped dish list should have all these three dishes 'Apple pie' , 'Upside down pineapple cake' , 'Creme brulee'.
Thus it use escape character for checking these dishes in string list.

 eg. dish LIKE '%Apple pie%' AND c.listOfDish  LIKE '%Upside down pineapple cake%' AND c.listOfDish  LIKE '%Creme brulee%';

%Apple means one or more number of charasters at start 
 cake% means one or more number of charasters at end 


 Here I use String Matching using List Aggregation Method and Escape Sequence Like %

*/


CREATE TABLE chefs
(   
Chef VARCHAR2(30) NOT NULL,  
dish VARCHAR2(100) NOT NULL
);

INSERT ALL   
    INTO chefs ( chef, dish) VALUES ( 'A','Mint chocolate brownie')  
    INTO chefs ( chef, dish) VALUES ( 'B','Upside down pineapple cake')  
    INTO chefs ( chef, dish) VALUES ( 'B','Creme brulee')  
    INTO chefs ( chef, dish) VALUES ( 'B','Mint chocolate brownie')  
    INTO chefs ( chef, dish) VALUES ( 'C','Upside down pineapple cake')  
    INTO chefs ( chef, dish) VALUES ( 'C','Creme brulee')
    INTO chefs ( chef, dish) VALUES ( 'D','Apple pie')
    INTO chefs ( chef, dish) VALUES ( 'D','Upside down pineapple cake')
    INTO chefs ( chef, dish) VALUES ( 'D','Creme brulee')
    INTO chefs ( chef, dish) VALUES ( 'E' ,'Apple pie')
    INTO chefs ( chef, dish) VALUES ( 'E' ,'Upside down pineapple cake')
    INTO chefs ( chef, dish) VALUES ( 'E' ,'Creme brulee')
    INTO chefs ( chef, dish) VALUES ( 'E' ,'Bananas Foster')
SELECT * FROM dual ;




select c.chef from (
SELECT chef, ',' || LISTAGG(dish, ',') WITHIN GROUP (ORDER BY dish) || ',' as listOfDish
 FROM chefs
 GROUP BY chef ) c
where c.listOfDish LIKE '%,Apple pie,%' AND c.listOfDish  LIKE '%,Upside down pineapple cake,%' AND c.listOfDish  LIKE '%,Creme brulee,%';