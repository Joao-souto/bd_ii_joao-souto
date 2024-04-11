show databases; --  o sistema retorna uma lista de todos os bancos de dados existentes
drop database if exists pizzaria; -- apaga banco de dados se existir
create database pizzaria;
USE pizzaria;

create table clientes(
    cod_cliente int not null,
    nome varchar(50),
    cep char(8),
    endereco varchar(50),
    telefone varchar(20),
    email varchar (30),
    primary key (cod_cliente)
);

create table pizzas(
    cod_pizza int not null,
    nome varchar(50),
    vegana boolean,
    ingredientes varchar(150),
    primary key (cod_pizza)
);

create table fornecedores(
    cnpj char(14) not null,
    pizza_fornecida int,
    fornecedor varchar(20),
    telefone varchar(20),
    email varchar(30),
    primary key (cnpj),
    foreign key (pizza_fornecida) references pizzas (cod_pizza)
);

create table funcionarios(
    cod_funcionario int not null,
    nome varchar(50),
    cpf  char(11),
    rg varchar(10),
    cep char(8),
    endereco varchar(50),
    telefone varchar(20),
    email varchar (30),
    primary key (cod_funcionario)
);

create table pedidos(
    cod_pedido int,
    cod_cliente int,
    cod_pizza int,
    quant_pizzas int,
    data varchar(20),
    primary key (cod_pedido),
    foreign key (cod_cliente) references clientes (cod_cliente),
    foreign key (cod_pizza) references pizzas (cod_pizza)
);

insert into clientes
(
cod_cliente, nome, cep, endereco, telefone, email
)
values
(1,'João',"01515000",'Rua 121233',"11976535190",'adriano123@outlook.com'),
(2,'Adriano',"01515000",'Rua 121233',"11976535190",'adriano123@outlook.com'),
(3,'Marcelo',"01515000",'Rua 112312323',"11976535178",'lordeceluis@gmail.com'),
(4,'Larissa',"01515000",'Rua 1afdg23',"11976535177",'larissinha0@outlook.com'),
(5,'Pedro',"01515000",'Rua 12dsfgsdf3',"11976535148",'pedroca0@outlook.com');

insert into funcionarios
(
cod_funcionario, nome, cpf, rg, cep, endereco, telefone, email
)
values
(1,'João Santos Monteiro', "50032824732","64988954-1", "01515000",'Rua 121233',"11976535190",'joao@outlook.com'),
(2,'Carlos Monteiro', "50032824732","64988954-1", "01515000",'Rua 121233',"11976535190",'carlos@outlook.com'),
(3,'Henrique Santos', "50032824732","64988954-1", "01515000",'Rua 121233',"11976535190",'henrique@outlook.com'),
(4,'Gielly Souza Monteiro', "50032824732","64988954-1", "01515000",'Rua 121233',"11976535190",'gigi@outlook.com'),
(5,'Junior Monteiro', "50032824732","64988954-1", "01515000",'Rua 121233',"11976535190",'junin@outlook.com');

insert into pizzas
(
cod_pizza, nome, vegana, ingredientes
)
values
(1,'Margherita',true,'Molho de tomate, mussarela (ou queijo vegano), manjericão fresco.'),
(2,'Pepperoni',false,'Molho de tomate, queijo mussarela (ou queijo vegano), pepperoni (salame).'),
(3,'Vegetariana',false,'Molho de tomate, queijo mussarela, variedade de vegetais como pimentão, cogumelos, cebola, azeitonas, etc.'),
(4,'Vegana',true,'Molho de tomate, queijo vegano, variedade de vegetais como pimentão, cogumelos, cebola, azeitonas, etc.'),
(5,'Quatro Queijos',false,'Molho de tomate, queijos diversos como mussarela, gorgonzola, parmesão, provolone (ou suas versões veganas).'),
(6,'Quatro Queijos Vegano',true,'Molho de tomate, queijos diversos como mussarela, gorgonzola, parmesão, provolone (suas versões veganas).');

insert into fornecedores 
(
cnpj, pizza_fornecida, fornecedor, telefone, email
)
values
('04743646000159',1,'Compre Aqui',"11976535190",'adriano123@outlook.com'),
('04743636000155',2,'Atacadão',"11976535190",'adriano123@outlook.com');
