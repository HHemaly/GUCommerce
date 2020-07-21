-- I- TABLES
create table Users(
username varchar(20) primary key,
password varchar(20),
first_name varchar(20),
last_name varchar(20),
email varchar(50)
);

create table User_mobile_numbers(
mobile_number varchar(20),
username varchar(20) references Users on delete cascade on update no action,
primary key(mobile_number,username)
);

create table User_Addresses(
address varchar(100),
username varchar(20) references Users on delete cascade on update no action,
primary key(address,username)
);


create table Customer(
username varchar(20),
points int default 0,
primary key(username),
constraint fk_C_username foreign key(username) references Users on delete no action on update no action
);


create table Admins(
username varchar(20) primary key,
constraint fk_username foreign key(username) references Users on delete no action on update no action
);


create table Vendor(
username varchar(20) primary key,
activated bit default '0',
company_name varchar(20),
bank_acc_no varchar(20),
admin_username varchar(20),
constraint fk_V_username foreign key(username) references Users on delete no action on update no action,
constraint fk_admin foreign key(admin_username) references Admins on delete no action on update no action --should be handled in procedure
);


create table Delivery_Person(
username varchar(20) primary key,
is_activated bit default '0',
constraint fk_DP_username foreign key(username) references Users on delete no action on update no action
);


create table Delivery(
id int primary key identity,
type varchar(20), 
time_duration int,
fees decimal(5,3),
username varchar(20),
constraint fk_D_username foreign key(username) references Admins on delete set null on update no action
);


create table Credit_Card(
number varchar(20) primary key,
expiry_date date,
cvv_code varchar(4)
);



create table Orders(
order_no int primary key identity,
order_date date DEFAULT CURRENT_TIMESTAMP,
total_amount decimal(10,2),
cash_amount decimal(10,2),
credit_amount decimal(10,2),
payment_type varchar(10),
order_status varchar(20) DEFAULT 'NOT PROCESSED',
remaining_days int,
time_limit date,
customer_name varchar(20),
delivery_id int,
creditCard_number varchar(20),
Gift_Card_code_used varchar(10),
constraint fk_O_delivery_id foreign key(delivery_id) references Delivery on delete no action on update no action, --update should be handled in procedure
constraint fk_O_customer_name foreign key(customer_name) references Customer on delete no action on update no action, --update shoould be handled in procedure
constraint fk_O_creditCard foreign key(creditCard_number) references Credit_card on delete no action on update no action,
constraint fk_O_gccode foreign key(Gift_Card_code_used) references Giftcard on delete set null on update no action,
);


create table Product(
serial_no int primary key identity,
product_name varchar(20),
category varchar(20),
product_description text,
price decimal(10,2),
final_price decimal(10,2),
color varchar(20),
available bit default '1',
rate int,
vendor_username varchar(20),
customer_username varchar(20),
customer_order_id int,
constraint fk_P_vusername foreign key(vendor_username) references Vendor on delete no action on update no action,
constraint fk_P_cusername foreign key(customer_username) references Customer on delete set null on update no action, --which relationship requires this foreign key constraint? --update should be handled in procedure
constraint fk_P_orderid foreign key(customer_order_id) references Orders on delete set null on update no action--update should be handled in procedure
);


create table CustomerAddsToCartProduct(
serial_no int,
customer_name varchar(20),
primary key(serial_no,customer_name),
constraint fk_CATCP_serial foreign key(serial_no) references Product on delete no action on update no action, --update should be handled in procedure
constraint fk_CATCP_cusername foreign key(customer_name) references Customer on delete no action on update no action
);


create table Todays_Deals(
deal_id int primary key identity,
deal_amount int,
expiry_date datetime,
admin_username varchar(20)
constraint fk_TD_ausername foreign key(admin_username) references Admins on delete set null on update no action
);

create table Todays_Deals_Product(
deal_id int,
serial_no int,
primary key(deal_id,serial_no),
constraint fk_TDP_dealid foreign key(deal_id) references Todays_Deals on delete no action on update no action,
constraint fk_TDP_serial foreign key(serial_no) references Product on delete no action on update no action --update should be handled in procedure
);


create table offer(
offer_id int primary key identity,
offer_amount int,
expiry_date datetime
);

create table offersOnProduct(
offer_id int,
serial_no int,
primary key(offer_id,serial_no),
constraint fk_OOP_offerid foreign key(offer_id) references offer on delete no action on update no action,
constraint fk_OOP_serial foreign key(serial_no) references Product on delete no action on update no action --update should be handled in procedure
);


create table Customer_Question_Product(
serial_no int,
customer_name varchar(20),
question varchar(50),
answer text,
primary key(serial_no,customer_name),
constraint fk_CQP_serial foreign key(serial_no) references Product on delete no action on update no action, --update should be handled in procedure
constraint fk_CQP_cusername foreign key(customer_name) references Customer on delete no action on update no action,
);


create table Wishlist(
username varchar(20),
name varchar(20),
primary key(username,name),
constraint fk_W_username foreign key(username) references Customer on delete no action on update no action 
);


create table Giftcard(
code varchar(10) primary key,
expiry_date datetime,
amount int,
username varchar(20),
constraint fk_GC_ausername foreign key(username) references Admins on delete no action on update no action 
);


create table Wishlist_Product(
username varchar(20),
wish_name varchar(20),
serial_no int,
primary key(username,wish_name,serial_no),
constraint fk_WP_cuserwish foreign key(username,wish_name) references Wishlist on delete no action on update no action,
constraint fk_WP_serial foreign key(serial_no) references Product on delete no action on update no action --update should be handled in procedure
);


create table Admin_Customer_Giftcard(
code varchar(10),
customer_name varchar(20),
admin_username varchar(20),
remaining_points int,
primary key(code,customer_name,admin_username),
constraint fk_ACG_code foreign key(code) references GiftCard on delete cascade on update no action,
constraint fk_ACG_cusername foreign key(customer_name) references Customer on delete no action on update no action, --update should be handled in procedure
constraint fk_ACG_ausername foreign key(admin_username) references Admins on delete no action on update no action --update should be handled in procedure
);

create table Admin_Delivery_Order(
delivery_username varchar(20),
order_no int,
admin_username varchar(20),
delivery_window varchar(50),
primary key(delivery_username,order_no),
constraint fk_dusername foreign key(delivery_username) references Delivery_Person on delete cascade on update no action,
constraint fk_orderno foreign key(order_no) references Orders on delete no action on update no action, --update should be handled in procedure
constraint fk_ausername foreign key(admin_username) references Admins on delete no action on update no action --should be kept as it is written here according to project description
);

create table Customer_Creditcard(
customer_name varchar(20),
cc_number varchar(20),
primary key(customer_name,cc_number),
constraint fk_CC_cusername foreign key(customer_name) references Customer on delete no action on update no action,
constraint fk_CC_creditcard foreign key(cc_number) references Credit_Card on delete no action on update no action --update should be handled in procedure
);

-- II- TRIGGERS TO HANDLE CASCADING DELETE ON FOREIGN KEYS
go 
create trigger User_delete_self
on Users
instead of delete 
as
begin 
delete from Vendor where username in (select username from deleted)
delete from Admins where username in (select username from deleted)
delete from Customer where username in (select username from deleted)
delete from Delivery_Person where username in (select username from deleted)
delete from Users where username in (select username from deleted)
end

go
create trigger Admins_delete_self
on Admins
instead of delete
as 
begin
delete from Vendor where admin_username in (select username from deleted)
delete from Giftcard where username in (select username from deleted)
delete from Admin_Customer_Giftcard where admin_username in (select username from deleted)
delete from Admin_Delivery_Order where admin_username in (select username from deleted)
delete from Admins where username in (select username from deleted)
end

go
create trigger Wishlist_delete_self
on Wishlist
instead of delete
as 
begin
delete from Wishlist_Product where wish_name in (select name from deleted)
delete from Wishlist where name in (select name from deleted)
end

go
create trigger offer_delete_self
on offer
for delete
as
begin
delete from offersOnProduct where offer_id in (select offer_id from deleted)
end

go
create trigger Todays_Deals_delete_self
on Todays_Deals
for delete
as
begin
delete from Todays_Deals_Product where deal_id in (select deal_id from deleted)
end

go
create trigger Product_delete_self
on Product 
instead of delete
as 
begin
delete from CustomerAddsToCartProduct where serial_no in (select serial_no from deleted)
delete from Todays_Deals_Product where serial_no in (select serial_no from deleted)
delete from offersOnProduct where serial_no in (select serial_no from deleted)
delete from Customer_Question_Product where serial_no in (select serial_no from deleted)
delete from Wishlist_Product where serial_no in (select serial_no from deleted)
delete from Product where serial_no in (select serial_no from deleted)
end

go
create trigger Vendor_delete_self
on Vendor
for delete
as 
begin
delete from Product where vendor_username in (select username from deleted)
end

go
create trigger creditcard_delete_self
on Credit_Card
for delete
as 
begin
delete from Orders where creditCard_number in (select number from deleted)
delete from Customer_Creditcard where cc_number in (select number from deleted)
end

go
create trigger Customer_delete_self
on Customer
for delete 
as
begin
delete from Orders where customer_name in (select username from deleted)
delete from CustomerAddsToCartProduct where customer_name in (select username from deleted)
delete from Customer_Question_Product where customer_name in (select username from deleted)
delete from Wishlist where username in (select username from deleted)
delete from Admin_Customer_Giftcard where customer_name in (select username from deleted)
delete from Customer_Creditcard where customer_name in (select username from deleted)
end

go
create trigger Delivery_delete_self
on Delivery
instead of delete
as 
begin
delete from Orders where delivery_id in (select id from deleted)
delete from Delivery where id in (select id from deleted)
end

go
create trigger Orders_delete_self
on Orders
instead of delete 
as
begin
update Product set customer_username = null where customer_order_id in (select order_no from deleted)
delete from Orders where order_no in (select order_no from deleted)
end

-- III- PROCEDURES
-- A. USERS
-- 1.UNREGISTERED USERS
-- a)
--a)1.
go
CREATE PROC customerRegister 
@username VARCHAR(20), 
@first_name VARCHAR(20), 
@last_name VARCHAR(20),
@user_password VARCHAR(20), 
@email VARCHAR(50) ,
@success bit output
AS 
IF (@username IS NULL or @user_password IS NULL or @first_name IS NULL or @last_name IS NULL or @email IS NULL )
begin
set @success='0'
print 'One of the inputs is null'
end
else
if  exists(select username
from Users
where username=@username)
set @success='0'
Else
begin
INSERT INTO Users(username,  first_name, last_name,password, email) 
VALUES(@username,@first_name,@last_name, @user_password,@email)
INSERT INTO Customer(username) Values(@username)
set @success='1'
end
--exec customerRegister @username = 'ahmed.ashraf',@first_name='ahmed',@last_name='ashraf',@user_password = 'pass123', @email = 'ahmed@yahoo.com'
--exec customerRegister @username = 'aly.ashraf',@first_name='aly',@last_name='ashraf',@user_password = 'pass12', @email = 'aly@yahoo.com'
--select * from Users
--select * from Customer
--drop proc customerRegister 

--a)2.
go
CREATE PROC vendorRegister 
@username VARCHAR(20),  
@first_name VARCHAR(20), 
@last_name VARCHAR(20),
@user_password VARCHAR(20),
@email VARCHAR(50),
@company_name varchar(20), 
@bank_acc_no varchar(20),
@success bit output
As
IF (@username IS NULL or @user_password IS NULL or @first_name IS NULL or @last_name IS NULL or @email IS NULL or @company_name IS NULL or @bank_acc_no IS NULL)
begin
print 'One of the inputs is null'
set @success='0'
end
else
if  exists(select username
from Users
where username=@username)
begin
set @success='0'
end
Else 
begin 
INSERT INTO Users(username, password, first_name, last_name, email) 
VALUES(@username, @user_password,@first_name,@last_name,@email)
INSERT INTO Vendor(username,activated,company_name,bank_acc_no) Values(@username,0,@company_name,@bank_acc_no)
set @success='1'
end

drop proc vendorRegister
--exec vendorRegister 'eslam.mahmod','eslam','mahmod','pass1234','hopa@gmail.com','Market','132132513'
--select * from Users
--select * from Vendor

-- 2.REGISTERED USERS
-- a)
go
CREATE PROC userLogin
@username varchar(20),
@user_password varchar(20),
@success bit OUTPUT,
@type int OUTPUT
As
IF Exists(select username,password
FROM Users
where username=@username AND password=@user_password)
set @success=1
else
set @success=0
IF (@success=0)
set @type=-1
ELSE IF Exists(select username
FROM Customer
where username=@username)
set @type=0
else if Exists(select username
FROM Vendor
where username=@username)
set @type=1
else if Exists(select username
FROM Admins
where username=@username)
set @type=2
else
set @type=3
--declare @s bit, @t int;
--exec userLogin 'ahmed.ashraf','pass',@s output,@t output
--print @s
--print @t

--b)
go
CREATE PROC addMobile 
@username VARCHAR(20), 
@mobile_number varchar(20)
As
IF @username IS NULL or @mobile_number IS NULL 
print 'One of the inputs is null'
Else INSERT INTO User_mobile_numbers(username, mobile_number) 
VALUES(@username, @mobile_number)
--exec addMobile 'ahmed.ashraf','0124262652'

--c)
go
CREATE PROC addAddress 
@username VARCHAR(20), 
@address varchar(100)
As
IF @username IS NULL or @address  IS NULL 
print 'One of the inputs is null'
Else INSERT INTO User_Addresses(username, address) 
VALUES(@username, @address)
--exec addAddress 'ahmed.ashraf','Nasr City'


-- B.Customers
--a)
go
CREATE PROC showProducts
As
SELECT product_name,product_description,price,final_price,color
FROM product
WHERE available = 1
--exec showProducts

--b)
go
CREATE PROC ShowProductsbyPrice
As
SELECT  product_name,product_description,final_price,color
FROM product
WHERE available = 1
ORDER BY final_price
--exec ShowProductsbyPrice

--c)
go
CREATE PROC searchbyname
@text varchar(20)
As
SELECT product_name,product_description,price,final_price,color
FROM product
where available = 1 and product_name like '%'+@text+'%'
--exec searchbyname 'blue'

--d)
go
CREATE PROC AddQuestion  
@serial int, 
@customer varchar(20), 
@Question varchar(50) 
AS 
IF @serial IS NULL or @customer IS NULL or @Question IS NULL 
print 'One of the inputs is null'
Else INSERT INTO Customer_Question_Product(serial_no,customer_name,question) 
VALUES(@serial, @customer,@Question)
--exec AddQuestion 2,'ahmed.ashraf','size?'


--e)
--e)1.
go
CREATE PROC  addToCart   
@customername varchar(20), 
@serial int
AS 
IF @serial IS NULL or @customername IS NULL
print 'One of the inputs is null'
Else INSERT INTO CustomerAddstoCartProduct(serial_no,customer_name) 
VALUES(@serial, @customername) 
--exec addToCart 'ahmed.ashraf',1
--exec addToCart 'aly.ashraf',1

--e)2.
go
CREATE PROC removefromCart   
@customername varchar(20), 
@serial int
AS 
DELETE FROM CustomerAddstoCartProduct
WHERE customer_name=@customername AND serial_no=@serial
--exec removefromCart 'ahmed.ashraf',2


--f)
go
CREATE PROC createWishlist  
@customername varchar(20), 
@name varchar(20)
AS
IF @customername IS NULL or @name IS NULL 
print 'One of the inputs is null'
Else INSERT INTO Wishlist(username,name)
VALUES(@customername,@name)
--exec createWishlist 'ahmed.ashraf','fashion'

--g)
--g)1.
go
CREATE PROC AddtoWishlist
@customername VARCHAR(20),
@wishlistname VARCHAR(20),
@serial int
as
IF @customername IS NULL or @wishlistname IS NULL or @serial  IS NULL 
print 'One of the inputs is null'
Else INSERT INTO Wishlist_Product(username, wish_name,serial_no)
VALUES (@customername,@wishlistname,@serial)
--exec AddtoWishlist 'ahmed.ashraf','fashion',2

--g)2.
go
CREATE PROC removefromWishlist
@customername VARCHAR(20),
@wishlistname VARCHAR(20),
@serial int
as
DELETE FROM Wishlist_Product
WHERE username=@customername AND wish_name=@wishlistname AND serial_no=@serial
--exec removefromWishlist 'ahmed.ashraf','fashion',1

--h)
go
CREATE PROC showWishlistProduct
@customername varchar(20), 
@name varchar(20)
as
select p.product_name, p.product_description, p.price, p.final_price,p.color
from Product p 
inner join Wishlist_Product w on p.serial_no = w.serial_no
where w.username = @customername and w.wish_name = @name
--exec showWishlistProduct 'ahmed.ashraf','fashion'

--i)
go 
CREATE PROC viewMyCart 
@customer varchar(20) 
as
select p.product_name , p.product_description, p.price, p.final_price, p.color
from Product p 
inner join CustomerAddstoCartProduct cp on cp.serial_no=p.serial_no
WHERE cp.customer_name = @customer
--exec viewMyCart 'ahmed.ashraf'
--j)
--j)1.
GO
CREATE PROCEDURE calculatepriceOrder
@customername varchar(20),
@sum decimal(10,2) OUTPUT
AS
SELECT @sum = SUM (final_price) 
FROM Product P INNER JOIN CustomerAddstoCartProduct C
ON P.serial_no = C.serial_no
WHERE C.customer_name = @customername
--declare @value decimal(10,2) 
--exec calculatepriceOrder 'ahmed.ashraf',@value output
--print @value

--j)2.
GO
CREATE PROCEDURE productsinorder
@customername varchar(20),
@orderID int
AS
UPDATE Product
SET customer_order_id = @orderID
WHERE serial_no IN(SELECT serial_no FROM CustomerAddstoCartProduct WHERE customer_name = @customername)

DELETE FROM CustomerAddstoCartProduct
WHERE serial_no IN(SELECT C.serial_no FROM CustomerAddstoCartProduct C 
                    INNER JOIN Product P
					ON C.serial_no = P.serial_no
					WHERE P.customer_order_id = @orderID) AND customer_name <> @customername

--j)3.
GO
CREATE PROCEDURE emptyCart
@customername varchar(20)
AS
DELETE FROM CustomerAddstoCartProduct
WHERE customer_name = @customername

--j)4.
GO
CREATE PROCEDURE makeOrder
@customername varchar(20)
AS
DECLARE @amount DECIMAL(10,2)
EXEC calculatepriceOrder @customername,@amount OUTPUT
INSERT INTO Orders(order_date,total_amount,customer_name,order_status)
VALUES (current_timestamp,@amount,@customername,'not processed')
DECLARE @ID int
SELECT @ID = MAX(order_no) 
FROM Orders
WHERE customer_name= @customername
EXEC productsinorder @customername,@id
EXEC emptyCart @customername
UPDATE Product
SET available = '0'
WHERE customer_order_id = @id
UPDATE Product
SET customer_username = @customername
WHERE customer_order_id = @id
--exec makeOrder 'ahmed.ashraf'
--select * from Orders
--select * from Product


--k)
GO
CREATE PROCEDURE cancelOrder
@orderid int
AS
DECLARE @s VARCHAR(20)
SELECT @s=order_status FROM Orders
WHERE order_no = @orderid
DECLARE @p VARCHAR(20)
SELECT @p=payment_type FROM Orders
WHERE order_no = @orderid
DECLARE @t DECIMAL(10,2)
SELECT @t=total_amount FROM Orders
WHERE order_no = @orderid
DECLARE @c DECIMAL(10,2)
DECLARE @customer VARCHAR(20)
IF(@s = 'NOT PROCESSED' OR @s = 'IN PROCESS')
BEGIN
	IF(@p = 'cash')
	BEGIN
		SELECT @c=cash_amount FROM Orders
		WHERE order_no = @orderid
		IF(@c<@t)
		BEGIN
			SELECT @customer= customer_name FROM Orders WHERE order_no = @orderid
			IF ((SELECT expiry_date FROM Admin_Customer_Giftcard CG INNER JOIN Giftcard G ON G.code = CG.code WHERE customer_name = @customer) >= CURRENT_TIMESTAMP)
			BEGIN 
				UPDATE Admin_Customer_Giftcard
				SET remaining_points = remaining_points + (@t-@c)
				WHERE customer_name = @customer
				UPDATE Customer
				SET points = points + (@t-@c)
				WHERE username = @customer
			END
		END
	END
	ELSE IF(@p = 'credit')
	BEGIN
		SELECT @c=credit_amount FROM Orders
		WHERE order_no = @orderid
		IF(@c<@t)
		BEGIN
			SELECT @customer= customer_name FROM Orders WHERE order_no = @orderid
			IF ((SELECT expiry_date FROM Admin_Customer_Giftcard CG INNER JOIN Giftcard G ON G.code = CG.code WHERE customer_name = @customer) >= CURRENT_TIMESTAMP)
			BEGIN 
				UPDATE Admin_Customer_Giftcard
				SET remaining_points = remaining_points + (@t-@c)
				WHERE customer_name = @customer
				UPDATE Customer
				SET points = points + (@t-@c)
				WHERE username = @customer
			END
		END
	END
END
DELETE FROM Admin_Delivery_Order
WHERE order_no = @orderid
UPDATE Product
SET available = '1'
WHERE customer_order_id = @orderid
UPDATE Product
SET customer_username = null 
WHERE customer_order_id = @orderid
UPDATE Product
SET customer_order_id = null 
WHERE customer_order_id = @orderid
DELETE FROM Orders
WHERE order_no = @orderid
--select * from Orders
--select * from Product
--select * from Customer
--select * from Admin_Customer_Giftcard


--l)
Go
CREATE PROC returnProduct
@serialno int,
@orderid int
AS
DECLARE @tot DECIMAL(10,2)
DECLARE @pricerev DECIMAL(10,2)
DECLARE @cus VARCHAR(20)
SELECT @cus = customer_name FROM Orders WHERE order_no = @orderid
SELECT @tot = total_amount FROM Orders WHERE order_no = @orderid
SELECT @pricerev = final_price FROM Product WHERE serial_no = @serialno
IF((SELECT order_status FROM Orders WHERE order_no = @orderid)='DELIVERED')
BEGIN
	IF((SELECT payment_type FROM Orders) = 'credit')
	BEGIN
		IF((SELECT total_amount FROM Orders WHERE order_no = @orderid) > (SELECT credit_amount FROM Orders WHERE order_no = @orderid)) --if there is points used
		BEGIN
			IF((SELECT expiry_date FROM Giftcard WHERE code = (SELECT Gift_Card_code_used FROM Orders WHERE order_no = @orderid))>= CURRENT_TIMESTAMP) -- if the points are not expired -- !!!!!
			BEGIN
			    IF((SELECT COUNT(*) FROM Product WHERE customer_order_id  = @orderid) = 1)
				BEGIN
					UPDATE Customer
					SET points = points + ((@tot - (SELECT credit_amount FROM Orders WHERE order_no = @orderid))) 
					WHERE username = @cus
					UPDATE Admin_Customer_Giftcard
					SET remaining_points = remaining_points + ((@tot - (SELECT credit_amount FROM Orders WHERE order_no = @orderid))) 
					WHERE customer_name = @cus
				END
				ELSE IF((SELECT COUNT(*) FROM Product WHERE customer_order_id  = @orderid) > 1)
				BEGIN 
					IF(@pricerev >= (@tot - (SELECT credit_amount FROM Orders WHERE order_no = @orderid)))
					BEGIN
						UPDATE Customer
						SET points = points + ((@tot - (SELECT credit_amount FROM Orders WHERE order_no = @orderid))) 
						WHERE username = @cus
						UPDATE Admin_Customer_Giftcard
						SET remaining_points = remaining_points + ((@tot - (SELECT credit_amount FROM Orders WHERE order_no = @orderid))) 
						WHERE customer_name = @cus
						UPDATE Orders
						SET Gift_Card_code_used = null
						WHERE order_no = @orderid
					END
					ELSE
					BEGIN
						UPDATE Customer
						SET points = points + @pricerev
						WHERE username = @cus
						UPDATE Admin_Customer_Giftcard
						SET remaining_points = remaining_points + @pricerev
						WHERE customer_name = @cus
					END
				END
			END
		END
	END
	ELSE IF((SELECT payment_type FROM Orders) = 'cash')
	BEGIN
		IF((SELECT total_amount FROM Orders WHERE order_no = @orderid) > (SELECT cash_amount FROM Orders WHERE order_no = @orderid)) --if there is points used
		BEGIN
			IF((SELECT expiry_date FROM Giftcard WHERE code = (SELECT Gift_Card_code_used FROM Orders WHERE order_no = @orderid))>= CURRENT_TIMESTAMP) -- if the points are not expired -- !!!!!
			BEGIN
			    IF((SELECT COUNT(*) FROM Product WHERE customer_order_id  = @orderid) = 1)
				BEGIN
					UPDATE Customer
					SET points = points + ((@tot - (SELECT cash_amount FROM Orders WHERE order_no = @orderid))) 
					WHERE username = @cus
					UPDATE Admin_Customer_Giftcard
					SET remaining_points = remaining_points + ((@tot - (SELECT cash_amount FROM Orders WHERE order_no = @orderid))) 
					WHERE customer_name = @cus
				END
				ELSE IF((SELECT COUNT(*) FROM Product WHERE customer_order_id  = @orderid) > 1)
				BEGIN 
					IF(@pricerev >= (@tot - (SELECT cash_amount FROM Orders WHERE order_no = @orderid)))
					BEGIN
						UPDATE Customer
						SET points = points + ((@tot - (SELECT cash_amount FROM Orders WHERE order_no = @orderid))) 
						WHERE username = @cus
						UPDATE Admin_Customer_Giftcard
						SET remaining_points = remaining_points + ((@tot - (SELECT cash_amount FROM Orders WHERE order_no = @orderid))) 
						WHERE customer_name = @cus
						UPDATE Orders
						SET Gift_Card_code_used = null
						WHERE order_no = @orderid
					END
					ELSE
					BEGIN
						UPDATE Customer
						SET points = points + @pricerev
						WHERE username = @cus
						UPDATE Admin_Customer_Giftcard
						SET remaining_points = remaining_points + @pricerev
						WHERE customer_name = @cus
					END
				END
			END
		END
	END
	UPDATE Orders
	SET total_amount = total_amount - @pricerev
	WHERE order_no = @orderid
	UPDATE Product
	SET available = '1'
	WHERE serial_no = @serialno
	UPDATE Product
	SET customer_order_id = null 
	WHERE serial_no = @serialno
	UPDATE Product
	SET customer_username = null 
	WHERE serial_no = @serialno
END
--exec returnProduct 1,1
--select * from Orders
--select * from Product
--select * from Customer
--select * from Admin_Customer_Giftcard

--m)
GO
CREATE PROCEDURE ShowproductsIbought
@customername varchar(20)
AS
SELECT * FROM Product
WHERE customer_order_id = (SELECT order_no FROM Orders WHERE customer_name = @customername)
--exec ShowproductsIbought 'ahmed.ashraf'


--n)
GO
CREATE PROCEDURE rate
@serialno int,
@rate int ,
@customername varchar(20)
AS
DECLARE @status VARCHAR(20)
SELECT @status =order_status FROM Orders WHERE order_no = (SELECT customer_order_id FROM Product WHERE serial_no = @serialno)
DECLARE @ORDERID INT
DECLARE @ORDERNO INT 
SELECT @ORDERID = customer_order_id FROM Product WHERE serial_no  = @serialno
SELECT @ORDERNO=order_no FROM Orders WHERE customer_name = @customername  AND order_status = 'DELIVERED'
IF(@ORDERID = @ORDERNO)
begin 
UPDATE Product
SET rate = @rate
WHERE serial_no = @serialno
end
--exec rate 1,4,'ahmed.ashraf' 
--select * from Product
--select * from Orders
--select * from Customer
--select * from Admin_Customer_Giftcard

--o)
GO
CREATE PROCEDURE SpecifyAmount
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2)
AS
DECLARE @amount decimal(10,2)
SELECT @amount = total_amount
FROM Orders
WHERE order_no = @orderID
DECLARE @p INT
SELECT @p = points FROM Customer
where username = @customername
IF(@cash>0.0) --paying using cash
BEGIN 
	UPDATE Orders
	SET payment_type = 'cash'
	WHERE order_no = @orderID
	IF(@cash<@amount)  --putting the points
		BEGIN 
		IF(@p<@amount-@cash)
			PRINT 'INVALID CASH'
		ELSE
			BEGIN
				UPDATE Customer
				SET points = points - (@amount-@cash)
				WHERE username = @customername
				UPDATE Admin_Customer_Giftcard
				SET remaining_points = remaining_points - (@amount-@cash)
				WHERE customer_name = @customername
				UPDATE Orders
				SET Gift_Card_code_used = (SELECT code FROM Admin_Customer_Giftcard WHERE customer_name = @customername)
				WHERE order_no = @orderID
				UPDATE Orders
				SET cash_amount = @cash
				WHERE order_no = @orderID
			END
	    END
	ELSE IF(@cash>@amount)
		PRINT 'INVALID'
	ELSE
		UPDATE Orders
		SET cash_amount = @cash
		WHERE order_no = @orderID
	UPDATE Orders
	SET credit_amount = null
	WHERE order_no = @orderID
END
IF(@credit>0.0) --paying using credit
BEGIN 
	UPDATE Orders
	SET payment_type = 'credit'
	WHERE order_no = @orderID
	IF(@credit<@amount)  --putting the points
		BEGIN 
		IF(@p<@amount-@credit)
			PRINT 'INVALID CREDIT'
		ELSE
			BEGIN
				UPDATE Customer
				SET points = points - (@amount-@credit)
				WHERE username = @customername
				UPDATE Admin_Customer_Giftcard
				SET remaining_points = remaining_points - (@amount-@credit)
				WHERE customer_name = @customername
				UPDATE Orders
				SET Gift_Card_code_used = (SELECT code FROM Admin_Customer_Giftcard WHERE customer_name = @customername)
				WHERE order_no = @orderID
				UPDATE Orders
				SET credit_amount = @credit
				WHERE order_no = @orderID
			END
	    END
	ELSE IF(@credit>@amount)
		PRINT 'INVALID'
	ELSE 
		UPDATE Orders
		SET credit_amount = @credit
		WHERE order_no = @orderID
	UPDATE Orders
	SET cash_amount = null
	WHERE order_no = @orderID
END
--exec SpecifyAmount 'ahmed.ashraf',3,5,null
--select * from Orders
--select * from Customer
--select * from Admin_Customer_Giftcard

--p)
GO
CREATE PROC AddCreditCard
@creditcardnumber VARCHAR(20),
@expiry_date date,
@cvv VARCHAR(4),
@customername VARCHAR(20)
AS
IF NOT EXISTS(SELECT * FROM Credit_Card WHERE number = @creditcardnumber)
   INSERT INTO Credit_Card
   VALUES(@creditcardnumber,@expiry_date,@cvv)
INSERT INTO Customer_CreditCard
VALUES(@customername,@creditcardnumber)
--exec AddCreditCard '4444-5555-6666-8888','2028-10-19','232','aly.ashraf'

--q)
GO
CREATE PROCEDURE ChooseCreditCard
@creditcard varchar(20),
@orderid int
AS
IF((SELECT expiry_date FROM Credit_Card WHERE number = @creditcard)>CURRENT_TIMESTAMP AND ((SELECT payment_type FROM Orders WHERE order_no = @orderid)='credit'))
UPDATE Orders
SET creditCard_number = @creditcard
WHERE order_no = @orderid

--drop proc ChooseCreditCard
--exec ChooseCreditCard '4444-5555-6666-8888',3


--r)
GO
CREATE PROCEDURE vewDeliveryTypes
AS
SELECT type,time_duration,fees
FROM Delivery
--exec vewDeliveryTypes

--s)
GO
CREATE PROCEDURE specifydeliverytype
@orderID int,
@deliveryID int
AS
UPDATE Orders
SET delivery_id = @deliveryID
WHERE order_no = @orderID
declare @tmp date
DECLARE @duration int
SELECT @tmp =O.order_date ,@duration =D.time_duration FROM Orders O INNER JOIN Delivery D
                           ON O.delivery_id = D.id
						   WHERE O.order_no = @orderID
UPDATE Orders
SET time_limit = DATEADD(DAY,@duration,@tmp)
WHERE order_no = @orderID
UPDATE Orders
SET remaining_days = (DAY(@tmp) + @duration) - DAY(CURRENT_TIMESTAMP)
WHERE order_no = @orderID
--exec specifydeliverytype 2,1
--select * from Orders

--t)
GO
CREATE PROCEDURE trackRemainingDays
@orderid int,
@customername varchar(20),
@days int OUTPUT
AS
DECLARE @duration int
DECLARE @o_date date
SELECT @o_date=order_date,@duration = time_duration
FROM Orders O INNER JOIN Delivery D
ON O.delivery_id = D.id
WHERE order_no = @orderID
UPDATE Orders
SET remaining_days = (DAY(@o_date) + @duration) - DAY(CURRENT_TIMESTAMP)
SELECT @days = remaining_days FROM Orders
WHERE order_no = @orderid AND customer_name = @customername
--declare @days int
--exec trackRemainingDays 4,'aly.ashraf',@days output
--print @days

--u)
GO
CREATE PROCEDURE recommend
@customername varchar(20)
AS
SELECT PF.* FROM
(SELECT TOP 3 PP.serial_no AS SNF,COUNT(SN) AS CSNF FROM
       ((SELECT W.serial_no AS SN,P1.category AS cat1 FROM Wishlist_Product W INNER JOIN Product P1 ON P1.serial_no = W.serial_no) CW 
	     INNER JOIN (SELECT TOP 3 P2.category AS cat2,COUNT(P2.serial_no) SN0 FROM CustomerAddstoCartProduct C INNER JOIN Product P2 ON P2.serial_no = C.serial_no
		                                                            WHERE C.customer_name = @customername
																	GROUP BY P2.category
																	ORDER BY count(P2.serial_no) DESC)CC
																	ON CC.cat2 = CW.cat1) 
																						INNER JOIN Product PP
																						ON SN = PP.serial_no
																						GROUP BY PP.serial_no
																						ORDER BY count(SN) DESC 
UNION
SELECT TOP 3 WP.serial_no AS SNF, COUNT(PL.serial_no) AS CSNF FROM 
 (SELECT CC1.customer_name,CC2.customer_name AS CN FROM CustomerAddstoCartProduct CC1 INNER JOIN CustomerAddstoCartProduct CC2 ON CC1.serial_no = CC2.serial_no
  WHERE CC1.customer_name = @customername AND CC2.customer_name <> @customername
  GROUP BY CC1.customer_name,CC2.customer_name
  HAVING COUNT(*) = (SELECT MAX(C) FROM (SELECT COUNT(*) AS C FROM CustomerAddstoCartProduct C1
													INNER JOIN CustomerAddstoCartProduct C2 ON C1.serial_no = C2.serial_no
													WHERE C1.customer_name = @customername AND C2.customer_name <> @customername
													GROUP BY C1.customer_name,C2.customer_name)AS temp)) CM INNER JOIN Wishlist_Product WP ON CM.CN = WP.username
													INNER JOIN Product PL ON WP.serial_no = PL.serial_no
													GROUP BY WP.serial_no
													ORDER BY COUNT(PL.serial_no) DESC
) R INNER JOIN Product PF on PF.serial_no = R.SNF
--exec recommend 'ahmed.ashraf'

-- C.Vendors
--a)
go
create proc postProduct
@vendorUsername varchar(20), @product_name varchar(20), @category varchar(20), 
@product_description text, @price decimal(10,2), @color varchar(20)
as 
insert into Product (product_name,vendor_username,category,product_description,price,color,available) 
values (@product_name,@vendorUsername,@category,@product_description,@price,@color,1)
--exec postProduct 'eslam.mahmod','pencilcase','accessory','container',30,'violet'

--b)
go
create proc vendorviewProducts
@vendorname varchar(20)
as 
select * from Product where vendor_username = @vendorname
--exec vendorviewProducts 'eslam.mahmod'

--c)
go
create proc EditProduct 
@vendorname varchar(20), @serialnumber int, @product_name varchar(20), @category varchar(20),
@product_description text, @price decimal(10,2), @color varchar(20)
as
declare @id int
select @id = customer_order_id 
from Product 
where serial_no = @serialnumber
if (@id is null)
begin
update Product set product_name = @product_name, product_description = @product_description, category = @category, price = @price,
color = @color where serial_no = @serialnumber and vendor_username = @vendorname 
end
--exec EditProduct 'hadeel.adel',4,'pencil','stationary','not hb',60,'pink'

--d)
go
create proc deleteProduct
@vendorname varchar(20), @serialnumber int 
as 
declare @id int
select @id = customer_order_id 
from Product 
where serial_no = @serialnumber
if(@id is null)
begin
delete from Product where serial_no = @serialnumber and vendor_username = @vendorname
end
--exec deleteProduct 'hadeel.adel',4

--e)
go
create proc viewQuestions
@vendorname varchar(20)
as
select CQP.*
from Customer_Question_Product CQP inner join Product P on CQP.serial_no = P.serial_no 
where P.vendor_username = @vendorname
--exec viewQuestions 'hadeel.adel'

--f)
go
create proc answerQuestions
@vendorname varchar(20), @serialno int, @customername varchar(20), @answer text --there is no obvious use for vendorname
as
update Customer_Question_Product set answer = @answer where serial_no = @serialno and customer_name = @customername and answer is null
--exec answerQuestions 'hadeel.adel',2,'ahmed.ashraf','40'

--g)
--g)1.
go 
create proc addOffer
@offeramount int, @expiry_date datetime
as
insert into offer (offer_amount,expiry_date)
values (@offeramount, @expiry_date)
--exec addOffer 50,'2019-11-10'

--g)2.
go
create proc checkOfferonProduct
@serial int, @activeoffer bit output
as
if exists (select serial_no from offersOnProduct where serial_no = @serial)
begin 
select @activeoffer = 1
end 
else 
begin
select @activeoffer = 0
end
--declare @activebit bit
--exec checkOfferonProduct 7,@activebit output
--print @activebit

--g)3.
go
create proc checkandremoveExpiredoffer
@offerid int 
as
delete from offer where expiry_date < current_timestamp
--exec checkandremoveExpiredoffer 2

--g)4.
go
create proc applyOffer 
@vendorname varchar(20), @serial int, @offerid int 
as
declare @activeoffer bit 
exec checkOfferonProduct @serial,@activeoffer output
if @activeoffer = 1
begin
print 'The product has an active offer'
end
else
begin
declare @offer_amount int 
select @offer_amount = offer_amount 
from offer 
where offer_id = @offerid
update Product set final_price = price*((100-@offer_amount)/100.00) where serial_no = @serial and vendor_username = @vendorname
insert into offersOnProduct
values (@offerid,@serial)
end
--exec applyOffer 'eslam.mahmod',9,1


-- C.Admins
--a)
go
create proc activateVendors
@admin_username varchar(20), @vendor_username varchar(20)
as
update Vendor set activated = 1, admin_username = @admin_username where admin_username is null and activated = 0
--exec activateVendors 'hana.aly','eslam.mahmod'

--b)
go
create proc inviteDeliveryPerson
@delivery_username varchar(20), @delivery_email varchar(50)
as
if not exists (select username from Users where @delivery_username = username)
begin
insert into Users(username,email)
values(@delivery_username,@delivery_email)
insert into Delivery_Person values(@delivery_username,0)
end
--exec inviteDeliveryPerson 'mona.ashraf','mona.ashraf@yahoo.com'

--c)
go
create proc reviewOrders 
as
select * from Orders
--exec reviewOrders

--d)
go
create proc updateOrderStatusInProcess
@order_no int
as
update Orders set order_status = 'in process' where @order_no = order_no
--exec updateOrderStatusInProcess 2
 
--e)
go
CREATE PROC addDelivery 
@delivery_type varchar(20),
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20)
as
IF @delivery_type IS NULL or @time_duration IS NULL or @fees  IS NULL or @admin_username IS NULL 
print 'One of the inputs is null'
ELSE
 INSERT INTO Delivery( type, time_duration, fees, username)
 VALUES (@delivery_type,@time_duration,@fees,@admin_username) 
--exec addDelivery 'fast',2,70.000,'hana.aly'

--f)
go
CREATE PROC  assignOrdertoDelivery   
@delivery_username varchar(20),
@order_no int,
@admin_username varchar(20) 
As
if exists (select username,is_activated
From delivery_person
Where username=@delivery_username And is_activated=1)
insert into Admin_Delivery_Order(delivery_username,order_no,admin_username)
Values(@delivery_username,@order_no,@admin_username)
--exec assignOrdertoDelivery 'mohamed.tamer',2,'hana.aly'
--select * from Admin_Delivery_Order

--g)
--g)1.
go
CREATE PROC createTodaysDeal
@deal_amount int,
@admin_username varchar(20),
@expiry_date datetime
as IF @deal_amount IS NULL or @admin_username IS NULL or @expiry_date  IS NULL 
print 'One of the inputs is null'
ELSE
 INSERT INTO Todays_Deals ( deal_amount, admin_username, expiry_date )
 VALUES (@deal_amount,@admin_username,@expiry_date) 
 --exec createTodaysDeal 30,'hana.aly','2019-11-19'

 --g)2.
go
CREATE PROC checkTodaysDealOnProduct
@serial_no int ,
@activeDeal BIT output
As
if exists(select serial_no
FRom Todays_Deals_Product
WHERE serial_no=@serial_no)
set @activeDeal=1
Else set @activeDeal=0
--DECLARE @ch BIT
--EXEC checkTodaysDealOnProduct 4 ,@ch OUTPUT
--PRINT @ch

--g)3.
go
CREATE PROC addTodaysDealOnProduct  --- today's deal OR today's deal product ????
@deal_id int, 
@serial_no int
as
IF @deal_id IS NULL or @serial_no IS NULL 
print 'One of the inputs is null'
ELSE
 INSERT INTO Todays_Deals_Product(deal_id,serial_no )
 VALUES (@deal_id , @serial_no) 
--exec addTodaysDealOnProduct 9,2

--g)4.
go
CREATE PROC removeExpiredDeal	
@deal_iD int
As
IF exists(select deal_id,expiry_date
From Todays_Deals
where deal_id=@deal_iD AND expiry_date<current_timestamp) 
BEGIN
DELETE FROM Todays_Deals_Product
WHERE (deal_id=@deal_iD)
DELETE FROM  Todays_Deals
WHERE (@deal_iD=deal_id)
END
--exec removeExpiredDeal 9

--h)
go
CREATE PROC createGiftCard  
@code varchar(10),
@expiry_date datetime,
@amount int,
@admin_username varchar(20)
AS
IF @code IS NULL or @expiry_date IS NULL or @amount IS NULL or @admin_username IS NULL 
print 'One of the inputs is null'
Else INSERT INTO Giftcard
VALUES(@code, @expiry_date,@amount,@admin_username)
--EXEC createGiftCard '2','11/3/2019',100,'hana.aly'

--i)
--i)1.
go
CREATE PROC removeExpiredGiftCard
@code varchar(10)
as
declare @points int
select @points=amount
from Giftcard
where @code=code
IF exists(select code,expiry_date
From Giftcard
where code=@code AND expiry_date<current_timestamp) 
BEGIN
DELETE FROM  Giftcard
WHERE (@code=code)
DELETE FROM Admin_Customer_Giftcard
WHERE code=@code
UPDATE Customer
SET points=points-@points
END
--EXEC removeExpiredGiftCard 'G101'

--i)2.
GO
CREATE PROC checkGiftCardOnCustomer 
@code varchar(10),
@activeGiftCard  bit output
as
if exists(
select code , customer_name
from Admin_Customer_Giftcard
where code = @code and customer_name is not null
)
set @activeGiftCard=1 
else  set @activeGiftCard=0
--DECLARE @ch BIT
--EXEC checkGiftCardOnCustomer '2',@ch OUTPUT
--PRINT @ch

--i)3. 
go
CREATE PROC giveGiftCardtoCustomer
@code varchar(10),
@customer_name varchar(20),
@admin_username varchar(20)
as
DECLARE @points int 
SELECT @points = amount FROM Giftcard WHERE code = @code
DECLARE @gcc varchar(10)
SELECT @gcc = code FROM Admin_Customer_Giftcard WHERE customer_name = @customer_name
DECLARE @date datetime
SELECT @date = expiry_date FROM Giftcard WHERE code = @code
--to issue the GC to the customer, the same GC must not be issued to the same customer and the GC itself must not be expired
IF(((@gcc IS NULL)OR (@gcc <> @code)) AND (@date>=CURRENT_TIMESTAMP)) 
BEGIN
	insert into Admin_Customer_Giftcard ( code , customer_name, admin_username,remaining_points)
	values (@code,@customer_name,@admin_username,@points)
	update Customer
	set points=points+@points
	where username=@customer_name
END
--exec giveGiftCardtoCustomer 'G101','ahmed.ashraf','hana.aly'
--select * from Admin_Customer_Giftcard
--select * from Customer

-- D. Delivery Personnel
-- a)
go
CREATE PROC acceptAdminInvitation
@delivery_username varchar(20)
as
UPDATE Delivery_Person
SET is_activated=1
Where username=@delivery_username
--exec acceptAdminInvitation 'mona.ashraf'

--b) 
go
CREATE PROC deliveryPersonUpdateInfo
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
as
IF @username IS NULL or @first_name IS NULL or @last_name IS NULL or @password is null or @email IS NULL
print 'One of the inputs is null'
Else 
UPDATE Users
set first_name=@first_name,last_name=@last_name,password=@password,email=@email
where  username=@username
--exec deliveryPersonUpdateInfo 'mona.ashraf','mona','ashraf','pass456','mona.ashraf@yahoo.com'

--c)
go 
CREATE PROC viewmyorders 
@deliveryperson varchar(20)
as
select o.*
from Orders o
inner join Admin_Delivery_Order ado on ado.order_no = o.order_no
where ado.delivery_username= @deliveryperson 
--exec viewmyorders 'mohamed.tamer'

--d)
go     
CREATE PROC specifyDeliveryWindow
@delivery_username varchar(20),
@order_no int,
@delivery_window varchar(50)
as 
update Admin_Delivery_Order
set delivery_window=@delivery_window
where order_no=@order_no AND delivery_username=@delivery_username
--exec specifyDeliveryWindow 'mohamed.tamer',1,'kbfvhkfbvk'
--select * from Admin_Delivery_Order

--e)
go
CREATE PROC updateOrderStatusOutforDelivery
@order_no int
as
update Orders
set order_status='Out for Delivery'
where order_no=@order_no
--exec updateOrderStatusOutforDelivery 1

--f)
go
CREATE PROC updateOrderStatusDelivered
@order_no int
as
update Orders
set order_status='Delivered'
where order_no=@order_no
--exec updateOrderStatusDelivered 3
