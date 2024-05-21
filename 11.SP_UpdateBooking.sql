use littlelemondb;
DELIMITER //

CREATE PROCEDURE UpdateBooking(IN bookingID INT, IN bookingDate DATE)
BEGIN
    DECLARE tableStatus VARCHAR(50);
    DECLARE Result VARCHAR(50);
    
    START TRANSACTION;
    
    CALL CheckBookingID(bookingID, @tableStatus);
    
    SET tableStatus = @tableStatus;
    
    IF tableStatus = 'FOUND' THEN
		UPDATE bookings SET date = bookingDate where booking_id = bookingID;
        COMMIT;
        SET Result = 'Booking Date updated';
    ELSE
        ROLLBACK;
        SET Result = 'Nonexistent ID';
    END IF;
    
    SELECT Result AS Transaction_result;
END //

DELIMITER ;