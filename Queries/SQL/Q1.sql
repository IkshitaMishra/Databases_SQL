
/*

Used Oracle Live SQL  https://livesql.oracle.com/


1) Added Constraint to the HotelStays table on arrival date to be lesser than departure date. 
   eg. constraint check_dates1 check (arrDate < depDate)
2) Created a Trigger which runs before insert statement for each row if, the new room number already exists and the current departure date is
greater than arrival date and  the current arrival date is lesser than departure date, error is thrown that a room is booked! 
     Room No    Arrival Date      Departure Date
eg - 123        2nd Feb 2019      6th Feb 2019  -----------> Success
     123        4th Feb 2019      5th Feb 2019  -----------> Error
     123        1st Feb 2019      7th Feb 2019  -----------> Error
     123        3rd Feb 2019      9th Feb 2019  -----------> Error
     124        12th Feb 2019     9nd Feb 2019  -----------> Error
     124        2th Feb 2019      9nd Feb 2019  -----------> Error 


*/

CREATE TABLE HotelStays
(roomNum INTEGER NOT NULL,
arrDate DATE NOT NULL,
depDate DATE NOT NULL,
guestName CHAR(30) NOT NULL,
constraint check_dates1 check (arrDate < depDate),
PRIMARY KEY (roomNum, arrDate));


CREATE OR REPLACE TRIGGER overlapping_date
BEFORE INSERT 
  ON  HotelStays
    FOR EACH ROW 
    DECLARE days NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO days
        FROM HotelStays 
        WHERE roomNum = :NEW.roomNum and :NEW.depDate > arrDate and :New.arrDate < depDate ;
        IF days > 0 
            THEN raise_application_error(-20005,'Roomed is already in Booked for the day! ..........');
        END IF;
    END;
    
    


/*

PLEASE COMMENT ABOVE TRIGGER AND EXECUTE BELOW INSERT, SINCE TRIGGER IS ON INSERT

INSERT INTO HotelStays(roomNum, arrDate, depDate, guestName)
VALUES (123, to_date('20160210', 'YYYYMMDD'), to_date('20160211','YYYYMMDD'), 'A');

SELECT * FROM HotelStays;

*/

