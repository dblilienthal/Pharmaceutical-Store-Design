drop table if exists prescriptions;
drop table if exists pharmacy_inventory;
drop table if exists pharamaceutical_contract;
drop table if exists supervisor;
drop table if exists pharmacy;
drop table if exists d_and_p;
drop table if exists patient;
drop table if exists doctor;
drop table if exists drug;
drop table if exists pharamaceutical_co;

create table patient (
	patient_id integer primary key auto_increment, 
	ssn integer not null,
	name varchar(64) not null,
	age integer not null,
	address varchar(64) not null
);

create table doctor (
	doctor_id integer primary key auto_increment,
	ssn integer not null,
	name varchar(64) not null,
	specialty varchar(64) not null,
	years_of_ex integer not null check (years_of_ex >= 0)
);

create table pharamaceutical_co (
	co_name varchar(64) primary key,
	phone varchar(20) not null
);

create table pharmacy (
	pharmacy_id integer primary key auto_increment,
	name varchar(20) not null,
	address varchar(64) not null,
	phone varchar(20) not null
);

create table supervisor (
	supervisor_id integer primary key auto_increment,
	name varchar(64) not null
);

create table drug (
	trade_name varchar(64) primary key,
	co_name varchar(64),
	formula varchar(64),
	foreign key (co_name) references pharamaceutical_co on delete cascade
);

create table d_and_p (
	d_p_id integer primary key auto_increment,
	patient_id integer,
	doctor_id integer,
	foreign key (patient_id) references patient on delete cascade,
	foreign key (doctor_id) references doctor on delete cascade
);

create table prescriptions (
	d_p_id integer,
	trade_name varchar(64),
	prescription_date date not null,
	quantity integer check (quantity < 300),
	primary key (d_p_id, trade_name),
	foreign key (d_p_id) references d_and_p on delete cascade,
	foreign key (trade_name) references drug on delete cascade
);

create table pharmacy_inventory (
	pharmacy_id integer,
	trade_name varchar(64),
	price numeric(8,2) not null,
	primary key (pharmacy_id, trade_name), 
	foreign key (pharmacy_id) references pharmacy on delete cascade,
	foreign key (trade_name) references drug on delete cascade
);

create table pharamaceutical_contract (
	co_name varchar(20),
	pharmacy_id integer,
	supervisor_id integer,
	start_date date not null,
	end_date date not null,
	terms_of_conditions varchar(1000) not null,
	primary key (co_name, pharmacy_id, supervisor_id),
	foreign key (co_name) references pharamaceutical_co on delete cascade,
	foreign key (pharmacy_id) references pharmacy on delete cascade,
	foreign key (supervisor_id) references supervisor on delete no action  
);

-- Inserting patient data
insert into patient(ssn, name, age, address) values (337729776,'Ariella Houston',21,'101 apple street, Monterey CA 93943');
insert into patient(ssn, name, age, address) values (302504998,'Anna Fraser',30,'15673 orange street, Monterey CA 93943');
insert into patient(ssn, name, age, address) values (495324246,'Edna Wise',39,'152 bananna street, Salinas CA 93901');
insert into patient(ssn, name, age, address) values (370129134,'Tyrell Wallis',69,'7572 grape ave, Salinas CA 93901');
insert into patient(ssn, name, age, address) values (348150304,'Azeem Mullen',72,'872 bubble blvd, Marina CA 93933');
insert into patient(ssn, name, age, address) values (460268673,'Roan Rosario',34,'1456 guitar street, Marina CA 93933');
insert into patient(ssn, name, age, address) values (778615605,'Safa Mendoza',12,'5525 strawberry ln, Salinas CA 93901');
insert into patient(ssn, name, age, address) values (354855875,'Maiya Rich',87,'1512 logitech court, Salinas CA 93901');
insert into patient(ssn, name, age, address) values (331721270,'Rehan Dodson',54,'4526 dell ln, Salinas CA 93901');
insert into patient(ssn, name, age, address) values (282574129,'Joseph Yoder',46,'7752 freemont street, Salinas CA 93901');

-- inserting doctor data
insert into doctor(ssn, name, specialty, years_of_ex) values (982548747,'Alicia Betts', 'surgery', 10);
insert into doctor(ssn, name, specialty, years_of_ex) values (529299000,'Anniyah Humphreys', 'internal medicine', 12);
insert into doctor(ssn, name, specialty, years_of_ex) values (824900600,'Harriett ORyan', 'pediatrics', 14);
insert into doctor(ssn, name, specialty, years_of_ex) values (983870730,'Leena Haines', 'dermatology', 5);
insert into doctor(ssn, name, specialty, years_of_ex) values (704482323,'Jan Small', 'orthopaedics', 16);
insert into doctor(ssn, name, specialty, years_of_ex) values (637356842,'Susannah Sparks', 'family medicine', 20);
insert into doctor(ssn, name, specialty, years_of_ex) values (687492241,'Rees House', 'psychiatry', 23);
insert into doctor(ssn, name, specialty, years_of_ex) values (711395122,'Eoghan Moon', 'orthopaedics', 15);
insert into doctor(ssn, name, specialty, years_of_ex) values (745539017,'Marcos Franco', 'pediatrics', 33);
insert into doctor(ssn, name, specialty, years_of_ex) values (949897078,'Hari Mack', 'surgery', 10);

-- inserting into pharamaceutical_co
insert into pharamaceutical_co values ('Bobs drugs', 276054991);
insert into pharamaceutical_co values ('Kyles drugs', 141840398);
insert into pharamaceutical_co values ('Dereks drugs', 532867364);
insert into pharamaceutical_co values ('Alice drugs', 906371870);
insert into pharamaceutical_co values ('Bryans drugs', 222402794);

-- inserting into pharmacy
insert into pharmacy(name, address, phone) values ('Ashleys Drug Store', '5000 rokit street, Marina CA 93933',8972600939);
insert into pharmacy(name, address, phone) values ('The hookup', '8800 Scarlett court, Salinas CA 93901',7548772690);
insert into pharmacy(name, address, phone) values ('Family Drugs', '3200 wash street, Marina CA 93933',6955979634);
insert into pharmacy(name, address, phone) values ('Alien Drugs and More', '2020 Sponge blvd, Monterey CA 93943',5353272496);
insert into pharmacy(name, address, phone) values ('Franks Drug Store', '5150 crazy street, Monterey CA 93943',4518104114);

-- inserting into supervisor
insert into supervisor(name) values ('Tobi Bate');
insert into supervisor(name) values ('John Dupont');
insert into supervisor(name) values ('Darla Buckner');
insert into supervisor(name) values ('Kit Hernandez');
insert into supervisor(name) values ('Eryk Redmond');

-- inserting into drug 
insert into drug values('Adderall', 'Bobs drugs','C9H13N');
insert into drug values('Oxycontin','Kyles drugs','C18H21NO4');
insert into drug values('Percocet', 'Kyles drugs','C18H21NO4');
insert into drug values('Tramadol','Dereks drugs','C16H25NO2');
insert into drug values('Hydrocodone','Dereks drugs','C18H21NO3');
insert into drug values('Fluticasone','Alice drugs','C25H31F3O5S');
insert into drug values('Xanax','Bryans drugs','C13H18O2');

-- inserting into d_and_p
insert into d_and_p(patient_id, doctor_id) values (1,2);
insert into d_and_p(patient_id, doctor_id) values (2,3);
insert into d_and_p(patient_id, doctor_id) values (3,4);
insert into d_and_p(patient_id, doctor_id) values (4,2);
insert into d_and_p(patient_id, doctor_id) values (5,5);
insert into d_and_p(patient_id, doctor_id) values (7,8);
insert into d_and_p(patient_id, doctor_id) values (8,5);
insert into d_and_p(patient_id, doctor_id) values (9,8);
insert into d_and_p(patient_id, doctor_id) values (2,9);
insert into d_and_p(patient_id, doctor_id) values (10,10);
insert into d_and_p(patient_id, doctor_id) values (4,2);
insert into d_and_p(patient_id, doctor_id) values (2,1);
insert into d_and_p(patient_id, doctor_id) values (5,6);
insert into d_and_p(patient_id, doctor_id) values (2,4);
insert into d_and_p(patient_id, doctor_id) values (1,9);
insert into d_and_p(patient_id, doctor_id) values (7,1);
insert into d_and_p(patient_id, doctor_id) values (10,2);
insert into d_and_p(patient_id, doctor_id) values (1,4);
insert into d_and_p(patient_id, doctor_id) values (4,7);
insert into d_and_p(patient_id, doctor_id) values (5,4);

-- inserting into prescriptions
insert into prescriptions values(1,'Adderall','2020-04-05',30);
insert into prescriptions values(4,'Tramadol','2020-04-10',30);
insert into prescriptions values(6,'Oxycontin','2020-04-04',60);
insert into prescriptions values(6,'Hydrocodone','2020-04-23',15);
insert into prescriptions values(3,'Tramadol','2020-02-04',30);
insert into prescriptions values(2,'Percocet','2020-05-01',14);
insert into prescriptions values(8,'Adderall','2020-04-14',30);
insert into prescriptions values(8,'Xanax','2020-04-25',20);
insert into prescriptions values(6,'Adderall','2020-04-12',15);
insert into prescriptions values(3,'Oxycontin','2020-04-23',15);
insert into prescriptions values(4,'Fluticasone','2020-04-22',15);
insert into prescriptions values(7,'Oxycontin','2020-04-25',30);
insert into prescriptions values(9,'Xanax','2020-03-15',60);
insert into prescriptions values(8,'Oxycontin','2020-04-19',60);
insert into prescriptions values(10,'Xanax','2020-01-18',120);
insert into prescriptions values(12,'Tramadol','2020-01-25',30);
insert into prescriptions values(13,'Adderall','2020-04-19',60);
insert into prescriptions values(7,'Fluticasone','2020-02-21',60);
insert into prescriptions values(17,'Tramadol','2020-02-23',10);
insert into prescriptions values(19,'Percocet','2020-04-24',10);
insert into prescriptions values(16,'Adderall','2020-04-26',30);
insert into prescriptions values(6,'Xanax','2020-02-21',30);
insert into prescriptions values(4,'Oxycontin','2020-04-03',15);
insert into prescriptions values(16,'Percocet','2020-04-30',10);
insert into prescriptions values(11,'Adderall','2020-04-15',10);
insert into prescriptions values(12,'Fluticasone','2020-04-24',120);
insert into prescriptions values(10,'Oxycontin','2020-04-23',30);
insert into prescriptions values(5,'Xanax','2020-04-03',60);
insert into prescriptions values(9,'Tramadol','2020-04-04',15);
insert into prescriptions values(6,'Fluticasone','2020-04-30',60);
insert into prescriptions values(9,'Oxycontin','2020-05-01',15);
insert into prescriptions values(1,'Xanax','2020-04-23',30);
insert into prescriptions values(13,'Hydrocodone','2020-04-22',120);
insert into prescriptions values(13,'Oxycontin','2020-04-20',30);
insert into prescriptions values(17,'Xanax','2020-04-02',15);
insert into prescriptions values(14,'Fluticasone','2020-04-23',15);
insert into prescriptions values(15,'Oxycontin','2020-04-22',30);
insert into prescriptions values(20,'Xanax','2020-04-29',30);
insert into prescriptions values(19,'Adderall','2020-04-26',60);
insert into prescriptions values(18,'Tramadol','2020-04-25',15);
insert into prescriptions values(18,'Adderall','2020-04-26',30);

-- insert into pharmacy_inventory
insert into pharmacy_inventory values(1,'Oxycontin','10.00');
insert into pharmacy_inventory values(1,'Hydrocodone','15.00');
insert into pharmacy_inventory values(1,'Fluticasone','10.00');
insert into pharmacy_inventory values(1,'Xanax','12.00');
insert into pharmacy_inventory values(2,'Adderall','5.00');
insert into pharmacy_inventory values(2,'Hydrocodone','15.00');
insert into pharmacy_inventory values(2,'Percocet','20.00');
insert into pharmacy_inventory values(2,'Oxycontin','20.00');
insert into pharmacy_inventory values(2,'Xanax','20.00');
insert into pharmacy_inventory values(3,'Fluticasone','14.99');
insert into pharmacy_inventory values(3,'Hydrocodone','13.99');
insert into pharmacy_inventory values(3,'Adderall','9.99');
insert into pharmacy_inventory values(3,'Xanax','30.00');
insert into pharmacy_inventory values(4,'Percocet','12.95');
insert into pharmacy_inventory values(4,'Fluticasone','10.00');
insert into pharmacy_inventory values(4,'Hydrocodone','5.99');
insert into pharmacy_inventory values(4,'Xanax','15.00');
insert into pharmacy_inventory values(5,'Adderall','30.00');
insert into pharmacy_inventory values(5,'Percocet','10.95');
insert into pharmacy_inventory values(5,'Fluticasone','5.99');
insert into pharmacy_inventory values(5,'Xanax','10.00');

-- insert into pharamaceutical_contract
insert into pharamaceutical_contract values('Bobs drugs',1,1,'2015-01-01','2020-01-01','1');
insert into pharamaceutical_contract values('Bobs drugs',1,2,'2017-01-01','2022-01-01','1');
insert into pharamaceutical_contract values('Kyles drugs',2,3,'2016-01-01','2021-01-01','2');
insert into pharamaceutical_contract values('Kyles drugs',2,4,'2014-01-01','2019-01-01','2');
insert into pharamaceutical_contract values('Dereks drugs',3,1,'2016-01-01','2021-01-01','3');
insert into pharamaceutical_contract values('Dereks drugs',3,3,'2015-01-01','2020-01-01','3');
insert into pharamaceutical_contract values('Alice drugs',4,3,'2014-01-01','2019-01-01','4');
insert into pharamaceutical_contract values('Alice drugs',5,2,'2017-01-01','2022-01-01','4');
insert into pharamaceutical_contract values('Bryans drugs',5,5,'2016-01-01','2021-01-01','5');
insert into pharamaceutical_contract values('Bryans drugs',5,4,'2017-01-01','2022-01-01','5');

-- 1. The DEA wants to know if any patients of ours have been getting the same prescription 
-- from multiple doctors. If there are, they want to know their name, address, the type of 
-- drug, and the number of times they have got that prescription all within the last 30 days
select Patient, address, Drug, Num_of_Doctors, from (
	select p.name as Patient, p.address as address, count(d.name) as Num_of_Doctors,  pre.TRADE_NAME as Drug 
		from PATIENT p left outer join D_AND_P dp on p.PATIENT_ID = dp.PATIENT_ID
		right outer join DOCTOR d on d.DOCTOR_ID = dp.DOCTOR_ID 
		right outer join PRESCRIPTIONS as pre on dp.D_P_ID =  pre.D_P_ID
	where pre.PRESCRIPTION_DATE > '2020-04-01'
	group by p.PATIENT_ID, pre.TRADE_NAME
	order by Num_of_Doctors desc)
where Num_of_Doctors > 1;
--> Ariella Houston 101 apple street, Monterey CA 93943 Adderall 2
--> Anna Fraser 15673 orange street, Monterey CA 93943 Fluticasone 2
--> Tyrell Wallis 7572 grape ave, Salinas CA 93901 Adderall 2
--> Azeem Mullen 872 bubble blvd, Marina CA 93933 Xanax 2
--> Safa Mendoza 5525 strawberry ln, Salinas CA 93901 Adderall 2
;

-- 2. The DEA wants to see if doctors prescribe the most number drugs to patients under 30.
-- They said that in their report, they want the name of the doctor, their specialty, and 
-- how many prescriptions they have given out. 
select DOCTOR.NAME, DOCTOR.SPECIALTY, count(*) as num_of_prescriptions from 
DOCTOR join D_AND_P on DOCTOR.DOCTOR_ID = D_AND_P.DOCTOR_ID 
join PRESCRIPTIONS on PRESCRIPTIONS.D_P_ID = D_AND_P.D_P_ID 
join PATIENT on PATIENT.PATIENT_ID = D_AND_P.PATIENT_ID 
where PATIENT.AGE < 30
group by DOCTOR.NAME 
order by num_of_prescriptions desc, DOCTOR.NAME;
--> Eoghan Moon orthopaedics 5
--> Alicia Betts surgery 2
--> Anniyah Humphreys internal medicine 2
--> Leena Haines dermatology 2
--> Marcos Franco pediatrics 1
;

-- 3. The CEO of the company wants to know what stores are performing well this month.
-- What are the sales of the each of the pharmacies in the last 30 days? 
select distinct(PHARMACY.NAME), sum(PHARMACY_INVENTORY.PRICE) as Sales from 
PRESCRIPTIONS join DRUG on DRUG.TRADE_NAME = PRESCRIPTIONS.TRADE_NAME 
join PHARMACY_INVENTORY on PHARMACY_INVENTORY.TRADE_NAME = DRUG.TRADE_NAME 
join PHARMACY on PHARMACY.PHARMACY_ID = PHARMACY_INVENTORY.PHARMACY_ID
where PRESCRIPTIONS.PRESCRIPTION_DATE > '2020-04-01'
group by PHARMACY.NAME
order by Sales desc;
--> The hookup 410.00
--> Franks Drug Store 346.81
--> Family Drugs 317.86
--> Ashleys Drug Store 220.00
--> Alien Drugs and More 165.83
;

-- 4. The big wigs at corporate want to know which pharmaceutical company 
-- we are contracted with is selling the most drugs within the company. 
-- Which pharmaceutical company sells the most drugs to patients?
select PHARAMACEUTICAL_CO.CO_NAME as Pharma, count(PATIENT.NAME) as num_of_products_sold
from PATIENT 
natural join D_AND_P 
natural join PRESCRIPTIONS
natural join DRUG 
natural join PHARAMACEUTICAL_CO 
where PATIENT.NAME not is null
group by PHARAMACEUTICAL_CO.CO_NAME
order by  Pharma desc limit 1;
--> Kyles drugs 12
;

-- 5. The DEA wants to make sure that the doctors who are prescribing controlled
-- substances have some experience before prescribing them.
-- What is the average years of experience for doctors who prescribe Tramadol?
select avg(experience) from (
	select DOCTOR.YEARS_OF_EX as experience from
	DOCTOR natural join D_AND_P 
	natural join PRESCRIPTIONS 
	where PRESCRIPTIONS.TRADE_NAME ='Tramadol');
--> 12
;






























