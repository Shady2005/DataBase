create database "phones_company"

use phones_company;

create table Employee (
Employee_ID int primary key,
Employee_Name varchar(30)not null,
Employee_Position varchar(30),
Employee_Age int not null,
Device_serial_number int foreign key references Mobile_Device (Device_serial_number) 
);
create table Mobile_Device (
Device_serial_number int primary key,
Device_Model varchar(30) not null,
Device_Price int not null
);
create table Promotion_campaign (
Campaign_ID int primary key,
Campaign_Start_Date varchar(30)not null,
Target_audience varchar(30) not null
);
create table Service_center (
Center_ID int primary key,
Center_Location varchar(40),
Services_offiered varchar(30) not null
);
create table Branch_Supplies (
Supplies_Name varchar(30) primary key,
Supplies_Type varchar(30)
);
create table Branch (
Branch_ID int primary key,
Branch_Name varchar(30) not null,
Employee varchar(20)
);
create table "Order" (
Order_ID int primary key,
Order_data varchar(50) not null,
Order_Total_Amount varchar(40),
Device_serial_number int foreign key references Mobile_Device (Device_serial_number)
);
create table Customer (
Customer_ID int primary key,
Customer_Name varchar(30) not null,
Contact_Details varchar(50) not null,
Billing_address varchar(20)
);
create table Warranty_claim (
Claim_ID int primary key,
Device_serial_number int not null,
Issue_description varchar(50),
Resolution varchar(50),
Customer_ID int foreign key references Customer(Customer_ID)
);
create table MobileDeviceServicecenter (
Center_ID int foreign key references Service_center(Center_ID),
Device_serial_number int foreign key references Mobile_Device (Device_serial_number)
);
create table EmployeePromotion (
Employee_ID int foreign key references Employee(Employee_ID),
Campaign_ID int foreign key references Promotion_campaign (Campaign_ID)
);
create table CustomerOrder (
Customer_ID int foreign key references Customer(Customer_ID),
Order_ID int foreign key references "Order"(Order_ID),
);

insert into Employee ( Employee_ID, Employee_Name, Employee_Position, Employee_Age,Device_serial_number)
		values (123456, 'Ahmed', 'Manager', 20,2292203),
		(678876, 'Ali', 'Engneer', 25, 2292295),
		(121356, ' kalem', 'securty', 30, 2292292),
		(674599, 'Shady', 'senure', 19, 2292294),
		(111111,'Hassan', 'securty', 24, 2292201);
	select * from Employee;


insert into Promotion_campaign (Campaign_ID, Campaign_Start_Date, Target_audience)
		values (1490110, '6/1/2005', '5%'),
		(164352, '9/1/2005', '2%'),
		(889801, '9/1/2016', '4%'),
		(856663, '5/2/2016', '10%'),
		(856732, '3/3/2018', '40%');

insert into Customer (Customer_ID, Customer_Name, Contact_Details, Billing_address)
		values (212356, 'Mohamed', 'zaid', 'Cash'),
		(222476, 'youssef', 'New Cairo', 'Visa'),
		(456765, 'Ahmed', 'Zeito', 'Cash'),
		(987789, 'Yasser', 'Tahrir', 'Cash'),
		(289765, 'Mazen', '6TH Octber', 'Visa');

insert into "Order" (Order_ID, Order_data, Order_Total_Amount,Device_serial_number)
		values (23253, '13/5/2024', '20',2292201),
		(21555, '14/5/2024', '8',2292292),
		(24533, '4/6/2024', '5',2292293),
		(26262, '5/6/2024', '7',2292294),
		(31313, '8/6/2024','6',2292295);

insert into Service_center (Center_ID, Center_Location, Services_offiered)
		values (29267326, 'Zaid', '5%'),
		(29267327, 'New Cairo', '10%'),
		(29267328, ' Ain Shams', '5%'),
		(29267329, 'Zaid', '10%'),
		(29267339, ' October', '20%');

insert into Mobile_Device (Device_serial_number, Device_Model, Device_Price)
		values (2292201, 'mk21', '9000'),
		(2292292, 'mk22', '7500'),
		(2292293, 'mk512', '5000'),
		(2292294, 'mk10', '12000'),
		(2292295, 'mk11', '1300');

INSERT INTO Branch (Branch_ID, Branch_Name, Employee)
VALUES 
(6749, 'Branch Supplies', 'Mazen'), 
(55199, 'hardware Branch', 'Ibrahim Adel'), 
(6644, 'Software Branch', 'Marwan Osama'), 
(7765, 'Software Branch', 'Mohamed');

insert into Warranty_claim (Claim_ID, Device_serial_number, Issue_description, Resolution)
	values (564872, 6765435, 'Pay Some of Amount', 'Pay'),
	(123432, 657392, 'Pay All of Amount', 'pay');

insert into Branch_Supplies (Supplies_Name, Supplies_Type)
		values ('Device', 'Phones , Airpods , Power Bank'),
		('Stuff', 'Casher, Securty, Cleaner '),
		('Accessories', 'Covers, Screanes');







select * From Employee


select * From Mobile_Device


select * From Promotion_campaign


select * From Service_center


select * From Branch_Supplies


select * From Branch



select * From "Order"


select * From  Customer


select * From Warranty_claim


