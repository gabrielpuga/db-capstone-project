use littlelemondb;
DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT, OUT tableStatus VARCHAR(50))
BEGIN
    SELECT 
        CASE
            WHEN EXISTS (
                SELECT 1 FROM Bookings 
                WHERE date = bookingDate AND table_number = tableNumber
            )
            THEN 'Booked'
            ELSE 'Available'
        END INTO tableStatus;
  
    SELECT tableStatus AS Table_Status;
END //

DELIMITER ;
