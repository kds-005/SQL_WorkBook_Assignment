USE assignment2;

--1
SELECT MIN(amount) as MinAmount, MAX(amount) as MaxAmount, AVG(amount) as AvgAmount
FROM orders;

--2
CREATE FUNCTION mutli10(@num INT)
 RETURNS INT
AS
BEGIN 
	RETURN(@num*10)
END

PRINT dbo.mutli10(2)

--3
CREATE FUNCTION check100()
 RETURNS VARCHAR(40)
AS
BEGIN
	DECLARE @a AS INT
	DECLARE @b AS INT
	set @a =100
	set @b =200

	RETURN
		CASE 
			WHEN @a > @b THEN '100 Greater than 200'
			WHEN @a = @b THEN '100 Equal to 200'
			ELSE '100 Lesser than 200'
		END
END

PRINT dbo.check100()