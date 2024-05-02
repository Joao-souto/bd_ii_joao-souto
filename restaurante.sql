-- João Pedro Monteiro Souto
show databases; --  o sistema retorna uma lista de todos os bancos de dados existentes
-- Criação do banco de dados 
CREATE DATABASE IF NOT EXISTS Restaurante; 
USE Restaurante; 

-- Tabela Clientes 

CREATE TABLE IF NOT EXISTS Clientes ( 

    ID_cliente INT AUTO_INCREMENT, 
    Nome VARCHAR(255), 
    CPF VARCHAR(11) NOT NULL,
    Endereco VARCHAR(255), 
    Email VARCHAR(255), 
    Telefone VARCHAR(12), 
    PRIMARY KEY (ID_cliente) 

); 
-- Tabela Funcionários 

CREATE TABLE IF NOT EXISTS Funcionarios ( 

    ID_funcionario INT AUTO_INCREMENT, 
    CPF VARCHAR(11) NOT NULL,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Email VARCHAR(255), 
    Telefone VARCHAR(12), 
    Salario DECIMAL(7,2), 
    PRIMARY KEY (ID_funcionario) 

); 
-- Tabela Pratos 

CREATE TABLE IF NOT EXISTS Pratos ( 

    ID_prato INT AUTO_INCREMENT, 
    Ingredientes VARCHAR(255), 
    Descricao VARCHAR(255), 
    Preco DECIMAL(5,2), 
    PRIMARY KEY (ID_prato) 

); 
-- Tabela Fornecedores 

CREATE TABLE IF NOT EXISTS Fornecedores ( 

    ID_fornecedor INT AUTO_INCREMENT, 
    CNPJ VARCHAR(14), 
    Email VARCHAR(255), 
    Telefone VARCHAR(12), 
    Valor_materia DECIMAL(8,2), 
    PRIMARY KEY (ID_fornecedor) 

); 
-- Tabela Reservas 

CREATE TABLE IF NOT EXISTS Reservas ( 

    Data_reserva DATETIME, 
    ID_cliente INT, 
    Mesa VARCHAR(2), 
    FOREIGN KEY (ID_cliente) REFERENCES Clientes (ID_cliente) 

); 
-- Tabela Estoque 

CREATE TABLE IF NOT EXISTS Estoque ( 
    ID_fornecedor INT, 
    ID_materia INT AUTO_INCREMENT, 
    Quantidade INT, 
    Qualidade DECIMAL(4,2), 
    PRIMARY KEY (ID_materia), 
    FOREIGN KEY (ID_fornecedor) REFERENCES Fornecedores (ID_fornecedor) 
); 
-- Tabela Filiais 

CREATE TABLE IF NOT EXISTS Filiais ( 

    ID_filial INT AUTO_INCREMENT, 
    Endereco VARCHAR(255), 
    Email VARCHAR(255), 
    Telefone VARCHAR(12), 
    Quant_mesas INT, 
    Avaliacao DECIMAL(4,2), 
    PRIMARY KEY (ID_filial) 
); 

-- Tabela Bebidas 

CREATE TABLE IF NOT EXISTS Bebidas ( 
    ID_bebida INT AUTO_INCREMENT, 
    Nome VARCHAR (255), 
    Descricao VARCHAR(255), 
    Valor DECIMAL(4,2), 
    PRIMARY KEY (ID_bebida) 
); 

-- Tabela Pedidos 

CREATE TABLE IF NOT EXISTS Pedidos ( 

    ID_pedido INT AUTO_INCREMENT, 
    ID_cliente INT, 
    ID_prato INT, 
    ID_bebida INT, 
    Preco DECIMAL(4,2), 
    Endereco VARCHAR(255), 
    PRIMARY KEY (ID_pedido), 
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente), 
    FOREIGN KEY (ID_prato) REFERENCES Pratos (ID_prato), 
    FOREIGN KEY (ID_bebida) REFERENCES Bebidas (ID_bebida) 

); 
-- Tabela Entregas 
CREATE TABLE IF NOT EXISTS Entregas ( 

    ID_entrega INT AUTO_INCREMENT, 
    Endereco VARCHAR(255), 
    ID_pedido INT, 
    Valor DECIMAL(6,2), 
    PRIMARY KEY (ID_entrega), 
    FOREIGN KEY (ID_pedido) REFERENCES Pedidos (ID_pedido) 

); 