
/*create database */
create database shoppulse;
#use created database to create tables 
use Shoppulse;
#-------------------------TABLE CREATION-----------------------------

# Role table
create table role( 
role_id int NOT NULL PRIMARY KEY,
role_type varchar(30) NOT NULL,
CONSTRAINT roleCHK CHECK ( role_type='customer' or role_type='admin')
);

# USER TABLE
create table user(
user_id int PRIMARY KEY,
userName varchar(20) UNIQUE,
password varchar(30),
fName varchar(30),
lName varchar(30),
role_id int,
createdDate DATETIME,
isActive boolean,
FOREIGN KEY (role_id) REFERENCES role(role_id) 
);

# CATEGORY TABLE
create table category(
categoryId int PRIMARY KEY,
categoryName varchar(30)
);

# PRODUCT TABLE
create table product(
product_id int primary key,
productName varchar(40),
price numeric(10,2),
categoryId int,
foreign key (categoryId) references category(categoryID)
); 

# CART TABLE
create table cart(
cartId int PRIMARY KEY,
userID int,
ProductId int,
quantity int,
foreign key (userId) REFERENCES user(user_id),
foreign key (productId) REFERENCES product(product_id)
);

# ORDER TABLE
create table orderTable(
orderId int Primary key,
cartId int,
orderDate Datetime,
shipDate Datetime,
orderTotal numeric(10,2),
totalItems int,
taxes numeric(10,2),
foreign key (cartId) references cart (cartId)
);

#OrderDetails Table
create table orderDetails(
orderId int,
productId int,
productQuantity numeric(10,2),
foreign key (orderId) references orderTable(orderId)
);

#Address table
create table address(
addressId int primary key,
userId int,
addressType varchar(50),
streetAddress varchar(30),
city varchar(30),
state varchar(30),
zipcode numeric(6),
country varchar(30),
foreign key (userId) references user(user_id),
 CONSTRAINT addressTypeCHK CHECK ( addressType='shipping' or addressType='billing')
);

#-----------------------------------INSERT STATEMENTS---------------------------------------

#insert into role table
insert into role(role_id, role_type)
VALUES (1,'admin');

insert into role(role_id, role_type)
VALUES (2,'customer');

#-----------------------------------------------------------------------------------------------