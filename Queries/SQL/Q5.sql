/*

Used Oracle LIVE SQL  https://livesql.oracle.com/


2 tables are used : Chefs and Dishes

This query firsts scans all the distinct (non-repeated) rows for chefs who can cook dish 'Apple pie' or 'Upside down pineapple cake' or 'Creme brulee'. 

'Apple pie' or 'Upside down pineapple cake' or 'Creme brulee' are  values from dishes table

It groups by the chef based on the dishes they cook. 

If count of chef (after grouoing) is equal than 3 (Total count of rows in dishes table) for each group,

 it means the chef can  cooks all these 'Apple pie' and 'Upside down pineapple cake' and 'Creme brulee'. 

Here I use Group By, then use Having Clause to check condition HAVING COUNT (C.chef) = 3


Uses Divide Operation

*/


CREATE TABLE chefs
(   
Chef CHAR(30) NOT NULL,  
dish CHAR(100) NOT NULL
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


CREATE TABLE dishes
(    
dish CHAR(100) NOT NULL
);

INSERT ALL   
    INTO dishes ( dish) VALUES ('Apple pie')  
    INTO dishes ( dish) VALUES ( 'Upside down pineapple cake')  
    INTO dishes ( dish) VALUES ( 'Creme brulee')  
SELECT * FROM dual ;







SELECT C.chef 
FROM ( SELECT DISTINCT * FROM chefs ) C
WHERE dish IN (SELECT dish FROM dishes)
GROUP BY C.chef
HAVING COUNT (C.chef) = (SELECT count(*) FROM dishes);