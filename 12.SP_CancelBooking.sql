use littlelemondb;
DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
    DECLARE tableStatus VARCHAR(50);
    DECLARE Result VARCHAR(50);
    
    START TRANSACTION;
    
    CALL CheckBookingID(bookingID, @tableStatus);
    
    SET tableStatus = @tableStatus;
    
    IF tableStatus = 'FOUND' THEN
		DELETE from bookings where booking_id = bookingID;
        COMMIT;
        SET Result = 'Booking Cancelled';
    ELSE
        ROLLBACK;
        SET Result = 'Nonexistent ID';
    END IF;
    
    SELECT Result AS Transaction_result;
END //

DELIMITER ;