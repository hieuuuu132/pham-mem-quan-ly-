create database manage;
go
----tạo bảng----
CREATE TABLE driver (
    id_driver INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name_driver VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    place_of_birth VARCHAR(20),
    date_joined DATE NOT NULL
);

CREATE TABLE vehicle (
    id_vehicle INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_driver INT NOT NULL,
    name_vehicle VARCHAR(10),
    number_of_vehicle VARCHAR(15) NOT NULL
);
CREATE TABLE orders (
    id_order INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_vehicle INT NOT NULL,
    number_of_successful INT,
    number_of_cancellations INT,
    cost FLOAT NOT NULL,
    where_start VARCHAR(50) NOT NULL,
    where_finish VARCHAR(50) NOT NULL,
    total_order INT
);
CREATE TABLE registration_form (
    id_registration_form INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    id_driver INT NOT NULL,
    content VARCHAR(100),
    date_of_registration DATE NOT NULL,
    registration_status VARCHAR(100)
);
---tạo các ràng buộc---
alter table vehicle
add foreign key (id_driver) references manage.driver(id_driver);

alter table registration_form
add foreign key (id_driver) references manage.driver(id_driver);

alter table orders
add foreign key (id_vehicle) references manage.vehicle(id_vehicle);

---nhập dữ liệu vào bảng----
insert into driver(name_driver,date_of_birth,place_of_birth,date_joined) 
values ('Trieu Duc Lung','2003-06-09','Phu Tho','2023-06-29'),
('Do Tuan Minh','2002-03-11','Nghe An','2023-04-19'),
('Nguyen Van Phu','1975-04-22','Thanh Hoa','2023-06-13'),
('Nguyen Nguyen Nguyen', '2000-12-23','Bac Ninh','2024-10-01');
insert into registration_form(id_driver,registration_status,date_of_registration) 
values ('1','CV xin viec','2023-06-29'),
('2','CV xin viec','2023-04-19'),
('3','CV xin viec','2023-06-13'),
('4','CV xin viec','2023-10-01'),
('1','Don xin nghi om','20123-07-29'),
('3','Don xin tam ung','2023-12-10');

insert into vehicle(id_driver,name_vehicle,number_of_vehicle) 
values ('1','Maybach','30A-15551'),
('1','HondaWave','29B2-99999'),
('2','HondaCRV','30U-56878'),
('2','HondaBlade','29M1-59598'),
('3','Huyndai','30A-14533'),
('3','HondaSH','36V1-5448'),
('4','BMWX5','29A-90992'),
('4','Yamaha','99U1-84577');
insert into orders(id_vehicle,where_start,where_finish,cost) 
values	
('5','So 1 Dai Co Viet','Nha 24 Ngo 13 Linh Nam',34000),
('3','27 Thanh Xuan','Dai hoc Thuy Loi',101000),
('5','159 Da Phuc ','KTX B6 Dai hoc Bach Khoa Ha Noi',51000), 
('6','205 Nguyen Hien','Honda 18 Tam Trinh',12000),
('3','17 Giai Phong','252 Xa Dan',16000),
('5','355 Bach Mai','25 Dai La',89000),
('4','Hoc vien Toa an','Cong vien Thong Nhat',23000), 
('8','Pho di bo Ho Guom','Nha tu Hoa Lo',54000), 
('10','So 1 Dai Co Viet','Benh vien Bach Mai',21000),
('7','Khu do thi Phap Van','Nha 24 Ngo 13 Linh Nam',79000);

---các câu lệnh chức năng---

select number_of_vehicle,id_vehicle from manage.vehicle;---tra cứu biến số xe đăng ký---

select * from orders where cost<=50000;---Tra cứu chuyến xe có giá nhỏ hơn 50000đ---

select count(id_vehicle) from orders 
where id_vehicle='3' or id_vehicle='4';---tra cứu tổng số chuyến xe của tài xế---

insert into orders(id_vehicle,where_start,where_finish,cost) 
values 
('7','So 1 Dai Co Viet','Nha 24 Ngo 13 Linh Nam',34000),
('3','27 Thanh Xuan','Dai hoc Thuy Loi',101000),
('5','159 Da Phuc ','KTX B6 Dai hoc Bach Khoa Ha Noi',51000);--- nhập thông tin chuyến xe---
