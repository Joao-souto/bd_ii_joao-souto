SET @db_exists := (SELECT COUNT(*) FROM information_schema.SCHEMATA WHERE SCHEMA_NAME = 'pizzaria');
 --declaração de uma variável que vai armazenar a quantidade de linhas do banco
 -- COUNT(*) é uma função de agregação que conta o número de linhas retornadas pela consulta.
 -- "information_schema.SCHEMATA" é uma exibição do sistema que contém informações sobre todos os bancos de dados no servidor
 -- "WHERE" condição para armazenar na variável a quantidade de linhas desse banco

IF @db_exists > 0
BEGIN
    DROP DATABASE pizzaria;
END;

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
    cnpj int not null,
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
    data varchar(20),
    primary key (cod_pedido),
    foreign key (cod_cliente) references clientes (cod_cliente),
    foreign key (cod_pizza) references pizzas (cod_pizza)
);
