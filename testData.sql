------------------------------------------------
--POPULATING DATABASE--
------------------------------------------------

--populate Staff table
INSERT INTO Staff (StaffID, Name)
    VALUES (100, 'James, Kingsbury');
INSERT INTO Staff (StaffID, Name)
    VALUES (101, 'Micheal, Harrell');
INSERT INTO Staff (StaffID, Name)
    VALUES (102, 'Lemar, Neale');
INSERT INTO Staff (StaffID, Name)
    VALUES (103, 'Nellie, Chester');
INSERT INTO Staff (StaffID, Name)
    VALUES (104, 'Nathan, Hickman');
INSERT INTO Staff (StaffID, Name)
    VALUES (105, 'Luisa, Macgregor');
INSERT INTO Staff (StaffID, Name)
    VALUES (106, 'Pearce, Humphrey');
INSERT INTO Staff (StaffID, Name)
    VALUES (107, 'Nikolas, Keeling');
INSERT INTO Staff (StaffID, Name)
    VALUES (108, 'Erin, Schofield');
COMMIT;

--------------------------
--populate product table
--------------------------
INSERT INTO Product(ProductID, Name)
    VALUES (1, 'StreamOS');
INSERT INTO Product(ProductID, Name)
    VALUES (2, 'Delphi');
INSERT INTO Product(ProductID, Name)
    VALUES (3, 'Soamo');
INSERT INTO Product(ProductID, Name)
    VALUES (4, 'Foodnaut');
INSERT INTO Product(ProductID, Name)
    VALUES (5, 'StreamOSX');
INSERT INTO Product(ProductID, Name)
    VALUES (6, 'Bend');
INSERT INTO Product(ProductID, Name)
    VALUES (7, 'Hybrid');
INSERT INTO Product(ProductID, Name)
    VALUES (8, 'HybridII');
INSERT INTO Product(ProductID, Name)
    VALUES (9, 'Chaos');
INSERT INTO Product(ProductID, Name)
    VALUES (10, 'YIO');
INSERT INTO Product(ProductID, Name)
    VALUES (11, 'PIO');
INSERT INTO Product(ProductID, Name)
    VALUES (12, 'Calculator');
INSERT INTO Product(ProductID, Name)
    VALUES (13, 'Trackr');
INSERT INTO Product(ProductID, Name)
    VALUES (14, 'Bends');
INSERT INTO Product(ProductID, Name)
    VALUES (15, 'Anchor');
INSERT INTO Product(ProductID, Name)
    VALUES (16, 'HiFive');
INSERT INTO Product(ProductID, Name)
    VALUES (17, 'HiSix');
INSERT INTO Product(ProductID, Name)
    VALUES (18, 'HiOne');
COMMIT;

----------------------------
--populate customer table
----------------------------
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (450, 'Stephen, Greaves','sgreaves@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (451, 'Jennifer, Higgs','jenhiggs@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (453, 'Alec, Thornton','alecthornton@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (454, 'Yasmine, Bray','yasmineb@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (455, 'Zidan, Levine','zlevine@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (421, 'Anna-Marie, Field','annemarief1988@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (865, 'Aisling, Reilly','ar@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (506, 'Kristi, Kane','kkane@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (675, 'Destiny, Lucas','destinylucas@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (323, 'Hafsa, John','johnhasfa@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (823, 'Zachar, Hay','zac@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (912, 'Samina, Mcgregor','smcgregor19@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (338, 'Callen, Hewitt','chew@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (499, 'Leigha, Oakley','leigha@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (657, 'Ayan, Dodson','ayandod@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (778, 'Manveer, Marin','mm1893@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (911, 'Lillie, Rees','lillierees@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (772, 'Eleri, Christensen','ecsen@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (123, 'Princess, Jones','prinjon@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (279, 'Kiana, Daugherty','kfdaugherty@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (929, 'Beck, Farrell','beckfarrellsmallone@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (220, 'Sapphire, Estrada','sappie132@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (389, 'Moses, Caldwell','bigmoe@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (480, 'Bernice, Mcculloch','bernie@gmail.com');
INSERT INTO Customer(CustomerID, Name, Email)
    VALUES (410, 'Elli, Contreras','ec130@gmail.com');
COMMIT;

--------------------------
--populate ticket table
--------------------------
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1111, 'Need help i cannot use it','open', '2', '2015-09-14 01:32','453', '5');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1118, 'My update did not install','open', '1', '2015-10-20 04:04','865', '9');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1180, 'Login Failure','open', '2', '2016-01-11 04:36','675', '11');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1200, 'My update is no','open', '2', '2016-01-18 05:24','323', '15');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1201, 'how does this work','open', '2', '2016-01-20 05:54','823', '18');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1203, 'There was a 404 error','open', '2', '2016-01-23 07:12','338', '2');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1207, 'System not starting properly','open', '2', '2016-02-05 08:52','778', '3');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1209, 'Login failure','open', '1', '2016-03-16 10:42','772', '7');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1210, '','open', '3', '2016-03-17 12:56','123', '1');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1230, 'Login Failure','open', '2', '2017-06-12 13:16','279', '11');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1251, 'Login Failure','open', '2', '2017-11-03 14:42','929', '10');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1252, 'Login Failure','open', '2', '2017-11-07 15:06','220', '16');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1256, 'Login Failure','open', '2', '2017-11-08 15:08','389', '14');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1290, 'Not sure just stopped working','open', '3', '2017-12-26 16:52','410', '9');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1291, 'Login failure','closed', '3', '2017-12-26 17:48','450', '8');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1292, '','open', '2', '2017-12-29 18:00','451', '18');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1293, 'System not starting properly','closed', '2', '2017-12-29 19:12','455', '7');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1294, 'System not starting properly','closed', '2', '2017-12-29 19:20', '421', '12');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1295, 'System not starting properly','open', '2', '2017-12-29 20:38','865', '1');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1296, 'Tracking not working','open', '2', '2018-01-01 20:42','823', '13');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1297, 'Not Working Properly','open', '3', '2018-01-02 20:48','912', '2');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (1298, 'I have a problem','open', '3', '2018-01-02 20:52','338', '7');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (2433, 'Login Failure','open', '1', '2018-05-01 21:36','220', '4');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (2434, 'System Error','closed', '1', '2018-05-26 21:38','389', '5');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (2435, 'System Error, can you please help me. It says 404','open', '1', '2018-05-27 22:02','480', '17');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (2560, 'Error 404 appeared','open', '3', '2018-10-17 22:12','410', '16');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (5576, 'I have a problem','open', '2', '2018-10-30 22:56','506', '6');
INSERT INTO Ticket (TicketID, Problem, Status, Priority, Loggedtime, CustomerID, ProductID)
    VALUES (5676, 'Not Loading Properly','open', '1', '2018-11-02 23:08','778', '10');
COMMIT;

---------------------------------
--populate ticketUpdate table
---------------------------------
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (110, 'Problem Unresloved','2015-09-15 13:16', '1111', '101 ');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (160, 'Problem unsolved','2016-02-06 18:23', '1207', '107');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (161, 'Problem unsolved','2016-03-16 20:02', '1209', '105');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (170, 'Problem unsolved','2017-06-13 20:02', '1230', '106');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (180, 'Problem still not solved','2017-12-25 20:02', '1207', '106');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (181, 'Problem solved','2018-12-25 20:02', '1207', '101');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (182, 'Problem unsolved','2017-12-28 21:15', '1291', '106');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (190, 'Problem solved','2017-12-29 21:00', '1291', '101');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (187, 'Problem unsolved','2017-12-29 21:00', '1294', '105');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (188, 'Problem solved','2017-12-29 21:35', '1293', '106');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (191, 'Problem unsolved','2017-12-29 21:00', '1294', '103');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (192, 'Problem solved','2017-12-29 21:00', '1294', '107');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (195, 'Some help issued with reinstall','2017-12-30 21:00', '1295', '101');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (296, 'Problem solved','2018-05-26 21:00', '2434', '102');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (294, 'Problem solved','2018-05-26 21:00', '2434', '102');
INSERT INTO TicketUpdate (TicketUpdateID, Message, UpdateTime, TicketID, StaffID)
    VALUES (302, 'Help issued','2018-10-18 09:35', '2560', '104');
COMMIT;
