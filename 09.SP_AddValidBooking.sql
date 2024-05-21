USE littlelemondb;
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus VARCHAR(50);
    DECLARE Result VARCHAR(50);
    
    START TRANSACTION;
    
    CALL CheckBooking(bookingDate, tableNumber, @tableStatus);
    
    SET tableStatus = @tableStatus;
    
    IF tableStatus = 'Booked' THEN
        ROLLBACK;
        SET Result = 'Already booked. Booking cancelled.';
    ELSE
        INSERT INTO Bookings(date, table_number) VALUES (bookingDate, tableNumber);
        COMMIT;
        SET Result = 'Booking success.';
    END IF;
    
    SELECT Result AS Transaction_result;
END //

DELIMITER ;
