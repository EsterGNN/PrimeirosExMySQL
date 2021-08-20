-- CRIA O BANCO DE DADOS
create database db_farmacia_do_bem;

-- CRIA AS TABELAS
create table tb_categoria(
	id int(4) not null,
    tarja varchar(12) not null check (tarja ("SEM TARJA","AMARELA","VERMELHA","PRETA")),
    
    primary key(id)
) engine = InnoDB;

create table tb_produto(
	id_produto int(4) not null,
    nome varchar(30) not null,
    disponivel_para_venda boolean not null,
    qtd_estoque int(4) not null,
    valor decimal(7,2) not null,
    
    id int(4) not null,
    foreign key(id) references tb_categoria(id),
    
    primary key(id_produto)
) engine = InnoDB;

-- Populando a tabela Categoria com até 5 dados.
insert into tb_categoria(id, tarja) values (1, "SEM TARJA");
insert into tb_categoria(id, tarja) values (2, "AMARELA");
insert into tb_categoria(id, tarja) values (3, "VERMELHA");
insert into tb_categoria(id, tarja) values (4, "PRETA");

select * from tb_categoria;

-- Populando a tabela Produto com até 8 dados.
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (255, "NEOSALDINA", true, 500, 25.55,1);
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (125, "DIPIRONA SÓDICA", true, 350, 6.19, 1);
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (132, "AMOXICILINAA", true, 100, 65.43, 2);
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (478, "PIROXICAM", true, 50, 11.43, 2);
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (301, "GLIFAGE XR", true, 42, 31.43, 3);
insert into tb_produto(id_produto, nome, disponivel_para_venda, qtd_estoque, valor, id) 
	values (222, "RIVOTRIL", true, 150, 21.04, 4);

select * from tb_produto;

-- Select que retorna os Produtos com o valor maior do que 50 reais.
select * from tb_produto where valor > 50;

-- Select trazendo  os Produtos com valor entre 3 e 60 reais.
select * from tb_produto where valor > 3 and valor < 60;

-- Select  utilizando LIKE buscando os Produtos com a letra B.
select * from tb_produto where nome like "%B%";

-- Select com Inner join entre  tabela categoria e produto.
select * from tb_produto inner join tb_categoria on tb_produto.id = tb_categoria.id;

-- Select trazendo todos os Produtos de uma categoria específica.
select * from tb_produto inner join tb_categoria on tb_produto.id = tb_categoria.id
	where tb_categoria.id = 2;