-- CRIA O BANCO DE DADOS
create database db_cidade_das_frutas;

-- CRIA AS TABELAS
create table tb_categoria(
	id int(1) auto_increment,
    categoria varchar(20) not null,
    
    primary key(id)
) engine = InnoDB;

create table tb_produto(
	id_fruta int(4) not null,
    nome varchar(20) not null,
    tamanho varchar(20) not null check (tamanho in ("PEQUENA","MEDIA","GRANDE")),
    qtd_estoque int(5) not null,
    
    id int(1) not null,
    foreign key(id) references tb_categoria(id),
    
    primary key(id_fruta)
) engine = InnoDB;

-- Populando a tabela Categoria com até 5 dados.
insert into tb_categoria(categoria) values ("EXTRA");
insert into tb_categoria(categoria) values ("DE PRIMEIRA");
insert into tb_categoria(categoria) values ("DE SEGUNDA");
insert into tb_categoria(categoria) values ("DE TERCEIRA");

select * from tb_categoria;

-- Populando a tabela Produto com até 8 dados.
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (362, "MAÇÃ","PEQUENA",300,1);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (121, "BANANA DA TERRA","MEDIA",120,2);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (754, "ABACATE","PEQUENA",80,1);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (160, "MELANCIA","GRANDE",200,2);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (301, "PERAS","PEQUENA",120,3);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (248, "LARANJA","PEQUENA",600,4);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (111, "JACA","GRANDE",65,3);
insert into tb_produto(id_fruta, nome, tamanho, qtd_estoque, id) 
	values (800, "MORANGO","PEQUENA",435,2);
    
select * from tb_produto;

-- Select que retorna os Produtos com quantidade maior do que 200.
select * from tb_produto where qtd_estoque > 200;

-- Select utilizando LIKE buscando os Produtos com a letra C.
select * from tb_produto where nome like "%c%";

-- Select com Inner join entre  tabela categoria e produto.
select * from tb_produto inner join tb_categoria on tb_produto.id = tb_categoria.id;

-- Select trazendo todos os Produtos de uma categoria específica
select * from tb_produto inner join tb_categoria on tb_produto.id = tb_categoria.id
	where tb_produto.tamanho = "GRANDE";