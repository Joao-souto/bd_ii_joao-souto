DROP DATABASE IF EXISTS RESTAURANTE;

CREATE DATABASE RESTAURANTE;

USE RESTAURANTE;

-- Tabela de Filiais
CREATE TABLE FILIAIS (
    ID_FILIAL INT AUTO_INCREMENT,
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255),
    TELEFONE VARCHAR(12),
    QUANT_MESAS INT,
    AVALIACAO DECIMAL(4,2),
    PRIMARY KEY (ID_FILIAL)
);

-- Tabela de Clientes
CREATE TABLE CLIENTES (
    ID_CLIENTE INT AUTO_INCREMENT,
    CPF VARCHAR(14),
    NOME VARCHAR(255),
    SENHA VARCHAR(255),
    SEXO VARCHAR(10),
    IDADE INT,
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    TELEFONE VARCHAR(12),
    DATA_CADASTRO DATETIME,
    ID_FILIAL INT,
    PRIMARY KEY (ID_CLIENTE),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Funcionários
CREATE TABLE FUNCIONARIOS (
    ID_FUNC INT AUTO_INCREMENT,
    CPF VARCHAR(14),
    NOME VARCHAR(255),
    SEXO VARCHAR(10),
    IDADE INT,
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    TELEFONE VARCHAR(12),
    ID_FILIAL INT,
    CARGO VARCHAR(255),
    DATA_CONTATACAO DATETIME,
    PRIMARY KEY (ID_FUNC),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Reservas
CREATE TABLE RESERVAS (
    ID_RESERVA INT AUTO_INCREMENT,
    DATA_RESERVA DATETIME,
    ID_CLIENTE INT,
    MESA VARCHAR(10),
    ID_FILIAL INT,
    CAPACIDADE INT,
    PRIMARY KEY (ID_RESERVA),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Fornecedores
CREATE TABLE FORNECEDORES (
    ID_FORNECEDOR INT AUTO_INCREMENT,
    NOME VARCHAR(255),
    CNPJ VARCHAR(18) UNIQUE,
    TIPO_MATERIAL VARCHAR(255),
    EMAIL VARCHAR(255),
    TELEFONE VARCHAR(12),
    VALOR_MATERIAL DECIMAL(8,2),
    PRIMARY KEY (ID_FORNECEDOR)
);

-- Tabela de Pratos
CREATE TABLE PRATOS (
    ID_PRATO INT AUTO_INCREMENT,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(255),
    VALOR DECIMAL(5,2),
    PRIMARY KEY (ID_PRATO)
);

-- Tabela de Bebidas
CREATE TABLE BEBIDAS (
    ID_BEBIDA INT AUTO_INCREMENT,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(255),
    VALOR DECIMAL(4,2),
    PRIMARY KEY (ID_BEBIDA)
);

-- Tabela de Ingredientes
CREATE TABLE INGREDIENTES (
    ID_INGREDIENTE INT AUTO_INCREMENT,
    NOME VARCHAR(255),
    UNIDADE_MEDIDA VARCHAR(255),
    ID_PRATO INT,
    ID_BEBIDA INT,
    PRIMARY KEY (ID_INGREDIENTE),
    FOREIGN KEY (ID_PRATO) REFERENCES PRATOS(ID_PRATO),
    FOREIGN KEY (ID_BEBIDA) REFERENCES BEBIDAS(ID_BEBIDA)
);

-- Tabela de Estoque
CREATE TABLE ESTOQUE (
    ID_INGREDIENTE INT,
    ID_FORNECEDOR INT,
    QUANTIDADE INT,
    QUANTIDADE_MINIMA INT,
    ID_FILIAL INT,
    FOREIGN KEY (ID_INGREDIENTE) REFERENCES INGREDIENTES (ID_INGREDIENTE),
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Pedidos
CREATE TABLE PEDIDOS (
    ID_PEDIDO INT AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_PRATO INT,
    ID_BEBIDA INT,
    VALOR DECIMAL(4,2),
    TIPO_PAGAMENTO VARCHAR(255),
    ENDERECO VARCHAR(255),
    DATA_PEDIDO DATETIME,
    STATUS VARCHAR(50),
    PRIMARY KEY (ID_PEDIDO),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_PRATO) REFERENCES PRATOS(ID_PRATO),
    FOREIGN KEY (ID_BEBIDA) REFERENCES BEBIDAS(ID_BEBIDA)
);

-- Tabela de Entregas
CREATE TABLE ENTREGAS (
    ID_ENTREGA INT AUTO_INCREMENT,
    ENDERECO VARCHAR(255),
    ID_PEDIDO INT,
    DATA_ENTREGA DATETIME,
    PRIMARY KEY (ID_ENTREGA),
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID_PEDIDO)
);

USE RESTAURANTE;

-- Inserindo dados na tabela FILIAIS
INSERT INTO FILIAIS (ENDERECO, EMAIL, TELEFONE, QUANT_MESAS, AVALIACAO) VALUES
('Rua das Flores, 123', 'filial1@restaurante.com', '1111-1111', 20, 4.5),
('Avenida Central, 456', 'filial2@restaurante.com', '2222-2222', 30, 4.2),
('Rua da Praia, 789', 'filial3@restaurante.com', '3333-3333', 15, 4.7),
('Avenida Brasil, 101', 'filial4@restaurante.com', '4444-4444', 25, 4.0),
('Rua do Sol, 202', 'filial5@restaurante.com', '5555-5555', 40, 4.3),
('Praça da Liberdade, 303', 'filial6@restaurante.com', '6666-6666', 18, 4.6),
('Rua das Laranjeiras, 404', 'filial7@restaurante.com', '7777-7777', 22, 4.1),
('Avenida das Américas, 505', 'filial8@restaurante.com', '8888-8888', 35, 4.4),
('Rua dos Girassóis, 606', 'filial9@restaurante.com', '9999-9999', 28, 4.5),
('Avenida do Parque, 707', 'filial10@restaurante.com', '0000-0000', 32, 4.2);

-- Inserindo dados na tabela CLIENTES
INSERT INTO CLIENTES (CPF, NOME, SENHA, SEXO, IDADE, ENDERECO, EMAIL, TELEFONE, DATA_CADASTRO, ID_FILIAL) VALUES
('12345678901', 'João Silva', 'senha123', 'M', 30, 'Rua A, 10', 'joao@exemplo.com', '1111-1111', NOW(), 1),
('23456789012', 'Maria Oliveira', 'senha456', 'F', 25, 'Rua B, 20', 'maria@exemplo.com', '2222-2222', NOW(), 2),
('34567890123', 'Pedro Santos', 'senha789', 'M', 40, 'Rua C, 30', 'pedro@exemplo.com', '3333-3333', NOW(), 3),
('45678901234', 'Ana Costa', 'senha101', 'F', 35, 'Rua D, 40', 'ana@exemplo.com', '4444-4444', NOW(), 4),
('56789012345', 'Carlos Pereira', 'senha202', 'M', 28, 'Rua E, 50', 'carlos@exemplo.com', '5555-5555', NOW(), 5),
('67890123456', 'Patrícia Almeida', 'senha303', 'F', 33, 'Rua F, 60', 'patricia@exemplo.com', '6666-6666', NOW(), 6),
('78901234567', 'Lucas Martins', 'senha404', 'M', 27, 'Rua G, 70', 'lucas@exemplo.com', '7777-7777', NOW(), 7),
('89012345678', 'Juliana Rocha', 'senha505', 'F', 22, 'Rua H, 80', 'juliana@exemplo.com', '8888-8888', NOW(), 8),
('90123456789', 'Rafael Lima', 'senha606', 'M', 31, 'Rua I, 90', 'rafael@exemplo.com', '9999-9999', NOW(), 9),
('01234567890', 'Fernanda Souza', 'senha707', 'F', 29, 'Rua J, 100', 'fernanda@exemplo.com', '0000-0000', NOW(), 10);

-- Inserindo dados na tabela FUNCIONARIOS
INSERT INTO FUNCIONARIOS (CPF, NOME, SEXO, IDADE, ENDERECO, EMAIL, TELEFONE, ID_FILIAL, CARGO, DATA_CONTATACAO) VALUES
('11122334455', 'Ana Beatriz', 'F', 28, 'Rua K, 11', 'ana@empresa.com', '1111-1111', 1, 'Garçom', NOW()),
('22233445566', 'Bruno Oliveira', 'M', 34, 'Rua L, 22', 'bruno@empresa.com', '2222-2222', 2, 'Cozinheiro', NOW()),
('33344556677', 'Camila Rocha', 'F', 29, 'Rua M, 33', 'camila@empresa.com', '3333-3333', 3, 'Gerente', NOW()),
('44455667788', 'Daniel Martins', 'M', 31, 'Rua N, 44', 'daniel@empresa.com', '4444-4444', 4, 'Caixa', NOW()),
('55566778899', 'Eliane Costa', 'F', 27, 'Rua O, 55', 'eliane@empresa.com', '5555-5555', 5, 'Garçom', NOW()),
('66677889900', 'Fernando Almeida', 'M', 40, 'Rua P, 66', 'fernando@empresa.com', '6666-6666', 6, 'Cozinheiro', NOW()),
('77788990011', 'Gabriela Souza', 'F', 32, 'Rua Q, 77', 'gabriela@empresa.com', '7777-7777', 7, 'Gerente', NOW()),
('88899001122', 'Henrique Lima', 'M', 29, 'Rua R, 88', 'henrique@empresa.com', '8888-8888', 8, 'Caixa', NOW()),
('99900112233', 'Isabela Santos', 'F', 35, 'Rua S, 99', 'isabela@empresa.com', '9999-9999', 9, 'Garçom', NOW()),
('00011223344', 'João Pedro', 'M', 26, 'Rua T, 101', 'joaopedro@empresa.com', '0000-0000', 10, 'Cozinheiro', NOW());

-- Inserindo dados na tabela RESERVAS
INSERT INTO RESERVAS (DATA_RESERVA, ID_CLIENTE, MESA, ID_FILIAL, CAPACIDADE) VALUES
(NOW(), 1, 'Mesa 1', 1, 4),
(NOW(), 2, 'Mesa 2', 2, 6),
(NOW(), 3, 'Mesa 3', 3, 2),
(NOW(), 4, 'Mesa 4', 4, 5),
(NOW(), 5, 'Mesa 5', 5, 8),
(NOW(), 6, 'Mesa 6', 6, 3),
(NOW(), 7, 'Mesa 7', 7, 4),
(NOW(), 8, 'Mesa 8', 8, 5),
(NOW(), 9, 'Mesa 9', 9, 7),
(NOW(), 10, 'Mesa 10', 10, 6);

-- Inserindo dados na tabela FORNECEDORES
INSERT INTO FORNECEDORES (NOME, CNPJ, TIPO_MATERIAL, EMAIL, TELEFONE, VALOR_MATERIAL) VALUES
('Fornecedor A', '12345678000195', 'Legumes', 'fornecedorA@exemplo.com', '1111-1111', 1500.00),
('Fornecedor B', '23456789000196', 'Carnes', 'fornecedorB@exemplo.com', '2222-2222', 2500.00),
('Fornecedor C', '34567890000197', 'Bebidas', 'fornecedorC@exemplo.com', '3333-3333', 1800.00),
('Fornecedor D', '45678901000198', 'Pães', 'fornecedorD@exemplo.com', '4444-4444', 1200.00),
('Fornecedor E', '56789012000199', 'Condimentos', 'fornecedorE@exemplo.com', '5555-5555', 900.00),
('Fornecedor F', '67890123000100', 'Queijos', 'fornecedorF@exemplo.com', '6666-6666', 1300.00),
('Fornecedor G', '78901234000101', 'Frutas', 'fornecedorG@exemplo.com', '7777-7777', 1100.00),
('Fornecedor H', '89012345000102', 'Vinhos', 'fornecedorH@exemplo.com', '8888-8888', 2200.00),
('Fornecedor I', '90123456000103', 'Massas', 'fornecedorI@exemplo.com', '9999-9999', 1400.00),
('Fornecedor J', '01234567000104', 'Doces', 'fornecedorJ@exemplo.com', '0000-0000', 1600.00);


-- Inserindo dados na tabela PRATOS
INSERT INTO PRATOS (NOME, DESCRICAO, VALOR) VALUES
('Spaghetti à Bolonhesa', 'Espaguete com molho de carne', 25.00),
('Feijoada', 'Feijão preto com carne de porco', 30.00),
('Salada Caesar', 'Salada com frango, alface e molho Caesar', 20.00),
('Pizza Margherita', 'Pizza com tomate e queijo', 22.00),
('Hambúrguer Clássico', 'Hambúrguer com queijo e bacon', 18.00),
('Sushi Variado', 'Variedade de sushis e sashimis', 35.00),
('Bife de Chorizo', 'Bife de chorizo com acompanhamento', 40.00),
('Lasanha Bolonhesa', 'Lasanha com molho de carne', 28.00),
('Ratatouille', 'Legumes assados com temperos', 24.00),
('Creme Brulée', 'Sobremesa francesa de creme', 15.00);

-- Inserindo dados na tabela BEBIDAS
INSERT INTO BEBIDAS (NOME, DESCRICAO, VALOR) VALUES
('Cerveja Lager', 'Cerveja clara e leve', 10.00),
('Vinho Tinto', 'Vinho tinto seco', 50.00),
('Refrigerante Cola', 'Refrigerante sabor cola', 8.00),
('Suco de Laranja', 'Suco natural de laranja', 12.00),
('Água Mineral', 'Água mineral com gás', 5.00),
('Vinho Branco', 'Vinho branco seco', 55.00),
('Cerveja IPA', 'Cerveja amarga e forte', 12.00),
('Limonada', 'Limonada fresca', 9.00),
('Espresso', 'Café expresso forte', 6.00),
('Cappuccino', 'Café com leite e espuma', 7.00);

-- Inserindo dados na tabela INGREDIENTES
INSERT INTO INGREDIENTES (NOME, UNIDADE_MEDIDA, ID_PRATO, ID_BEBIDA) VALUES
('Tomate', 'kg', 1, NULL),
('Carne Moída', 'kg', 1, NULL),
('Feijão Preto', 'kg', 2, NULL),
('Arroz', 'kg', 2, NULL),
('Alface', 'kg', 3, NULL),
('Peito de Frango', 'kg', 3, NULL),
('Massa de Pizza', 'kg', 4, NULL),
('Queijo Mozzarella', 'kg', 4, NULL),
('Cerveja Lager', 'litro', NULL, 1),
('Vinho Tinto', 'garrafa', NULL, 2);

-- Inserindo dados na tabela PEDIDOS
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRATO, ID_BEBIDA, VALOR, TIPO_PAGAMENTO, ENDERECO, DATA_PEDIDO, STATUS) VALUES
(1, 1, 1, 35.00, 'Cartão', 'Rua A, 10', NOW(), 'Entregue'),
(2, 2, 2, 40.00, 'Dinheiro', 'Rua B, 20', NOW(), 'Pendente'),
(3, 3, 3, 30.00, 'Cartão', 'Rua C, 30', NOW(), 'Em Preparação'),
(4, 4, 4, 45.00, 'Cartão', 'Rua D, 40', NOW(), 'Entregue'),
(5, 5, 5, 50.00, 'Dinheiro', 'Rua E, 50', NOW(), 'Cancelado'),
(6, 6, 6, 55.00, 'Dinheiro', 'Rua F, 60', NOW(), 'Entregue'),
(7, 7, 7, 70.00, 'Cartão', 'Rua G, 70', NOW(), 'Em Preparação'),
(8, 8, 8, 60.00, 'Cartão', 'Rua H, 80', NOW(), 'Pendente'),
(9, 9, 9, 65.00, 'Dinheiro', 'Rua I, 90', NOW(), 'Entregue'),
(10, 10, 10, 55.00, 'Cartão', 'Rua J, 100', NOW(), 'Cancelado');

-- Inserindo dados na tabela ENTREGAS
INSERT INTO ENTREGAS (ENDERECO, ID_PEDIDO, DATA_ENTREGA) VALUES
('Rua A, 10', 1, NOW()),
('Rua B, 20', 2, NOW() + INTERVAL 1 DAY),
('Rua C, 30', 3, NOW() + INTERVAL 2 DAY),
('Rua D, 40', 4, NOW() + INTERVAL 1 DAY),
('Rua E, 50', 5, NOW() + INTERVAL 3 DAY),
('Rua F, 60', 6, NOW() + INTERVAL 1 DAY),
('Rua G, 70', 7, NOW() + INTERVAL 2 DAY),
('Rua H, 80', 8, NOW() + INTERVAL 1 DAY),
('Rua I, 90', 9, NOW() + INTERVAL 2 DAY),
('Rua J, 100', 10, NOW() + INTERVAL 3 DAY);

-- Inserindo dados na tabela ESTOQUE
INSERT INTO ESTOQUE (ID_INGREDIENTE, ID_FORNECEDOR, QUANTIDADE, QUANTIDADE_MINIMA, ID_FILIAL) VALUES
(1,1, 100, 10, 1),
(2,2, 200, 20, 2),
(3,3, 150, 15, 3),
(4,4, 50, 5, 4),
(5,5, 75, 10, 5),
(6,6, 90, 8, 6),
(7,7, 120, 12, 7),
(8,8, 60, 6, 8),
(9,9, 80, 7, 9),
(10,10, 110, 11, 10);
