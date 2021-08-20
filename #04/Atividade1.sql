-- CRIA O BANCO DE DADOS
create database db_generation_game_online;

-- CRIA AS TABELAS
 create table  tb_classe(
	id_classe int(12) not null,
    classe varchar(10) not null check (classe in ("ANTIGOS", "NOVOS","FUTUROS")),
    ativo boolean not null,
    
    primary key(id_classe)
 )engine = InnoDB;
 
 create table tb_personagem(
	id_personagem int(12) not null,
    nome varchar(60) not null,
    intensidade_poder_ataque int(6) not null,
    intensidade_poder_defesa int(6) not null,
    nivel_para_jogada varchar(10) not null check (classe in ("INICIANTE", "MEDIANO","AVANÇADO")),
    
    id_classe int(12) not null,
    foreign key(id_classe) references tb_classe(id_classe),
    
    primary key(id_personagem)
 ) engine = InnoDB;
 
-- Populando a tabela classe com até 5 dados.
insert into tb_classe(id_classe, classe, ativo) values(11,"ANTIGOS",true);
insert into tb_classe(id_classe, classe, ativo) values(12,"ANTIGOS",false);
insert into tb_classe(id_classe, classe, ativo) values(21,"NOVOS",true);
insert into tb_classe(id_classe, classe, ativo) values(22,"NOVOS",false);
insert into tb_classe(id_classe, classe, ativo) values(30,"FUTUROS",false);

select * from tb_classe;

-- Popule esta tabela personagem com até 8 dados.
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(2323,"James Kirk", 1200, 3000, "MEDIANO", 11);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(4114,"Catherine Janeway", 5000, 3000, "AVANÇADO", 21);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(5002,"Uhura", 1800, 5000, "AVANÇADO", 30);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(7890,"Ikaru Sulu", 3000, 1000, "AVANÇADO", 22);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(1234,"Tuvok", 4000, 1800, "MEDIANO", 12);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(4567,"Jhony", 1000, 5000, "MEDIANO", 11);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(1001,"Sasha", 1800, 6000, "AVANÇADO", 30);
insert into tb_personagem(id_personagem, nome, intensidade_poder_ataque, intensidade_poder_defesa, nivel_para_jogada, id_classe) 
	values(2442,"Price", 3000, 4000, "MEDIANO", 11);

select * from tb_personagem;

-- Select retornando os personagens com o poder de ataque maior do que 2000.
select * from tb_personagem where intensidade_poder_ataque > 2000;

-- Select trazendo os personagens com poder de defesa entre 1000 e 2000.
select * from tb_personagem where intensidade_poder_defesa > 1000 and intensidade_poder_defesa < 2000;

-- Select  utilizando LIKE buscando os personagens com a letra C.
select * from tb_personagem where nome Like "%c%";

-- Select com Inner join entre  tabela classe e personagem
select * from tb_personagem inner join tb_classe on tb_personagem.id_classe = tb_classe.id_classe;

-- Select com todos os personagem de uma classe específica
select * from tb_personagem inner join tb_classe on tb_personagem.id_classe = tb_classe.id_classe
	where tb_personagem.id_classe = 30;
    