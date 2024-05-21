use littlelemondb;
DELIMITER //

CREATE PROCEDURE AddBooking(IN bookingDate DATE, IN tableNumber INT, IN customerID INT, IN staffID INT)
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
        INSERT INTO Bookings(date, table_number, customer_id, staff_id) VALUES (bookingDate, tableNumber, customerID, staffID);
        COMMIT;
        SET Result = 'New booking added';
    END IF;
    
    SELECT Result AS Transaction_result;
END //

DELIMITER ;