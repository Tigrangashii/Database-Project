Create Database Project_DB
use Project_DB

CREATE TABLE puntoret_type (
id char(2) primary key,                  --ISA 
type varchar(20) not null unique                             
)

CREATE TABLE puntoret (
	p_id int not null,
	p_name varchar(20) not null,
	p_surname varchar(20) not null,
	p_email varchar(40),
	p_password varchar(20),
	p_type char(2) not null default '1', 
	p_created_at date not null,
	p_updated_at date not null,
	p_data_lindjes date CHECK ( year(p_data_lindjes) <= 2004 ),
	p_rruga varchar(20),
	p_qyteti varchar(20),
	p_zip_kodi int,
	p_nr_tel int,
	Primary Key (p_id),
	Foreign Key(p_type) references puntoret_type(id)
) 
CREATE TABLE platformat(
	id char(2),
	name varchar(20) unique not null,

	Primary Key(id)
)
CREATE TABLE platformat_puntor(
	id int primary key,
	platform_id char(2),
	puntor_id int,
	Foreign key(platform_id) references platformat(id),
	Foreign key(puntor_id) references puntoret(p_id),
)

CREATE TABLE projectet (
	p_id int,
	name varchar(20),
	project_manager_id int not null,
	data_fillimit date not null,
	data_perfundimit date
	
	Primary Key(p_id)
	Foreign Key(project_manager_id) references puntoret(p_id)
)
create table project_puntor(
	id int primary key,
	project_id int not null,
	puntor_id int not null,
	Foreign Key(puntor_id) references puntoret(p_id),
	Foreign key(project_id) references projectet(p_id)
)
CREATE TABLE project_platformat(
	id int primary key,
	platform_id char(2),
	project_id int not null,
	Foreign key(platform_id) references platformat(id),
	Foreign key(project_id) references projectet(p_id),
)
CREATE TABLE klientet(
	k_id int primary key,
	project_id int not null unique,
	k_emri varchar(20),
	k_mbiemri varchar(20),
	k_nr_tel int,
	Foreign key(project_id) references projectet(p_id),
)
CREATE TABLE faturat(
	f_id int primary key,
	f_qmimi float not null,
	faturat_description varchar(100),
	klient_id int not null,
	project_id int not null,
	Foreign key(klient_id) references klientet(k_id),
	Foreign key(project_id) references projectet(p_id),
)
create table zyret(
	z_id int IDENTITY(1,1) primary key,         
	location varchar(20) not null,
)
create table zyret_puntor(
	id int primary key,
	zyre_id int not null,
	puntor_id int,
	Foreign key(zyre_id) references zyret(z_id),
	Foreign key(puntor_id) references puntoret(p_id),
)
create table boardet (
	id int primary key,
	project_id int not null,
	Foreign key(project_id) references projectet(p_id),
)
create table Tasks(
	t_id int primary key,
	t_description varchar(50),
	boarder_id int not null,
	Foreign key(boarder_id) references boardet(id),
)
create table task_puntoret(
	id int primary key,
	task_id int not null,
	puntor_id int not null,
	Foreign key(task_id) references tasks(t_id),
	Foreign key(puntor_id) references puntoret(p_id),
)
create table familjet(
	f_id int primary key,
	f_mbiemri varchar(20),
	f_rruga varchar(20),
	f_qyteti varchar(20),
	f_zip_kodi int,
	f_nr_tel int,
	puntor_id int not null,
	Foreign key(puntor_id) references puntoret(p_id),
)

insert into puntoret_type(id, type) values
	('1', 'Developer'),
	('2', 'Designer'),
	('3', 'Project Manager');

INSERT INTO puntoret
VALUES (1, 'Agon', 'Avdullahu', null, null, 1 ,  '2020/07/18', '2021/07/18', '2002/07/18', null, null, null, null )

INSERT INTO puntoret
VALUES (2, 'Tigran', 'Gashi', 't.gashi@gmail.com', 'tigran123','1',  '2020/07/18', '2021/07/18', '2002/07/18', 'lorem ipsum', 'Rahovec', 12345, 044123456)

INSERT INTO puntoret(p_id, p_name, p_surname, p_created_at, p_updated_at, p_data_lindjes)
VALUES (3, 'P03', 'P03', '2020/07/18', '2021/07/18', '2002/07/18' )

INSERT INTO puntoret
VALUES (4, 'P04', 'P04', 'email@gmail.com', 'pw','1',  '2019/07/18', '2018/07/18', '2001/07/18', null, 'Prishtine', null, null )

INSERT INTO puntoret
VALUES (5, 'P05', 'P05', null, null,'1',  '2002/07/18', '2021/07/18', '2002/07/18', null, null, null, 049123456 )

INSERT INTO puntoret
VALUES (6, 'P06', 'P06', null, null,'1',  '2020/07/18', '2021/07/18', '2002/07/18', null, 'Prizren', null, null )

INSERT INTO puntoret
VALUES (7, 'P07', 'P07', null, null,'1',  '2020/07/18', '2021/07/18', '2002/07/18', null, null, null, null )

INSERT INTO puntoret
VALUES (8, 'P08', 'P08', null, null,'1',  '2020/07/18', '2021/07/18', '2002/07/18', null, 'Munchen', null, null )

INSERT INTO puntoret
VALUES (9, 'P09', 'P09', null, null,'1',  '2020/07/18', '2021/07/18', '2002/07/18', null, null, null, null )

INSERT INTO puntoret
VALUES (10, 'P10', 'P10', null, null,'1',  '2020/07/18', '2021/07/18', '2002/07/18', null, 'Gjakove', null, null )

INSERT INTO puntoret
VALUES (11, 'P11', 'P12', null, null,'2',  '2020/07/18', '2021/07/18', '2002/07/18', null, null, null, null )

INSERT INTO puntoret
VALUES (12, 'P12', 'P11', null, null,'2',  '2020/07/18', '2021/07/18', '2002/07/18', null, 'Fush Kosove', null, null )

INSERT INTO puntoret
VALUES (13, 'P13', 'P13', null, null,'3',  '2020/07/18', '2021/07/18', '2002/07/18', null, null, null, null )

INSERT INTO puntoret
VALUES (14, 'P14', 'P14', null, null,'3',  '2020/07/18', '2021/07/18', '2002/07/18', null, 'Malishev', null, null )

insert into platformat(id, name) values
	('1', 'Windows'),
	('2', 'Mac OS'),
	('3', 'LINUX'),
	('4', 'Android'),
	('5', 'IOS');

INSERT INTO platformat_puntor VALUES (1, '1', 1)
INSERT INTO platformat_puntor VALUES (2, '1', 2)
INSERT INTO platformat_puntor VALUES (3, '1', 3)
INSERT INTO platformat_puntor VALUES (4, '1', 4)
INSERT INTO platformat_puntor VALUES (5, '1', 5)
INSERT INTO platformat_puntor VALUES (6, '1', 6)
INSERT INTO platformat_puntor VALUES (7, '1', 7)
INSERT INTO platformat_puntor VALUES (8, '1', 8)
INSERT INTO platformat_puntor VALUES (9, '1', 9)
INSERT INTO platformat_puntor VALUES (10, '3', 10)
INSERT INTO platformat_puntor VALUES (11, '2', 1)
INSERT INTO platformat_puntor VALUES (12, '2', 2)
INSERT INTO platformat_puntor VALUES (13, '3', 3)
INSERT INTO platformat_puntor VALUES (14, '3', 4)
INSERT INTO platformat_puntor VALUES (15, '4', 5)
INSERT INTO platformat_puntor VALUES (16, '4', 6)
INSERT INTO platformat_puntor VALUES (17, '5', 7)
INSERT INTO platformat_puntor VALUES (18, '5', 8)
INSERT INTO platformat_puntor VALUES (19, '2', 9)
INSERT INTO platformat_puntor VALUES (20, '4', 10)
INSERT INTO platformat_puntor VALUES (21, '3', 1)
INSERT INTO platformat_puntor VALUES (22, '3', 2)
INSERT INTO platformat_puntor VALUES (23, '4', 3)
INSERT INTO platformat_puntor VALUES (24, '4', 4)
INSERT INTO platformat_puntor VALUES (25, '5', 10)

INSERT INTO projectet VALUES (1, 'name', 13, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (2, null, 13, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (3, 'name', 13, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (4, null, 13, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (5, 'name', 13, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (6, null, 14, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (7, 'name', 14, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (8, null, 14, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (9, 'name', 14, '2020/1/1', '2022/1/8' )
INSERT INTO projectet VALUES (10, null, 14, '2020/1/1', '2022/1/8' )

INSERT INTO project_puntor VALUES (1, 1, 1)
INSERT INTO  project_puntor VALUES (2, 1, 11)
INSERT INTO project_puntor VALUES (3, 1, 13)
INSERT INTO project_puntor VALUES (4, 2, 2)
INSERT INTO project_puntor VALUES (5, 2, 3)
INSERT INTO project_puntor VALUES (6, 2, 12)
INSERT INTO project_puntor VALUES (7, 2, 14)
INSERT INTO project_puntor VALUES (8, 3, 4)
INSERT INTO project_puntor VALUES (9, 3, 5)
INSERT INTO project_puntor VALUES (10, 3, 6)
INSERT INTO project_puntor VALUES (11, 3, 7)
INSERT INTO project_puntor VALUES (12, 3, 11)
INSERT INTO project_puntor VALUES (13, 3, 14)
INSERT INTO project_puntor VALUES (14, 4, 8)
INSERT INTO project_puntor VALUES (15, 4, 9)
INSERT INTO project_puntor VALUES (16, 4, 2)
INSERT INTO project_puntor VALUES (17, 4, 13)
INSERT INTO project_puntor VALUES (18, 5, 13)
INSERT INTO project_puntor VALUES (19, 6, 1)
INSERT INTO project_puntor VALUES (20, 7, 6)
INSERT INTO project_puntor VALUES (21, 7, 13)
INSERT INTO project_puntor VALUES (22, 8, 5)
INSERT INTO project_puntor VALUES (23, 9, 8)
INSERT INTO project_puntor VALUES (24, 10, 10)
INSERT INTO project_puntor VALUES (25, 10, 14)
INSERT INTO project_puntor VALUES (26, 5, 1)

INSERT INTO project_platformat VALUES (1, '1', 1)
INSERT INTO project_platformat VALUES (2, '2', 1)
INSERT INTO project_platformat VALUES (3, '4', 1)
INSERT INTO project_platformat VALUES (4, '1', 2)
INSERT INTO project_platformat VALUES (5, '4', 2)
INSERT INTO project_platformat VALUES (6, null, 3)
INSERT INTO project_platformat VALUES (7, '1', 4)
INSERT INTO project_platformat VALUES (8, '2', 4)
INSERT INTO project_platformat VALUES (9, '4', 4)
INSERT INTO project_platformat VALUES (10, '4', 5)
INSERT INTO project_platformat VALUES (11, '5', 5)
INSERT INTO project_platformat VALUES (12, '1', 6)
INSERT INTO project_platformat VALUES (13, '1', 7)
INSERT INTO project_platformat VALUES (14, '2', 7)
INSERT INTO project_platformat VALUES (15, '3', 7)
INSERT INTO project_platformat VALUES (16, '4', 7)
INSERT INTO project_platformat VALUES (17, '1', 8)
INSERT INTO project_platformat VALUES (18, '2', 8)
INSERT INTO project_platformat VALUES (19, '3', 8)
INSERT INTO project_platformat VALUES (20, '4', 9)
INSERT INTO project_platformat VALUES (21, '5', 9)
INSERT INTO project_platformat VALUES (22, '1', 10)
INSERT INTO project_platformat VALUES (23, '2', 10)
INSERT INTO project_platformat VALUES (24, '3', 10)
INSERT INTO project_platformat VALUES (25, '4', 10)

INSERT INTO klientet VALUES (1, 1, 'emri', 'mbiemri', '043123456' )
INSERT INTO klientet VALUES (2, 2, 'emri', 'mbiemri', null )
INSERT INTO klientet VALUES (3, 3, 'emri', null, null )
INSERT INTO klientet VALUES (4, 4, 'emri', 'mbiemri', null )
INSERT INTO klientet VALUES (5, 5, 'emri', 'mbiemri', '043123456' )
INSERT INTO klientet VALUES (6, 6, 'emri', null, null )
INSERT INTO klientet VALUES (7, 8, 'emri', 'mbiemri', null )
INSERT INTO klientet VALUES (8, 7, 'emri', 'mbiemri', null )
INSERT INTO klientet VALUES (9, 9, 'emri', null, null )
INSERT INTO klientet VALUES (10, 10, 'emri', 'mbiemri', '043123456' )

INSERT INTO faturat VALUES (1, 1100.00,'lorem ipsum', 1, 1)
INSERT INTO faturat VALUES (2, 200.00,'lorem ipsum', 2, 2)
INSERT INTO faturat VALUES (3, 2000.00,'lorem ipsum', 3, 3)
INSERT INTO faturat VALUES (4, 400.00,null, 4, 4)
INSERT INTO faturat VALUES (5, 100.00,'lorem ipsum', 5,5 )
INSERT INTO faturat VALUES (6, 1110.10,'lorem ipsum', 6, 6)
INSERT INTO faturat VALUES (7, 1000.00,'lorem ipsum', 7, 8)
INSERT INTO faturat VALUES (8, 100.00,null, 8, 7)
INSERT INTO faturat VALUES (9, 100.00,'lorem ipsum', 9, 9)
INSERT INTO faturat VALUES (10, 1500.00,'lorem ipsum', 10, 10)

insert into zyret values('Rahovec')
insert into zyret values( 'Prishtin')
insert into zyret values( 'Gjakov')
insert into zyret values('Gjilan')
insert into zyret values( 'Ferizaj')
insert into zyret values( 'Pej')
insert into zyret values( 'Fushe Kosove')
insert into zyret values('Prizren')
insert into zyret values( 'New York')
insert into zyret values( 'Munich')

insert into zyret_puntor values(1,1,1)
insert into zyret_puntor values(2,1,2)
insert into zyret_puntor values(3,2,3)
insert into zyret_puntor values(4,3,4)
insert into zyret_puntor values(5,4,5)
insert into zyret_puntor values(6,4,6)
insert into zyret_puntor values(7,4,7)
insert into zyret_puntor values(8,7,8)
insert into zyret_puntor values(9,7,9)
insert into zyret_puntor values(10,9,10)
insert into zyret_puntor values(11,9,11)
insert into zyret_puntor values(12,10,12)
insert into zyret_puntor values(13,10,13)
insert into zyret_puntor values(14,110,14)

insert into boardet values(1,1)
insert into boardet values(2,1)
insert into boardet values(3,1)
insert into boardet values(4,2)
insert into boardet values(5,2)
insert into boardet values(6,2)
insert into boardet values(7,3)
insert into boardet values(8,3)
insert into boardet values(9,3)
insert into boardet values(10,4)
insert into boardet values(11,4)
insert into boardet values(12,4)
insert into boardet values(13,5)
insert into boardet values(14,5)
insert into boardet values(15,5)
insert into boardet values(16,6)
insert into boardet values(17,6)
insert into boardet values(18,6)
insert into boardet values(19,7)
insert into boardet values(20,7)
insert into boardet values(21,7)
insert into boardet values(22,8)
insert into boardet values(23,8)
insert into boardet values(24,8)
insert into boardet values(25,9)
insert into boardet values(26,9)
insert into boardet values(27,9)
insert into boardet values(28,10)
insert into boardet values(29,10)
insert into boardet values(30,10)

insert into Tasks values(1,'lorem ipsum', 1)
insert into Tasks values(2,'lorem ipsum', 1)
insert into Tasks values(3,'lorem ipsum', 2)
insert into Tasks values(4,'lorem ipsum', 3)
insert into Tasks values(5,'lorem ipsum', 3)
insert into Tasks values(6,'lorem ipsum', 3)
insert into Tasks values(7,'lorem ipsum', 4)
insert into Tasks values(8,'lorem ipsum', 6)
insert into Tasks values(9,'lorem ipsum', 8)
insert into Tasks values(10,'lorem ipsum', 10)
insert into Tasks values(11,'lorem ipsum', 11)
insert into Tasks values(12,'lorem ipsum', 12)
insert into Tasks values(13,'lorem ipsum', 12)
insert into Tasks values(14,'lorem ipsum', 12)
insert into Tasks values(15,'lorem ipsum', 14)
insert into Tasks values(16,'lorem ipsum', 14)
insert into Tasks values(17,'lorem ipsum', 20)
insert into Tasks values(18,'lorem ipsum', 20)
insert into Tasks values(19,'lorem ipsum', 21)
insert into Tasks values(20,'lorem ipsum', 21)
insert into Tasks values(21,'lorem ipsum', 22)
insert into Tasks values(22,'lorem ipsum', 21)
insert into Tasks values(23,'lorem ipsum', 20)
insert into Tasks values(24,'lorem ipsum', 23)
insert into Tasks values(25,'lorem ipsum', 24)
insert into Tasks values(26,'lorem ipsum', 24)
insert into Tasks values(27,'lorem ipsum', 25)
insert into Tasks values(28,'lorem ipsum', 25)
insert into Tasks values(29,'lorem ipsum', 28)
insert into Tasks values(30,'lorem ipsum', 28)

insert into task_puntoret values(1, 1, 1)
insert into task_puntoret values(2, 2, 1)
insert into task_puntoret values(3, 3, 11)
insert into task_puntoret values(4, 4, 13)
insert into task_puntoret values(5, 5, 13)
insert into task_puntoret values(6, 6, 13)
insert into task_puntoret values(7, 7, 2)
insert into task_puntoret values(8, 8, 14)
insert into task_puntoret values(9, 9, 12)
insert into task_puntoret values(10, 10, 3)
insert into task_puntoret values(11, 11, 11)
insert into task_puntoret values(12, 12, 13)
insert into task_puntoret values(13, 13, 13)
insert into task_puntoret values(14, 14, 14)
insert into task_puntoret values(15, 15, 11)
insert into task_puntoret values(16, 16, 12)
insert into task_puntoret values(17, 17, 12)
insert into task_puntoret values(18, 18, 11)
insert into task_puntoret values(19, 19, 14)
insert into task_puntoret values(20, 20, 13)
insert into task_puntoret values(21, 21, 7)
insert into task_puntoret values(22, 22, 11)
insert into task_puntoret values(23, 23, 13)
insert into task_puntoret values(24, 24, 12)
insert into task_puntoret values(25, 25, 14)
insert into task_puntoret values(26, 26, 14)
insert into task_puntoret values(27, 27, 8)
insert into task_puntoret values(28, 28, 9)
insert into task_puntoret values(29, 29, 10)
insert into task_puntoret values(30, 30, 3)

insert into Familjet values(1,null, null, null, null, null, 1)
insert into Familjet values(2,'mbiemri', 'rruga', 'qyteti', 12345, 048123456, 2)
insert into Familjet values(3,null, null, null, 12345, 048123456, 3)
insert into Familjet values(4,'mbiemri', null, null, null, 048123456, 4)
insert into Familjet values(5,null, 'rruga', 'qyteti', 12345, null, 5)
insert into Familjet values(6,'mbiemri', null, null, 12345, 048123456, 6)
insert into Familjet values(7,null, null, null, null, 048123456, 7)
insert into Familjet values(8,'mbiemri', 'rruga', 'qyteti', 12345, 048123456, 8)
insert into Familjet values(9,null, null, null, 12345, null, 9)
insert into Familjet values(10,'mbiemri', null, null, null, 048123456, 10)
insert into Familjet values(11,null, 'rruga', null, 12345, 048123456, 11)
insert into Familjet values(12,'mbiemri', null, 'Rahovec', 12345, 048123456, 12)
insert into Familjet values(13,null, null, null, null, null, 13)
insert into Familjet values(14,'mbiemri', 'rruga', null, 'rruga', 048123456, 14)

/*
Perdorimi i UPDATE
*/
--Update daten e kontrates
update puntoret
set p_updated_at = '2022/01/09'

--Update location zyres prej fushkosove ne prishtine me kthy.
update zyret
set location = 'Prishtin'
where location = 'Fushe Kosov'

--Update taskat e puntorit 1 te puntori 2.
update task_puntoret
set puntor_id = 2
where puntor_id = 1

--Update gjdo qmim te faturat per 5%.
update faturat
set f_qmimi = f_qmimi * 1.05

--Update location New York dhe Munich ne null.
update zyret
set location = null
where location = 'New York' OR location = 'Munich'

--Update platformen e projektit nga 1 ne 2.
update project_platformat
set platform_id = '2'
where platform_id = '1' AND project_id = 6

--Update projektin qe nuk e ka platformen e caktuar ne platformen e deshiruar qe ne rastin tone 4.
update project_platformat
set platform_id = '4'
where NOT platform_id = '1' AND project_id = 1 

--Update faturat ne cmimin e caktuar 200 dmth i bon 0.
update faturat
set f_qmimi = 0.00
where f_qmimi <= 200.00

--Update password qe emri i fillon me shkronjen e caktuar 'T'.
update puntoret
set p_password = 'tigran124'
where p_name LIKE 'T%'

--Update qytetin e puntoreve ku qyteti i tyre permban teksin e caktuar
update puntoret
set p_qyteti = 'Rahovec'
where p_qyteti Like 'Prishti_'

--Update faturat /2 qe e kan qmimin 200 deri 1000.
update faturat
set f_qmimi /= 2
where f_qmimi between 200.00 and 1000.00

--Update mbiemrin e familjes me puntor id e caktun.
update Familjet 
set f_mbiemri = 'Avdullahu'
where puntor_id = 1

--Update daten e perfundimit te projektit te caktuar.
update projectet
set data_perfundimit = '2022/01/10'
where p_id = 1

--Update description e fatures me projekt id dhe klient id e dhene.
update faturat
set faturat_description = 'LOREM IPSUM'
where project_id = 1 AND klient_id = 1

--Update klientet me id 1 me mbiemrin e dhene.
update klientet
set k_mbiemri = 'Gashi'
where k_id = 1

--Update tasks description me id e dhene.
update Tasks
set t_description = 'LOREM IPSUM'
where t_id = 3

--Update te zyra me id 1 e vendosim puntorin me id 2.
update zyret_puntor
set puntor_id = 2
where zyre_id = 1

--Update project me id 3 e vendosim daten e fillimit te dhene.
update projectet
set data_fillimit = '2020/02/20'
where p_id = 3

--Update qyteti i puntoreve me emrin dhe mbiemrin e dhene.
update puntoret
set p_qyteti = 'Rahovec'
where p_name = 'Agon' AND p_surname = 'Avdullahu'

--Update qmimi i faturave me qmim me te vogel se 100.
update faturat
set f_qmimi = 100.00
where f_qmimi < 100.00

/*
Perdorimi i Delete
*/

--Delete tasket me task id 1.
delete
from task_puntoret
where task_id = 1

--Delete familjet me mbiemrin Avdullahu.
delete 
from Familjet 
where f_mbiemri = 'Avdullahu'

--Delete faturat kur qmimin e kane me te vogel se 500 dhe me te madh se 100.
delete 
from faturat 
where f_qmimi < 500.00 AND f_qmimi > 100.00

--Delete nga project_platforma ku platform_id eshte 1 ose project_id eshte 1.
delete from project_platformat
where platform_id = 1 OR project_id = 1

--Delete nga platforma_puntor ku platform_id eshte 1 dhe puntor_id eshte 1.
delete from platformat_puntor
where platform_id = 1 AND puntor_id = 1

--Delete nga zyret_puntor ku zyre_id fillon me 1
delete from zyret_puntor
where zyre_id LIKE '1_'

--Delete nga faturat ku faturat_description permban 'LOREM'.
delete from faturat
where faturat_description LIKE 'LOREM%'

--Delete faturat kur qmimi kur modulohet me 8 mbetja eshte 4.
delete from faturat
where CAST(f_qmimi as INT)% 8 = 4

--Delete familjet kur zip_kodi eshte 12345 dhe nr_tel eshte 048123456.
delete from  Familjet
where f_zip_kodi = 12345 AND f_nr_tel = 048123456

--Delete familjet kur qyteti eshte Rahovec
delete from Familjet
where f_qyteti = 'Rahovec'





--DML- përdorimi i të gjitha komandave të mësuara deri me tani.
--Pjesa e trete


/*
Agon Avdullahu:1,3,5,7
Tigran Gashi:2,4,6,8
*/

/*
8 query të thjeshta vetëm me një relacion (tabelë).
*/

--1.Ky query kthen puntoret qe jane nga qyteti i Rahovecit
Select p_id, p_name, p_surname, p_email, p_password, p_qyteti
From puntoret 
Where  p_qyteti = 'Rahovec'

--2.Ky query kthen projektet qe jane para dates '2022-01-01'.
Select * 
From projectet 
Where data_fillimit < '2022-01-01'

--3.Ky query kthen shumen e parave qe ka te paguaj klienti caktum.
Select sum(faturat.f_qmimi) as agregateSUM 
From faturat 
Where faturat.klient_id = 4

--4.Ky query kthen taskat ne boarderin e caktuar.
Select * 
From Tasks 
Where boarder_id = 3

--5.Ky query kthen id e projektit dhe platformen qe nuk jane vlera te caktuara.
Select project_platformat.project_id, project_platformat.platform_id
From project_platformat 
Where not project_platformat.platform_id = 1 and not project_platformat.platform_id = 2

--6.Ky query kthen,numeron sa puntor punojn ne zyre.
Select count(zyret_puntor.puntor_id)[Puntoret], zyret_puntor.zyre_id
From zyret_puntor
Group by zyret_puntor.zyre_id
Having count (zyret_puntor.zyre_id) > 1
order by zyret_puntor.zyre_id asc;

--7.Ky query kthen projektet qe punon puntori caktuar.
Select project_puntor.project_id 
From project_puntor 
Where puntor_id = 1

--8.Ky query kthen cmimin mesatar nga faturat.
SELECT AVG(faturat.f_qmimi)[Qmimi mesatar]
FROM faturat;


/*
Agon Avdullahu:2,4,6,8
Tigran Gashi:1,3,5,7
*/

/*
8 query të thjeshta në minimum dy relacione(tabela) e më tepër.
*/

--1.Ky query kthen puntoret dhe cilat projekte menagjojne ata.
Select puntoret.p_id, puntoret.p_name, projectet.p_id, projectet.name
From puntoret left outer join projectet
On puntoret.p_id = projectet.project_manager_id

--2.Ky query kthen projekt menagjeret dhe projektet qe punojn projekt ata.
Select  p_name, p_surname, p_email, p_password, p_qyteti, pr.p_id [project ID], project_manager_id 
From puntoret p right outer join projectet pr
on pr.project_manager_id = p.p_id  

--3.Ky query kthen projektet qe zhvillohen ne platformen e dhene,
Select distinct p_id ,p.name, p.data_fillimit, p.data_perfundimit, pl.platform_id 
From projectet p inner join project_platformat pl
on pl.platform_id = '3' AND pl.project_id = p.p_id

--4.Ky query kthen projektet,faturat dhe cmimin e tyre.
Select projectet.p_id,projectet.name, faturat.f_id, faturat.f_qmimi
From projectet
full JOIN faturat
on projectet.p_id = faturat.project_id
order by f_qmimi DESC;

--5.Ky query kthen pagesen qe kajn per te kthyer klinentet e ndryshem.
Select  f.f_id, f.f_qmimi, f.klient_id, f.faturat_description, pr.p_id [project ID], project_manager_id 
From faturat f left outer join projectet pr
on pr.p_id = f.project_id 

--6.Ky query kthen taskat dhe bordet ne te cilat gjinden gjithashtu edhe projektet.
Select distinct t_id, t_description, b.id, b.project_id
From Tasks t inner join boardet b
on t.boarder_id = b.id

--7.Ky query kthen puntoret ne cilat zyra punojn.
Select distinct zyre_id, puntor_id
From zyret_puntor inner join zyret
on zyre_id = zyret.z_id

--8.Ky query kthen klinetet,projektin e klienteve dhe qmimin e projektit ne fjale.
Select f_id, f_qmimi, klient_id, f.project_id
From faturat f left outer join klientet k
on f.klient_id = k_id
order by f_qmimi asc


/*
Agon Avdullahu:1,3,5,7
Tigran Gashi:2,4,6,8
*/

/*
8 query të avancuara në minimum dy relacione (tabela) e më tepër.
*/

--1 Ky query i avancuar kthen detajet e nje projekti ku qmimi i tyre eshte me i vogel se 500.
Select p.p_id, f.f_id, f.f_qmimi, k_id 
From klientet k inner join faturat f
on k.k_id = f.klient_id
right join projectet p
on p.p_id = f.project_id
Where f.f_qmimi < 500

--2 Ky query i avancuar kthen taskat dhe vendet ku gjenden ato
Select t.t_id, t.t_description, t.boarder_id, p.p_id
From Tasks t inner join boardet b
on t.boarder_id = b.id
inner join projectet p 
on p.p_id = b.project_id

--3 Ky query i avancuar kthen puntoret dhe ne cilat projekte punojne ata.
Select p.p_id, p.p_name, p.p_surname, pr.p_id [Project ID], pr.name [Project Name]
From puntoret p join project_puntor pp
on p.p_id = pp.puntor_id
join projectet pr
on pr.p_id = pp.project_id
order by p.p_id ASC

--4 Ky query i avancuar kthen se cilat tasks jane te vendosur te cili puntor.
Select t.t_id, t.t_description, p.p_id [Puntor ID]
From Tasks t inner join task_puntoret tp
on t.t_id = tp.task_id
inner join puntoret p 
on p.p_id = tp.puntor_id
order by p.p_id ASC

--5 Ky query i avancuar kthen se gjdo puntor sa taska i ka
Select p.p_id [Puntor ID], count(t.t_id) [nr taskave]
From Tasks t inner join task_puntoret tp
on t.t_id = tp.task_id
inner join puntoret p 
on p.p_id = tp.puntor_id
group by p.p_id
order by p.p_id

--6 Ky query i avancuar kthen projektet,projekt menagjerin dhe platformen e atij projekti
Select p.p_id, p.name, p.project_manager_id, pp.platform_id
From projectet p inner join project_platformat pp
on p.p_id = pp.project_id
full outer join platformat pl
on pp.platform_id = pl.id
order by  p.p_id asc

--7 Ky query i avancuar kthen detajet e projektit dhe klientit.
Select *
From klientet k inner Join projectet p
on k.project_id = p.p_id 
Right join faturat f
on p.p_id = f.project_id
Where p.name = 'name' 

--8 Ky query i avancuar kthen puntoret se ne cilet projekte punojn ata.
Select p.p_name, pr.name, pr.p_id
From puntoret p left Join  project_puntor pp
on p.p_id = pp.puntor_id
Full Outer Join  projectet pr
on pr.p_id = pp.project_id



/*
Agon Avdullahu:2,4,6,8
Tigran Gashi:1,3,5,7
*/

/*
8 subquery të thjeshta.
*/

--1 Ky subquery kthen faturat ku qmimi i tyre eshte me i madh se qmimi mesatr i te gjitha faturave.
Select * 
From faturat
Where faturat.f_qmimi > (select AVG(f_qmimi) from faturat) 
order by f_qmimi ASC

--2 Ky subquery kthen puntoret ku qyteti tyre eshte i njejt me zyret me id e dhene.
Select p_id, p_name, p_surname, p_qyteti,p_rruga
From puntoret 
Where puntoret.p_qyteti = (select zyret.location from zyret where zyret.z_id = 1 )

--3 Ky subquery kthen klientet me id te barabarart me id e klientave te fatures se projektit me id e dhene
Select * 
From klientet 
Where klientet.k_id = (select faturat.klient_id from faturat where faturat.project_id = 10)

--4 Ky subquery kthen taskat ne bordet me id e dhene.
Select t_id, t_description 
From Tasks 
Where Tasks.boarder_id = (select boardet.id from boardet where boardet.id = 10)

--5 Ky subquery kthen bordet ne projectet me id e dhene.
Select * 
From boardet 
Where boardet.project_id = (select projectet.p_id from projectet where p_id = 1) 
										
--6 Ky subquery kthen zyret me numrin e puntoreve te njejte me numrin e puntoreve te zyres se dhene.									
Select count(zyret_puntor.puntor_id) [numriPuntoreve], zyret_puntor.zyre_id
From zyret_puntor
Group by zyret_puntor.zyre_id
having count(zyret_puntor.puntor_id) = (select count(zyret_puntor.puntor_id) 
										from zyret_puntor where zyre_id = 4)
                                        order by zyret_puntor.zyre_id asc;


--7 Ky subquery kthen platformat e projektit te caktuar.								
Select project_platformat.platform_id, project_platformat.project_id 
From project_platformat
Where project_platformat.project_id in (
										select project_id	
										from projectet 
										where project_id = 2 )

--8	Ky subquery kthen projektit qe krijohen ne dy platforma te ndryshme								
Select distinct projectet.p_id, projectet.name from projectet, project_platformat
Where projectet.p_id in (
						select project_platformat.project_id 
						from project_platformat 
						group by project_platformat.project_id 
						having count(project_platformat.id) = 2 )
						


/*
Agon Avdullahu:1,3,5,7
Tigran Gashi:2,4,6,8
*/

/*
8 subquery të avancuara (min. 1 subquery në klauzolën SELECT, dhe min. 1 subquery ne klauzolën FROM)
*/

--1 Ky subquery i avansuar kthen faturat me qmim me te madh se qmimi mesatar i te gjitha faturave.
Select f.f_qmimi , p.name
From projectet p join faturat f
on p.p_id = f.project_id
Where f.f_qmimi >Any (Select AVG(f.f_qmimi)
                   From faturat f inner Join projectet p
				   on f.project_id = p.p_id)
order by f.f_qmimi desc

--2 Ky subquery i avansuar kthen puntoret qe punojne ne platformen 1.
Select p.p_id ,p.p_name, pp.platform_id
From puntoret p join platformat_puntor pp
on p.p_id = pp.puntor_id
Where pp.platform_id = (Select p.id
                   From platformat p
				   where p.id = 1)
order by p.p_id asc

--3
Select p.p_id, p.p_name, tp.task_id
From puntoret p Right Join task_puntoret tp
on p.p_id = tp.puntor_id
Group by p.p_id, p.p_name, tp.task_id 
Having count(tp.task_id) in (Select t.t_id 
                              From Tasks t
							  group by t.t_id
							  Having Count(t.t_id) < 5)			  		  
order by p_id asc

--4 Ky subquery i avansuar kthen puntoret ne zyren e caktuar.
Select p.p_id, p.p_name, p.p_qyteti, zp.zyre_id
From puntoret p Full Outer Join zyret_puntor zp
on p.p_id = zp.id
Where zp.zyre_id =(Select z.z_id
                From Zyret z
				Where z.location = 'Rahovec')

--5 Ky subquery i avansuar kthen taskat e puntoreve qe kane email null.
Select t.t_id, t.t_description, tp.puntor_id
From Tasks t Inner Join task_puntoret tp
on t.t_id = tp.task_id
Where tp.puntor_id in (Select distinct p.p_id
                              From  puntoret p             
							  Where p.p_email is null)

--6 Ky subquery i avansuar kthen projektet dhe qmimet e tyre
Select  p.p_id, p.name, f.f_qmimi
From projectet p Join faturat f
on p.p_id = f.project_id
Where EXISTS
             (Select project_id, count(f_qmimi)
			  From faturat
			  Group by project_id)
Order by p.p_id


--7 Ky subquery i avansuar kthen task e puntoreve qe id nuk e kan mes 5 dhe 10.
Select p.p_id, p.p_name, tk.task_id
From puntoret p INNER Join task_puntoret tk
               On p.p_id = tk.puntor_id
			   Where p.p_id  Not in
			         (Select tk.puntor_id
					  From task_puntoret
					  Where tk.puntor_id between 5 and 10)
Order by tk.puntor_id


--8 Ky subquery i avansuar kthen puntoret e id ne zyren e caktuar.
Select p.p_id ,p.p_name, zp.zyre_id
From puntoret p join zyret_puntor zp
on p.p_id = zp.puntor_id
Where zp.zyre_id = (Select z.z_id
                   From zyret z
				   where z.z_id = 2)
order by p.p_id asc



/*
Agon Avdullahu:2,4,6,8
Tigran Gashi:1,3,5,7
*/

/*
8 query/subquery.Duke përdorur operacionet e algjebrës relacionale (Union, Prerja, diferenca, etj.)
*/

--1
π AVG (f_qmimi)
 γ AVG (f_qmimi) faturat

--2
 π project_platformat . project_id, project_platformat . platform_id
 σ NOT (project_platformat . platform_id = 1)AND NOT (project_platformat . platform_id = 2) project_platformat

--3
 π p_id, p_name, p_surname, p_email, p_password, p_qyteti
 σ p_qyteti = "Rahovec" puntoret

--4
 σ data_fillimit < "2022-01-01" projectet

--5
 π SUM (f_qmimi) → agregatesum
 γ SUM (f_qmimi)
  σ faturat . klient_id = 4 faturat

--6
  σ boarder_id = 3 tasks

--7
  τ zyret_puntor . zyre_id
 σ zyret_puntor . zyre_id > 1
  γ zyre_id, COUNT (puntor_id) zyret_puntor

--8
  π p_id, p_name, p_email, p_password puntoret



/*
Agon Avdullahu:1,3,5,7
Tigran Gashi:2,4,6,8
*/

/*
8 Proceduara të ruajtura (Stored Procedure).
*/

--1 Kjo procedur kthen puntoret dhe zyret ku punojne ata.
create procedure proc1
@Emri varchar(20) output,
@Zyra int output
as 
Begin
Select distinct p.p_id, p.p_email, p.p_password, p.p_qyteti, z.zyre_id
from puntoret p, zyret_puntor z
where p_id = z.puntor_id
end

Declare @Emri varchar, @Zyra int
exec proc1
@Emri out,
@Zyra out


drop procedure proc1


--2 Kjo procedur kthen projektet dhe paltformat e tyre.
create procedure proc2
@Emri varchar(20) output,
@Platforma int output
as 
Begin
Select distinct p.p_id, p.name, p.project_manager_id, pp.platform_id
from projectet p, project_platformat pp
where p_id = pp.project_id
order by p.p_id
end

Declare @Emri varchar, @Platforma int
exec proc2
@Emri out,
@Platforma out

drop procedure proc2 


--3 Kjo procedur kthen projektin e caktuar dhe platformat e atij projekti.
create procedure proc3
@Platforma int output
as 
Begin
Select distinct pp.platform_id, pp.project_id
from project_platformat pp
where pp.project_id = 1

end

Declare @Platforma int
exec proc3
@Platforma out

drop procedure proc3 

--4 Kjo procedur kthen puntoret ne qytetin ose zip kodin e dhene
create PROCEDURE proc4
@myQyteti char(30),
@KodiPostar varchar (10)
AS
BEGIN
SET NOCOUNT ON
SELECT p.p_qyteti, p.p_zip_kodi, p.p_name, p.p_surname
FROM puntoret p
WHERE p.p_qyteti=@myQyteti OR p.p_zip_kodi=@KodiPostar
END

EXEC proc4 'Rahovec', 12345; 

drop procedure proc4

--5 Kjo procedur kthen se qfare puntori eshte ne baze te id se dhene.
create procedure proc5
(
@LLojiPuntorit char (2)
)
AS
BEGIN 
    if(@LLojiPuntorit = '1')
	BEGIN 
	
	Print 'Front End'
	END
	else
	if(@LLojiPuntorit = '2')
	BEGIN 
	
	Print 'Back End'
	END
	else print 'Project Manager'
	END

exec proc5 '1'

drop procedure proc5

--6 Kjo procedur kthen qfare type eshte puntori.
Create PROCEDURE proc6
(
@PuntorID int 
)

As
Begin
Select distinct p.p_id, p.p_type, p_type_name =(CASE
           when p.p_type = '1' then 'Front End'
		   when p.p_type = 'Nen 18' then 'BackEnd'
		   else 'Manager'
		   end)

from puntoret p
where @PuntorID = p.p_id
END

execute proc6 14
drop procedure proc6


--7 Kjo procedur kthen Rahoveci,Prishtina ose nga nje vend tjeter duke perdorur if varesisht nga inputi.
Create Proc proc7
        (
		 @Lokacioni char (2))
 AS
 Begin
    if(@Lokacioni = '1')
	BEGIN
	
	Print 'Eshte nga Rahoveci'
	  END
	  else
	  if(@Lokacioni = '2')
	BEGIN
	
	Print 'Eshte nga Prishtina'
	END
	else Print 'Nuk eshte nga Rahoveci ose Prishtina'
	END


Exec proc7 '1'

drop proc proc7


--8 Kjo procedur kthen Rahoveci,Prishtina ose nga nje vend tjeter duke perdorur switch varesisht nga inputi.
Create PROCEDURE proc8
(
@LokacioniID char(2) 
)

As
Begin
Select distinct z.zyre_id, LokacioniID =(CASE
           when z.zyre_id = '1' then 'Rahovec'
		   when z.zyre_id = 'Nen 18' then 'Prishtin'
		   else 'Nuk eshte nga Rahoveci ose Prishtina'
		   end)

from zyret_puntor z
where @LokacioniID = z.zyre_id
END

execute proc8 '1'

drop proc proc8