create database TicketBookingSystem;
use TicketBookingSystem;

create table venue (venueID int primary key, venuneName varchar (20),address varchar (50));

create table Event (eventID int primary key,eventName varchar(20),eventDate date,eventTime time,venueID int , totalSeats int , availableSeats int,ticketPrice decimal (6,0),eventType varchar(20),bookingId int );

create table Customer (CustomerId int primary key, CustomerName varchar(20),email varchar(200),phoneNumber int,BookingId int );

create table Booking (BookingId int primary key, CustomerId int,EventId int,NumTickets int,totalCost decimal(10,2), bookingDate date);


ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Customer FOREIGN KEY (customerId) REFERENCES Customer(customerId);


ALTER TABLE Event
ADD CONSTRAINT FK_Event_Venue FOREIGN KEY (venueId) REFERENCES Venue(venueId);

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Booking FOREIGN KEY (bookingId) REFERENCES Booking(bookingId);

------------------------------------------------------------------------------TASK 2----------------------------------------------------------------------------------------

--------------------1.insert 10 sample records in each table---------------------------------------------------------------------------

INSERT INTO Venue  VALUES
(1, 'Grand Hall', '123 Main St'),
(2, 'City Stadium', '456 Elm St'),
(3, 'Open Air Theater', '789 Oak St'),
(4, 'Concert Arena', '101 Pine St'),
(5, 'Movie Palace', '202 Maple St'),
(6, 'Downtown Amphit', '303 Birch St'),
(7, 'Highland Dome', '404 Cedar St'),
(8, 'Sunrise Pavilion', '505 Spruce St'),
(9, 'Event Plaza', '606 Ash St'),
(10, 'Central Auditorium', '707 Willow St');

INSERT INTO Customer  VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890'),
(2, 'Jane Smith', 'jane.smith@example.com', '1234567891'),
(3, 'Alice Brown', 'alice.brown@example.com', '1234567892'),
(4, 'Bob White', 'bob.white@example.com', '1234567893'),
(5, 'Charlie Black', 'charlie.black@example.com', '1234567894'),
(6, 'Diana Green', 'diana.green@example.com', '1234567895'),
(7, 'Ethan Blue', 'ethan.blue@example.com', '1234567896'),
(8, 'Fiona Red', 'fiona.red@example.com', '1234567897'),
(9, 'George Yellow', 'george.yellow@example.com', '1234567898'),
(10, 'Hannah Purple', 'hannah.purple@example.com', '1234567899');

INSERT INTO Event VALUES
(1, 'Rock Concert', '2025-05-01', '19:00:00', 4, 500, 500, 50.00, 'Concert'),
(2, 'Football Match', '2025-05-02', '18:00:00', 2, 1000, 1000, 30.00, 'Sports'),
(3, 'Jazz Night', '2025-05-03', '20:00:00', 3, 300, 300, 40.00, 'Concert'),
(4, 'Action Movie', '2025-05-04', '17:30:00', 5, 200, 200, 15.00, 'Movie'),
(5, 'Comedy Movie', '2025-05-05', '19:00:00', 5, 250, 250, 12.50, 'Movie'),
(6, 'Basketball Game', '2025-05-06', '20:00:00', 2, 800, 800, 25.00, 'Sports'),
(7, 'Classical Concert', '2025-05-07', '18:00:00', 6, 400, 400, 35.00, 'Concert'),
(8, 'Soccer Game', '2025-05-08', '21:00:00', 8, 1500, 1500, 45.00, 'Sports'),
(9, 'Drama Play', '2025-05-09', '16:00:00', 7, 350, 350, 20.00, 'Movie'),
(10, 'Pop Concert', '2025-05-10', '19:30:00', 1, 600, 600, 55.00, 'Concert');

INSERT INTO Booking (bookingId, customerId, eventId, numTickets, totalCost, bookingDate) VALUES
(1, 1, 1, 2, 100.00, '2025-04-01'),
(2, 2, 2, 4, 120.00, '2025-04-02'),
(3, 3, 3, 3, 120.00, '2025-04-03'),
(4, 4, 4, 1, 15.00, '2025-04-04'),
(5, 5, 5, 5, 62.50, '2025-04-05'),
(6, 6, 6, 2, 50.00, '2025-04-06'),
(7, 7, 7, 6, 210.00, '2025-04-07'),
(8, 8, 8, 7, 315.00, '2025-04-08'),
(9, 9, 9, 3, 60.00, '2025-04-09'),
(10, 10, 10, 4, 220.00, '2025-04-10');

SELECT * FROM Venue;
SELECT * FROM Customer;
SELECT * FROM Event;
SELECT * FROM Booking;

UPDATE Customer
SET bookingId = Booking.bookingId
FROM Customer
INNER JOIN Booking ON Customer.customerId = Booking.customerId;

UPDATE Event
SET bookingId = Booking.bookingId
FROM Event
INNER JOIN Booking ON Event.eventId = Booking.eventId;

------------------------2.List of all events-------------------------------------------------------

select Eventname from event;

-----------------------3.events with available tickets----------------------------------------------

select eventname,availableSeats
from event where availableSeats >0;

----------------------4.events with names partially matching 'mov'---------------------------------

select eventname from event where eventname like '%mov%';

----------------------5.events with ticket price range between 10 to 25--------------------------

select eventname,ticketPrice from event where ticketPrice between 10 and 25;

-----------------------6.events with dates falling within specific range-------------------------

select eventname,eventdate from event where Eventdate between '2025-05-01' and '2025-05-10'; 

----------------------7.events with available tickets and 'concert' in their name--------------------

select eventname,availableseats from event where availableSeats > 0 and eventname like '%concert%';

-----------------------8.users in batches of 5 starting from the 6th user----------------------------
 
 select * from customer order by Customerid offset 5 rows fetch next 5 rows only;

 -----------------------9.booking details where the number of tickets booked is more than 4-------------------

 select * from booking where numTickets >4;

 ---------------------10.customer information whose phone number ends with '000'-----------------------------------

 select * from customer where phoneNumber like '%99%';

 ---------------------11.events ordered by seat capacity greater than 500------------------------------------------------

 select * from event where totalSeats >500 order by totalseats desc;

 ---------------------12.events whose names do not ends with x,y or z;+------------------------------------------------

 select * from event where eventname not like 'x%' and eventname not like 'y%' and eventname not like 'z%';



 ----------------------------------------------------------------------------------------------------TASK 3------------------------------------------------------------------------------------------
 -----------------------------1.Events and their avg ticket prices------------------------------------------------------

 select eventname,avg(ticketprice) as avgTicketPrice from event
 group by eventname;

 ----------------------------2.total revenue generated by events-----------------------------------------------------

 select eventid,eventname,(totalSeats - availableSeats) * ticketprice as totalRevenue
 from event;

 ----------------------------3.event with highest ticket sales-------------------------------------------------------

 select top 1 eventid ,eventname,eventname, (totalSeats - availableSeats) as Ticketsold from event
 order by Ticketsold desc ;

 ------------------------------4.total number of tickets sold for each event---------------------------------------------------
 select* from booking
 select e.eventid ,e.eventname,sum(b.numTickets) as totalSoldTickets from booking b
 join event e on b.eventid =e.eventid 
 group by e.eventid,e.eventname
 order by totalSoldTickets desc;


 




