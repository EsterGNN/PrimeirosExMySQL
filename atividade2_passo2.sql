use ecommerce;

create table produtos(
	codigo bigint(4) auto_increment,
    nome varchar(20) not null,
    preco decimal(10,2) not null,
    qtd_estoque bigint(5),
    tem_no_estoque boolean not null,
    
    primary key(codigo)
);