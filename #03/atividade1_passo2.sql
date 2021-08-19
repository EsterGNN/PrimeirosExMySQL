use gerenciamento_rh;

create table funcionaries(
	id bigint(5) auto_increment,
    nome varchar(50) not null,
    cpf varchar(10) not null,
    turno_trabalho varchar(5) not null, -- manha/tarde/noite
    salario decimal(10,2) not null,
    
    primary key(id)
);