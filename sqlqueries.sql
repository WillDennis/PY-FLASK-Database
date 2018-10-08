/*Method 1
%s - used in python to register input from form */
INSERT INTO Customer(CustomerID, name , email) VALUES ('111'/*%s*/, 'John Wick'/*%s*/, 'jw@jw.com'/*%s*/);

/*Method 2
%s - used in python to register input from form */
INSERT INTO Ticket(Ticketid, Problem, Status, Priority, Loggedtime, Customerid, Productid)
VALUES('10001'/*%s*/,'Login Failure'/*%s*/,'open'/*%s*/,'1' /*%s*/,'2018/05/09 14:00'/*%s*/,'111'/*%s*/,'1'/*%s*/);

SELECT * FROM Ticket WHERE TicketID = '1002'/*%s*/

/*Method 3
%s - used in python to register input from form */
INSERT INTO TicketUpdate(Ticketupdateid, Message, Updatetime, Ticketid, Staffid)
VALUES ('100001'/*%s*/,'Fixed'/*%s*/,'2018/05/09 14:00'/*%s*/,'1002'/*%s*/,'102'/*%s*/);

/*Method 4
%s - used in python to register input from form */
SELECT Ticket.TicketID, Problem, Status, Priority, Loggedtime, Customerid, Productid FROM TicketUpdate 
RIGHT JOIN Ticket ON Ticket.TicketID = TicketUpdate.TicketID WHERE Status = 'open'/*%s*/;

/*Method 5
%s - used in python to register input from form */
UPDATE Ticket SET Status = 'closed'/*%s*/ 
WHERE Ticketid = '1002' /*%s*/;

/*Method 6
%s - used in python to register input from form */
SELECT Ticket.TicketID, Problem, Customer.Name, Message, Staff.Name, UpdateTime FROM Ticket, TicketUpdate,Customer, Staff
WHERE TicketUpdate.StaffID = Staff.StaffID 
AND Customer.CustomerID = Ticket.CustomerID 
AND Ticket.TicketID = TicketUpdate.TicketID 
AND Ticket.TicketID = '1002'/*%s*/ ORDER BY UpdateTime;

/*Method 7
%s - used in python to register input from form*/
CREATE OR REPLACE VIEW times (Ticket_ID, minUpdateTime, maxUpdateTime) AS \
                    SELECT Ticket.TicketID, MIN(UpdateTime), MAX(UpdateTime)\
                    FROM Ticket, TicketUpdate \
                    WHERE Ticket.TicketID = TicketUpdate.TicketID \
                    GROUP BY Ticket.TicketID;

CREATE OR REPLACE VIEW report (TicketID, Status, ElaspedTime, TotalTime , NumUpdates) AS \
                    SELECT Ticket.TicketID, Status , SUM(minUpdateTime-LoggedTime), SUM(maxUpdateTime-LoggedTime), COUNT(TicketUpdate.TicketID) \
                    FROM Ticket, TicketUpdate, times \
                    WHERE Ticket.TicketID = TicketUpdate.TicketID AND Ticket.TicketID = times.Ticket_ID AND Ticket.Status = %s\
                    GROUP BY Ticket.TicketID;,['closed']
SELECT * FROM report;

/*Method 8
%s - used in python to register input from form */
DELETE FROM Customer WHERE CustomerID = '111'/*%s*/
