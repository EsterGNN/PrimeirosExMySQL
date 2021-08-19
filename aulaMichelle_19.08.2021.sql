create database voo321;

use voo321; 
create table aviao (
	id_aviao int(12) not null,
    modelo varchar(50) not null,
    
    primary key (id_aviao)
) engine = InnoDB;

desc aviao;

show tables;

use voo321;
create table tripulantes(
	id_tripulacao int(12) not null,
    nome varchar(50) not null,
    genereo char(1) not null check (genero in ('F','M','N')),
    id_aviao int(12) not null, 
    
    foreign key (id_aviao) references aviao(id_aviao),
    
    primary key (id_tripulacao)
) engine = InnoDB;

desc tripulantes;

insert into aviao(id_aviao, modelo) values(1,'Zoom'), (2,'Boing'), (3,'Excelcior');
select * from aviao;

INSERT INTO tripulantes VALUES (16,'James Kirk','M',1);
INSERT INTO tripulantes VALUES (86, 'Catherine Janeway', 'F', 2);
INSERT INTO tripulantes VALUES (87, 'Uhura', 'F', 1);
INSERT INTO tripulantes VALUES (48, 'Ikaru Sulu', 'M', 3);
INSERT INTO tripulantes VALUES (52, 'Tuvok', 'M', 2);
INSERT INTO tripulantes VALUES (1,'Jhony','M',1);
INSERT INTO tripulantes VALUES (20, 'Sasha', 'N', 2);
INSERT INTO tripulantes VALUES (30, 'Uhura', 'F', 1);
INSERT INTO tripulantes VALUES (66, 'Price', 'N', 3);
INSERT INTO tripulantes VALUES (55, 'Taira', 'N', 2);
select * from tripulantes;

select * from tripulantes where genereo = 'F';

update tripulantes set genereo = 'N' where id_tripulacao = 87;

select * from tripulantes where genereo = 'F';