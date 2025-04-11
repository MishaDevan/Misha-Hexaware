create database Ecommerce
use Ecommerce;
------------Customers table-----------
create table Customers (CustomerID int primary key, FirstName varchar(50),LastName varchar (50),email varchar(20),address varchar(20));
-----------Products table--------------
create table Products (ProductID int primary key, ProductName varchar (30),Price decimal(10,2),Description varchar(300), StockQuantity int );
------------Cart table---------------
create table Cart (CartID int primary key, CustomerID int, ProductID int ,Quantity int ,foreign key(CustomerID) references Customers(CustomerID),foreign key (productID) references Products(ProductID));
------------Orders table-----------------
create table Orders (OrderID int primary key, CustomerID int, OrderDate date,TotalAmount decimal (10,2),foreign key (CustomerID) references CUstomers(CustomerID));
-----------OrderItem table--------------
create table OrderItems (OrderItemID int primary key,OrderID int, ProductID int, Quantity int, ItemAmount int,foreign key (OrderID)references Orders(OrderID),foreign key (ProductID) references Products(ProductID));

-----------Insertion---------------------------------------------------

alter table Customers 
alter column address varchar(200);
----------Customer table-------------------------
insert into Customers values(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane', 'Smith', 'janith@example.com', '456 Elm St, Town'),
(3, 'Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David', 'Lee', 'david@example.com', '234CedarSt, District'),
(6, 'Laura', 'Hall', 'laura@example.com', '567 Birch St, County'),
(7, 'Michael', 'Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma', 'Wilson', 'emma@example.com', '321 RedwoodSt,Country'),
(9, 'William', 'Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory');

select * from Customers

------------Products Table----------------------------

insert into Products (ProductID,ProductName,Description,Price,StockQuantity)values
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', ' Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

select * from Products

------------Cart table-------------------------------

insert into Cart values
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

select * from cart

------------Orders Table------------------------------

alter table Orders 
add ShippingAddress varchar(200);

insert into Orders (orderID, customerID, orderDate, totalAmount, shippingAddress)
values(1, 1, '2023-01-05', 1200.00, '123 Main St, City'),
(2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),
(3, 3, '2023-03-15', 300.00, '789 Oak St, Village'),
(4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
(5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400.00, '567 Birch St, County'),
(7, 7, '2023-07-05', 700.00, '890 Maple St, State'),
(8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'),
(10, 10, '2023-10-20', 1400.00, '765 Fir St, Territory');

select * from Orders


------------OrderItems table------------------------

insert into OrderItems values(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);

select * from OrderItems


-------------------------------------------TASKS-----------------------------------------------------------

----------------1.Update refrigerator's price to 800----------------------------------------------

update products 
set price =800
where ProductName ='refrigerator';

select * from products

---------------2.Remove all cart items for a specific customer-----------------------------------

delete from cart
where CustomerID = 5;

---------------3.Products priced below $100---------------------------------------------------

select * from Products
where price <100;

---------------4.Products with Stock Quantity greater than 5-----------------------------------

select ProductName,StockQuantity from Products
where StockQuantity >5;

--------------5.Orders with total amount between $500 and $1000-----------------------------------

select * from orders 
where TotalAmount between 500 and 1000;

-------------6.Products which name ends with letter 'r'-------------------------------------------

select ProductName from products
where Productname like '%r';

--------------7.Cart Items for customer 6---------------------------------------------------------

select * from cart 
where CustomerID =6;

------------8.Customers who placed order in 2023---------------------------------------------------

select Firstname+' '+LastName as CustomerNAme,OrderID,OrderDate from customers c
join orders o on c.CustomerID = o.CustomerID
where year(OrderDate) =2023;

------------9.Minimum Stock Quantity for each product-----------------------------------------------

select min(stockquantity) as Minstock,ProductName from Products
group by productname;

-----------10.Total amount spent by each customer-----------------------------------------------------

select c.customerID,c.firstname +' '+c.lastname as CustomerName ,sum(o.TotalAmount) as TotalAmountperCustomer from Customers c
join orders o on c.CustomerID =o.CustomerID 
group by c.CustomerID ,c.FirstName+' '+c.LastName 
order by c.CustomerID asc;

------------11.Average Order amount for each customer-------------------------------------=---------------

select c.customerid,c.firstname+' '+c.lastname as CustomerName,avg(o.totalAmount) as AvgAmount from Customers c
join orders o on c.CustomerID =o.CustomerID
group by c.CustomerID,c.firstname+' '+c.lastname;

------------12.Count of number of orders placed by each customer----------------------------------------------

select c.customerID,c.firstname+' '+c.lastname as CustomerName,count(o.orderid) as OrderCount from Customers c
join orders o on c.CustomerID = o.CustomerID
group by c.CustomerID,c.firstname,c.lastname;

-----------13.maximum order amount for each customer------------------------------------------------------------

select customerID,c.firstname+' '+c.lastname as CustomerName,
(select max(o.totalAmount) from orders o
where o.CustomerID = c.customerID) as MaxOrderAmount from customers c
order by CustomerID;

----------14.customers who placed orders totalling over $1000-------------------------------------------------------

select c.customerID,c.firstname ,sum(o.totalAMount) as TotalSpent
from customers c
join orders o on c.CustomerID = o.CustomerID
group by c.CustomerID,c.FirstName
having sum(o.totalAMount)>1000;

------------15.products not in the cart(subquery)-----------------------------------------------------------------------------------

select * from products p where not exists (select * from cart c where p.ProductID =c.ProductID);

------------16.Customers who haven't placed order(subquery)-------------------------------------------------------------------------

select * from Customers c where not exists(select * from orders o where c.CustomerID=o.CustomerID);

-----------17.percentage of total revenue for a product(subquery)---------------------------------------------------------

select productid,productname ,
(select sum(oi.ItemAmount) from OrderItems oi 
where oi.ProductID =p.productID)*100/
(select sum(ItemAmount) from OrderItems ) as revenuePercentage 
from products p;

-------------18.products with low stock(subquery)-------------------------------------------------------------------------------------------------

select * from products p 
where StockQuantity <(select avg(StockQuantity) from Products);

-------------19.Customers who placed  high value orders-----------------------------------------------------------------------

select c.customerid,c.firstname from customers c
join orders o on c.CustomerID = o.CustomerID
where o.TotalAmount>1000;


