--Author William Dennis 100157542
--Date 09/05/2018
--------------------------------------------------------------------------
--Creating Database--
--------------------------------------------------------------------------

--Schema Custom--

CREATE SCHEMA database;
SET search_path to database,public;

--table for staff information

CREATE TABLE Staff
	(StaffID	INTEGER UNIQUE,
			CHECK (staffID > 0 AND staffID <1000000),
	Name		VARCHAR(40) NOT NULL,
	CONSTRAINT 	staff_pk PRIMARY KEY (StaffID)
	);


--Table for product details

CREATE TABLE Product
	(ProductID	INTEGER NOT NULL UNIQUE,
			CHECK (ProductID > 0 AND ProductID < 1000000),		
	Name		VARCHAR(40) NOT NULL,
	CONSTRAINT 	product_pk PRIMARY KEY (ProductID)
		
);


--table for customer info

CREATE TABLE Customer
	(CustomerID	INTEGER NOT NULL UNIQUE,		
	Name		VARCHAR(40) NOT NULL,
	Email		VARCHAR(40) NOT NULL,
	CONSTRAINT 	customer_pk PRIMARY KEY (CustomerID)
	);


--table for ticket info

CREATE TABLE Ticket
	(TicketID	INTEGER NOT NULL UNIQUE,
			CHECK (ticketID > 0 AND ticketID <1000000),		
	Problem		VARCHAR(1000) NOT NULL,
	Status		VARCHAR(20) NOT NULL
            CHECK (Status = 'open' OR Status = 'closed') DEFAULT 'open', --default to open
	Priority 	INTEGER NOT NULL,
			CHECK (Priority > 0 AND Priority <=3),
	LoggedTime 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CustomerID 	INTEGER NOT NULL,
	ProductID 	INTEGER NOT NULL,
	CONSTRAINT 	ticket_pk PRIMARY KEY (TicketID),
	FOREIGN KEY (CustomerID) REFERENCES Customer ON DELETE RESTRICT,
	FOREIGN KEY (ProductID) REFERENCES Product ON DELETE RESTRICT
	);


--TicketUpdate table

CREATE TABLE TicketUpdate
	(
	TicketUpdateID 	INTEGER NOT NULL UNIQUE,
			CHECK (TicketUpdateID > 0 AND TicketUpdateID <1000000),
	Message 	VARCHAR(1000) NOT NULL,
	UpdateTime 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	TicketID 	INTEGER NOT NULL,
	StaffID 	INTEGER,
	CONSTRAINT 	ticketupdate_pk PRIMARY KEY (TicketUpdateID),
	FOREIGN KEY (TicketID) REFERENCES Ticket ON DELETE CASCADE,
	FOREIGN KEY (StaffID) REFERENCES Staff ON DELETE CASCADE
);


---------------------------------------------------------
-- check the contents should be 9, 18, 25, 28, 16
---------------------------------------------------------
(SELECT 1, 'Staff', COUNT(*) FROM Staff
UNION
SELECT 2, 'Product', COUNT(*) FROM Product
UNION
SELECT 3, 'Customer', COUNT(*) FROM Customer
UNION
SELECT 4, 'Ticket', COUNT(*) FROM Ticket
UNION
SELECT 5, 'TicketUpdate', COUNT(*) FROM TicketUpdate)
ORDER BY 1;


-----------------------------------------------
-- drop all the objects (delete all)
-----------------------------------------------
DROP TABLE Staff CASCADE;
DROP TABLE Product CASCADE;
DROP TABLE Customer CASCADE;
DROP TABLE Ticket CASCADE;
DROP TABLE TicketUpdate CASCADE;
