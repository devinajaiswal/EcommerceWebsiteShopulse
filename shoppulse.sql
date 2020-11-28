
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
#-----------------------------------INSERT STATEMENTS---------------------------------------

#insert into role table
insert into role(role_id, role_type)
VALUES (1,'admin');

insert into role(role_id, role_type)
VALUES (2,'customer');

#-----------------------------------------------------------------------------------------------