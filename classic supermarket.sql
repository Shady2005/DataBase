create database "classic_supermarket"

use classic_supermarket;

CREATE TABLE Employee (
Employee_ID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Salary DECIMAL(10, 2),
Role VARCHAR(50),
Phone_NO VARCHAR(20)
);

CREATE TABLE Customer (
Customer_ID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Address VARCHAR(255),
Phone_NO VARCHAR(20),
Employee_ID INT,
FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Project (
Project_ID INT PRIMARY KEY,
Project_name VARCHAR(100),
Start_Date DATE,
Employee_ID INT,
FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Loyalty_program (
Loyalty_ID INT PRIMARY KEY,
Customer_ID INT,
Membership_Level VARCHAR(50),
Point INT,
DIS_Percent DECIMAL(5,2),
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Orders (
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Payment_method VARCHAR(50),
Order_Status VARCHAR(50),
Total_Amount DECIMAL(10,2),
Order_Date DATE,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Details (
Order_detail_ID INT PRIMARY KEY,
Order_ID INT,
Project_ID INT,
Subtotal DECIMAL(10,2),
Quantity INT,
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);

CREATE TABLE Supplier (
Supplier_ID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Contact_Number VARCHAR(20)
);

CREATE TABLE Product (
Product_ID INT PRIMARY KEY,
Name VARCHAR(100),
Price DECIMAL(10,2),
CAT_ID INT,
Stock_Quantity INT,
Order_ID INT,
EX_Date DATE,
FOREIGN KEY (CAT_ID) REFERENCES Category(CAT_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Category (
CAT_ID INT PRIMARY KEY,
Description VARCHAR(255),
Name VARCHAR(100)
);

CREATE TABLE Stock (
Stock_ID INT PRIMARY KEY,
Product_ID INT,
Supplier_ID INT,
Quantity INT,
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

CREATE TABLE Payment (
Payment_ID INT PRIMARY KEY,
Payment_Date DATE,
Amount_Paid DECIMAL(10,2),
Order_ID INT,
Payment_Status VARCHAR(50),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Orders (Order_ID, Customer_ID, Payment_method, Order_Status, Total_Amount, Order_Date)
VALUES
(1, 101, 'Credit Card', 'Completed', 150.75, '2025-04-01'),
(2, 102, 'PayPal', 'Pending',200.50, '2025-04-02'),
(3, 103,'Cash on Delivery', 'Shipped', 99.99, '2025-04-03');


INSERT INTO Customer (Customer_ID, Name, Email, Address, Phone_NO, Employee_ID)
VALUES
(101,      'Ahmed Yasser',  'ahmed.yasser@email.com', '12 Tahrir St, Cairo',  '01001234567', 1),
(102,      'Sara Mohamed',  'sara.mohamed@email.com', '25 October Rd, Giza',  '01007654321', 2),
(103,      'Omar Adel',     'omar.adel@email.com',    '18 Nasr City, Cairo',  '01009876543', 3);



INSERT INTO Employee (Employee_ID, Name, Email, Salary, Role, Phone_NO)
VALUES
(1, 'Mohamed Tarek', 'mohamed.tarek@email.com', 8000.00, 'Sales Representative', '01012345678'),
(2, 'Laila Mostafa', 'laila.mostafa@email.com', 9500.00, 'Customer Service', '01023456789'),
(3, 'Khaled Nabil', 'khaled.nabil@email.com', 12000.00, 'Account Manager', '01034567890');

INSERT INTO Project (Project_ID, Project_name, Start_Date, Employee_ID)
VALUES
(1, 'Loyalty App Development', '2025-01-15', 1),
(2, 'Customer Feedback Analysis', '2025-02-01', 2),
(3, 'Sales Dashboard Upgrade', '2025-03-10', 3);

INSERT INTO Loyalty_program (Loyalty_ID, Customer_ID, Membership_Level, Point, DIS_Percent)
VALUES
(1, 101, 'Gold', 1200, 15.00),
(2, 102, 'Silver', 750, 10.00),
(3, 103, 'Bronze', 300, 5.00);

INSERT INTO Order_Details (Order_detail_ID, Order_ID, Project_ID, Subtotal, Quantity)
VALUES
(1, 1, 1, 150.75, 1),
(2, 2, 2, 200.50, 2),
(3, 3, 3, 99.99, 1);


INSERT INTO Supplier (Supplier_ID, Name, Email, Contact_Number)
VALUES
(1, 'ABC Supplies', 'abc.supplier@email.com', '01012345678'),
(2, 'XYZ Goods', 'xyz.goods@email.com', '01023456789'),
(3, 'Global Traders', 'global.traders@email.com', '01034567890');


INSERT INTO Product (Product_ID, Name, Price, CAT_ID, Stock_Quantity, Order_ID, EX_Date)
VALUES
(1, 'Laptop', 15000.00, 1, 50, 1, '2026-12-31'),
(2, 'Smartphone', 7000.00, 2, 100, 2, '2026-11-30'),
(3, 'Headphones', 800.00, 3, 200, 3, '2026-10-31');


INSERT INTO Category (CAT_ID, Description, Name)
VALUES
(1, 'High-performance laptops for gaming and work', 'Electronics'),
(2, 'Smartphones with latest features', 'Mobile Devices'),
(3, 'Audio equipment including headphones and speakers', 'Audio Accessories');


INSERT INTO Stock (Stock_ID, Product_ID, Supplier_ID, Quantity)
VALUES
(1, 1, 1, 50),
(2, 2, 2, 100),
(3, 3, 3, 200);


INSERT INTO Payment (Payment_ID, Payment_Date, Amount_Paid, Order_ID, Payment_Status)
VALUES
(1, '2025-04-01', 150.75, 1, 'Completed'),
(2, '2025-04-02', 200.50, 2, 'Pending'),
(3, '2025-04-03', 99.99, 3, 'Shipped');

UPDATE category
SET NAME = 'Updated Produce', DESCRIPTION = 'Updated description for fresh fruits and vegetables'
WHERE CAT_ID = 1;

DELETE FROM category
WHERE CAT_ID = 3;

UPDATE Employee
SET Salary = 12000.00
WHERE Employee_ID = 1; 


UPDATE Customer
SET Address = '321 New Street, Cairo', Phone_NO = '01098765432'
WHERE Customer_ID = 1;


UPDATE Project
SET Project_name = 'Updated Project Alpha', Start_Date = '2025-05-01'
WHERE Project_ID = 1;


UPDATE Loyalty_program
SET Membership_Level = 'Gold', Point = 1500, DIS_Percent = 10.00
WHERE Loyalty_ID = 1;


UPDATE Orders
SET Payment_method = 'Debit Card', Order_Status = 'Delivered', Total_Amount = 180.00
WHERE Order_ID = 1;


UPDATE Order_Details
SET Subtotal = 250.00, Quantity = 3
WHERE Order_detail_ID = 1;

UPDATE Supplier
SET Email = 'new.email@supplier.com', Contact_Number = '01065432123'
WHERE Supplier_ID = 1;

UPDATE Product
SET Price = 120.50, Stock_Quantity = 30, EX_Date = '2025-12-31'
WHERE Product_ID = 1;

UPDATE Stock
SET Quantity = 100
WHERE Stock_ID = 1;


UPDATE Payment
SET Amount_Paid = 250.75, Payment_Status = 'Completed'
WHERE Payment_ID = 1;


select *from Employee;

select *from Customer;

select *from Project;

select *from Loyalty_program;

select *from Orders;

select *from Order_Details;

select *from Supplier;

select *from Product;

select *from Category;

select *from Stock;

select *from Payment;