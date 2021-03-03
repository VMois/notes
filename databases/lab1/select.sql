Use Lab1

SELECT st.Name as 'Student Name', d.Date, dr.Name as 'Driver Name', dr.PhoneNumber as 'Contact Number'
FROM Student AS st
INNER JOIN
Address AS addr
ON st.AddressID = addr.ID
INNER JOIN
Route AS r
ON addr.RouteID = r.ID
INNER JOIN
DailyDrive as d
On r.ID = d.RouteID
INNER JOIN
Driver as dr
ON d.DriverID = dr.ID
WHERE d.Date = '2015-02-08' and st.Name = 'Nguyen Ky'