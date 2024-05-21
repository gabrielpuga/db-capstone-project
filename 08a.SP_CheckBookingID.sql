use littlelemondb;
DELIMITER //

CREATE PROCEDURE CheckBookingID(IN bookingID INT, OUT tableStatus VARCHAR(50))
BEGIN
    SELECT 
        CASE
            WHEN EXISTS (
                SELECT 1 FROM Bookings 
                WHERE booking_id = bookingID
            )
            THEN 'FOUND'
            ELSE 'NotFound'
        END INTO tableStatus;
  
    SELECT tableStatus AS Table_Status;
END //

DELIMITER ;