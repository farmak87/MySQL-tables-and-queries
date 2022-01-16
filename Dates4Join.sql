CREATE DEFINER=`root`@`localhost` PROCEDURE `dates4join`()
BEGIN

SET @dateVariable = '2022-01-02';
DROP TABLE IF EXISTS Dates4Join;
CREATE TEMPORARY TABLE Dates4Join (PDate date, CDate date);
	SET @startdate = @dateVariable,
		@endtime  = date_add(curdate(), interval 0 day),
		@PDate = @dateVariable,
		@CDate = @dateVariable;

 WHILE (@startdate <= @endtime) DO
	    WHILE (@CDate <= @endtime) DO
				INSERT INTO Dates4Join VALUES (@PDate,@CDate);
				SET @CDate = date_add(@CDate, interval 1 day);
		END WHILE;
		SET @PDate  = date_add(@PDate, interval 1 day);
		SET @CDate = @PDate;
		SET @startdate = date_add(@startdate, interval 1 day);
END WHILE;

END
