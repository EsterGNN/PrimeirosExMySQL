-- CRIA O BANCO DE DADOS 
create database db_pizzaria_legal;

-- CRIA AS TABAELAS
create table tb_categoria(
	id_categoria int(3) not null,
    categoria varchar(15) not null check (categoria in ("BROTINHO","PEQUENA","MEDIA","GRANDE")),
    fatias int(2),
    
    primary key(id_categoria)
) engine = InnoDB;

create table tb_pizza(
	id_pizza int(3) not null,
	nome varchar(30) not null,
    valor decimal(10,2) not null,
    vegetariana boolean not null,
    aceita_pedido boolean not null,
    
    id_categoria int(3) not null,
    foreign key (id_categoria) references tb_categoria(id_categoria),
    
    primary key(id_pizza)
) engine = InnoDB;

-- Populando a tabela categoria com até 5 dados.
insert into tb_categoria(id_categoria, categoria, fatias) values (1,"BROTINHO",4);
insert into tb_categoria(id_categoria, categoria, fatias) values (2,"PEQUENA",6);
insert into tb_categoria(id_categoria, categoria, fatias) values (3,"MEDIA",8);
insert into tb_categoria(id_categoria, categoria, fatias) values (4,"GRANDE",10);

select * from tb_categoria;

-- Populando a tabela pizza com até 8 dados.
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (26, "MUSSARELA", 20.00, false, true, 2);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (14, "BRÓCOLIS & TOFU", 35.00, true, true, 4);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (46, "MUSSARELA", 30.00, false, true, 4);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (18, "BRÓCOLIS COM CATUPIRY VEGGIE", 30.00, true, true, 4);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (32, "COUVE COM CATUPIRY VEGGIE", 30.00, true, true, 3);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (12, "COUVE COM CATUPIRY VEGGIE", 20.00, true, true, 1);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (30, "BRÓCOLIS COM MUSSARELA", 30.00, false, true, 3);
insert into tb_pizza(id_pizza, nome, valor, vegetariana, aceita_pedido, id_categoria) 
	values (20, "BRÓCOLIS COM MUSSARELA", 35.00, false, true, 4);

select * from tb_pizza;

-- Select retornando os Produtos com o valor maior do que 45 reais.
select * from tb_pizza where valor > 45;

-- Select trazendo os Produtos com valor entre 29 e 60 reais.
select * from tb_pizza where valor > 29 and valor < 60;

-- Select  utilizando LIKE buscando os Produtos com a letra C.
select * from tb_pizza where nome like "%c%";

-- Select com Inner join entre tabelas categoria e pizza.
select * from tb_pizza inner join tb_categoria on tb_pizza.id_categoria = tb_categoria.id_categoria;

-- Select trazendo todos os Produtos de uma categoria específica
select * from tb_pizza inner join tb_categoria on tb_pizza.id_categoria = tb_categoria.id_categoria
	where tb_pizza.id_categoria = 2;


