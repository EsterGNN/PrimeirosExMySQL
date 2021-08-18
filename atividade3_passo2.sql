use registro_escola;

create table estudantes(
	id bigint(8) auto_increment,
    nome varchar(50) not null,
    matricula bigint(15) not null,
    idade int(2),
    aula_presencial boolean,
    
    primary key(id)
);