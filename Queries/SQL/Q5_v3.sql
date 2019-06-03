/*

Used Oracle LIVE SQL  https://livesql.oracle.com/

Two tables are used Dishes and Chefs


 First, add a flag column to each row in dishes table with value 1

 Then I perform a left outer join operation which joins all rows in dishes with all rows of chefs with common value D.DISH = C.DISH

 Then I group by the category of chef and count the sum of flag value.

 If sum  = 3 , then the chef cooks all the dishes in dishes table

 Thus , I used Left outer join operation and use SUM function for flags

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


SELECT c.chef
FROM  (select dish, 1 as Flag from dishes) D LEFT OUTER JOIN ( SELECT DISTINCT * FROM chefs ) C
ON D.DISH = C.DISH
group by chef
HAVING sum (D.flag) = (SELECT count(*) FROM dishes);
