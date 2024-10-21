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
    SENHA VARCHAR(14),
    NOME VARCHAR(255),
    SEXO VARCHAR(10),
    IDADE INT,
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    TELEFONE VARCHAR(12),
    ID_FILIAL INT,
    CARGO VARCHAR(255),
    DATA_CONTRATACAO DATETIME,
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
    PRIMARY KEY (ID_INGREDIENTE)
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
('EXCLUÍDO', 'EXCLUÍDO', 'EXCLUÍDO', 0, 0),
('Rua das Flores, 123', 'filial1@restaurante.com', '1111-1111', 20, 4.5),
('Avenida Central, 456', 'filial2@restaurante.com', '2222-2222', 30, 4.2),
('Rua da Praia, 789', 'filial3@restaurante.com', '3333-3333', 15, 4.7),
('Avenida Brasil, 101', 'filial4@restaurante.com', '4444-4444', 25, 4.0),
('Rua do Sol, 202', 'filial5@restaurante.com', '5555-5555', 40, 4.3),
('Praça da Liberdade, 303', 'filial6@restaurante.com', '6666-6666', 18, 4.6),
('Rua das Laranjeiras, 404', 'filial7@restaurante.com', '7777-7777', 22, 4.1),
('Avenida das Américas, 505', 'filial8@restaurante.com', '8888-8888', 35, 4.4),
('Rua dos Girassóis, 606', 'filial9@restaurante.com', '9999-9999', 28, 4.5),
('Avenida do Parque, 707', 'filial10@restaurante.com', '0000-0000', 32, 4.2),
('Rua das Acácias, 101', 'filial21@restaurante.com', '1111-2222', 25, 4.5),
('Avenida do Litoral, 202', 'filial22@restaurante.com', '2222-3333', 20, 4.3),
('Rua do Atlântico, 303', 'filial23@restaurante.com', '3333-4444', 30, 4.4),
('Praça do Pôr do Sol, 404', 'filial24@restaurante.com', '4444-5555', 15, 4.6),
('Avenida das Orquídeas, 505', 'filial25@restaurante.com', '5555-6666', 35, 4.2),
('Rua do Mar, 606', 'filial26@restaurante.com', '6666-7777', 28, 4.8),
('Avenida da Liberdade, 707', 'filial27@restaurante.com', '7777-8888', 32, 4.1),
('Rua do Bosque, 808', 'filial28@restaurante.com', '8888-9999', 40, 4.0),
('Avenida das Flores, 909', 'filial29@restaurante.com', '9999-0000', 22, 4.7),
('Rua das Estações, 1010', 'filial30@restaurante.com', '0001-1111', 27, 4.9),
('Rua das Oliveiras, 111', 'filial31@restaurante.com', '1112-2222', 23, 4.6),
('Avenida do Sol, 222', 'filial32@restaurante.com', '2223-3333', 19, 4.2),
('Rua da Amizade, 333', 'filial33@restaurante.com', '3334-4444', 31, 4.8),
('Praça do Mercado, 444', 'filial34@restaurante.com', '4445-5555', 26, 4.3),
('Avenida da Harmonia, 555', 'filial35@restaurante.com', '5556-6666', 24, 4.5),
('Rua das Árvores, 666', 'filial36@restaurante.com', '6667-7777', 34, 4.1),
('Avenida do Futuro, 777', 'filial37@restaurante.com', '7778-8888', 20, 4.4),
('Rua dos Sinos, 888', 'filial38@restaurante.com', '8889-9999', 29, 4.7),
('Avenida dos Pássaros, 999', 'filial39@restaurante.com', '9990-0000', 22, 4.2),
('Rua do Amanhã, 1011', 'filial40@restaurante.com', '0002-1111', 27, 4.9);

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
('01234567890', 'Fernanda Souza', 'senha707', 'F', 29, 'Rua J, 100', 'fernanda@exemplo.com', '0000-0000', NOW(), 10),
('12345678901', 'Lucas Ferreira', 'senha818', 'M', 22, 'Rua U, 210', 'lucas.ferreira@exemplo.com', '1111-2222', NOW(), 1),
('23456789012', 'Patricia Lima', 'senha919', 'F', 27, 'Rua V, 220', 'patricia.lima@exemplo.com', '2222-3333', NOW(), 2),
('34567890123', 'Rafael Costa', 'senha020', 'M', 31, 'Rua W, 230', 'rafael.costa@exemplo.com', '3333-4444', NOW(), 3),
('45678901234', 'Ana Beatriz', 'senha121', 'F', 28, 'Rua X, 240', 'ana.beatriz@exemplo.com', '4444-5555', NOW(), 4),
('56789012345', 'Carlos Silva', 'senha222', 'M', 35, 'Rua Y, 250', 'carlos.silva@exemplo.com', '5555-6666', NOW(), 5),
('67890123456', 'Juliana Alves', 'senha323', 'F', 30, 'Rua Z, 260', 'juliana.alves@exemplo.com', '6666-7777', NOW(), 6),
('78901234567', 'Marcos Pereira', 'senha424', 'M', 29, 'Rua AA, 270', 'marcos.pereira@exemplo.com', '7777-8888', NOW(), 7),
('89012345678', 'Fernanda Martins', 'senha525', 'F', 26, 'Rua AB, 280', 'fernanda.martins@exemplo.com', '8888-9999', NOW(), 8),
('90123456789', 'Diego Almeida', 'senha626', 'M', 33, 'Rua AC, 290', 'diego.almeida@exemplo.com', '9999-0000', NOW(), 9),
('01234567890', 'Claudia Rocha', 'senha727', 'F', 34, 'Rua AD, 300', 'claudia.rocha@exemplo.com', '0000-1111', NOW(), 10),
('11223344556', 'Bruno Nascimento', 'senha828', 'M', 38, 'Rua AE, 310', 'bruno.nascimento@exemplo.com', '1111-2222', NOW(), 1),
('22334455667', 'Samantha Dias', 'senha929', 'F', 25, 'Rua AF, 320', 'samantha.dias@exemplo.com', '2222-3333', NOW(), 2),
('33445566778', 'Guilherme Lopes', 'senha030', 'M', 27, 'Rua AG, 330', 'guilherme.lopes@exemplo.com', '3333-4444', NOW(), 3),
('44556677889', 'Carla Mendes', 'senha131', 'F', 32, 'Rua AH, 340', 'carla.mendes@exemplo.com', '4444-5555', NOW(), 4),
('55667788990', 'André Teixeira', 'senha232', 'M', 40, 'Rua AI, 350', 'andre.teixeira@exemplo.com', '5555-6666', NOW(), 5),
('66778899001', 'Luana Costa', 'senha333', 'F', 23, 'Rua AJ, 360', 'luana.costa@exemplo.com', '6666-7777', NOW(), 6),
('77889900112', 'Felipe Rocha', 'senha434', 'M', 36, 'Rua AK, 370', 'felipe.rocha@exemplo.com', '7777-8888', NOW(), 7),
('88990011223', 'Mariana Gomes', 'senha535', 'F', 30, 'Rua AL, 380', 'mariana.gomes@exemplo.com', '8888-9999', NOW(), 8),
('99001122334', 'Ricardo Alves', 'senha636', 'M', 29, 'Rua AM, 390', 'ricardo.alves@exemplo.com', '9999-0000', NOW(), 9),
('00112233445', 'Vanessa Lima', 'senha737', 'F', 31, 'Rua AN, 400', 'vanessa.lima@exemplo.com', '0000-1111', NOW(), 10);

-- Inserindo dados na tabela FUNCIONARIOS
INSERT INTO FUNCIONARIOS (CPF, NOME, SENHA, SEXO, IDADE, ENDERECO, EMAIL, TELEFONE, ID_FILIAL, CARGO, DATA_CONTRATACAO) VALUES
('11122334455', 'Ana Beatriz','senha123', 'F', 28, 'Rua K, 11', 'ana@empresa.com', '1111-1111', 1, 'Garçom', NOW()),
('22233445566', 'Bruno Oliveira', 'senha123', 'M', 34, 'Rua L, 22', 'bruno@empresa.com', '2222-2222', 2, 'Cozinheiro', NOW()),
('33344556677', 'Camila Rocha','senha123', 'F', 29, 'Rua M, 33', 'camila@empresa.com', '3333-3333', 3, 'Gerente', NOW()),
('44455667788', 'Daniel Martins','senha123', 'M', 31, 'Rua N, 44', 'daniel@empresa.com', '4444-4444', 4, 'Caixa', NOW()),
('55566778899', 'Eliane Costa','senha123', 'F', 27, 'Rua O, 55', 'eliane@empresa.com', '5555-5555', 5, 'Garçom', NOW()),
('66677889900', 'Fernando Almeida','senha123', 'M', 40, 'Rua P, 66', 'fernando@empresa.com', '6666-6666', 6, 'Cozinheiro', NOW()),
('77788990011', 'Gabriela Souza','senha123', 'F', 32, 'Rua Q, 77', 'gabriela@empresa.com', '7777-7777', 7, 'Gerente', NOW()),
('88899001122', 'Henrique Lima','senha123', 'M', 29, 'Rua R, 88', 'henrique@empresa.com', '8888-8888', 8, 'Caixa', NOW()),
('99900112233', 'Isabela Santos','senha123', 'F', 35, 'Rua S, 99', 'isabela@empresa.com', '9999-9999', 9, 'Garçom', NOW()),
('00011223344', 'João Pedro','senha123', 'M', 26, 'Rua T, 101', 'joaopedro@empresa.com', '0000-0000', 10, 'Cozinheiro', NOW()),
('11122334456', 'Lucas Ferreira','senha123', 'M', 30, 'Rua U, 12', 'lucas@empresa.com', '1112-2222', 1, 'Garçom', NOW()),
('22233445567', 'Patrícia Lima','senha123', 'F', 26, 'Rua V, 23', 'patricia@empresa.com', '2223-3333', 2, 'Cozinheiro', NOW()),
('33344556678', 'Roberto Costa','senha123', 'M', 33, 'Rua W, 34', 'roberto@empresa.com', '3334-4444', 3, 'Gerente', NOW()),
('44455667789', 'Sofia Almeida','senha123', 'F', 29, 'Rua X, 45', 'sofia@empresa.com', '4445-5555', 4, 'Caixa', NOW()),
('55566778800', 'Marcos Santos','senha123', 'M', 31, 'Rua Y, 56', 'marcos@empresa.com', '5556-6666', 5, 'Garçom', NOW()),
('66677889911', 'Juliana Rocha','senha123', 'F', 27, 'Rua Z, 67', 'juliana@empresa.com', '6667-7777', 6, 'Cozinheiro', NOW()),
('77788990022', 'Diego Almeida','senha123', 'M', 36, 'Rua AA, 78', 'diego@empresa.com', '7778-8888', 7, 'Gerente', NOW()),
('88899001133', 'Carla Beatriz','senha123', 'F', 34, 'Rua AB, 89', 'carla@empresa.com', '8889-9999', 8, 'Caixa', NOW()),
('99900112244', 'Felipe Nascimento','senha123', 'M', 28, 'Rua AC, 90', 'felipe@empresa.com', '9990-0000', 9, 'Garçom', NOW()),
('00011223355', 'Ana Clara','senha123', 'F', 30, 'Rua AD, 101', 'anaclara@empresa.com', '0001-1111', 10, 'Cozinheiro', NOW()),
('11122334457', 'Gabriel Dias','senha123', 'M', 32, 'Rua AE, 112', 'gabriel@empresa.com', '1112-2222', 1, 'Gerente', NOW()),
('22233445568', 'Renata Gomes','senha123', 'F', 25, 'Rua AF, 123', 'renata@empresa.com', '2223-3333', 2, 'Caixa', NOW()),
('33344556679', 'Tiago Martins','senha123', 'M', 29, 'Rua AG, 134', 'tiago@empresa.com', '3334-4444', 3, 'Garçom', NOW()),
('44455667790', 'Laura Pires','senha123', 'F', 33, 'Rua AH, 145', 'laura@empresa.com', '4445-5555', 4, 'Cozinheiro', NOW()),
('55566778811', 'André Ribeiro','senha123', 'M', 35, 'Rua AI, 156', 'andre@empresa.com', '5556-6666', 5, 'Gerente', NOW()),
('66677889922', 'Mariana Teixeira','senha123', 'F', 24, 'Rua AJ, 167', 'mariana@empresa.com', '6667-7777', 6, 'Caixa', NOW()),
('77788990033', 'Carlos Alberto','senha123', 'M', 38, 'Rua AK, 178', 'carlos.alberto@empresa.com', '7778-8888', 7, 'Garçom', NOW()),
('88899001144', 'Aline Ferreira','senha123', 'F', 30, 'Rua AL, 189', 'aline@empresa.com', '8889-9999', 8, 'Cozinheiro', NOW()),
('99900112255', 'Rafael Lima','senha123', 'M', 31, 'Rua AM, 190', 'rafael.lima@empresa.com', '9990-0000', 9, 'Gerente', NOW()),
('00011223366', 'Vanessa Santos','senha123', 'F', 29, 'Rua AN, 201', 'vanessa.santos@empresa.com', '0001-1111', 10, 'Caixa', NOW());

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
(NOW(), 10, 'Mesa 10', 10, 6),
(NOW(), 11, 'Mesa 11', 1, 4),
(NOW(), 12, 'Mesa 12', 2, 6),
(NOW(), 13, 'Mesa 13', 3, 2),
(NOW(), 14, 'Mesa 14', 4, 5),
(NOW(), 15, 'Mesa 15', 5, 8),
(NOW(), 16, 'Mesa 16', 6, 3),
(NOW(), 17, 'Mesa 17', 7, 4),
(NOW(), 18, 'Mesa 18', 8, 5),
(NOW(), 19, 'Mesa 19', 9, 7),
(NOW(), 20, 'Mesa 20', 10, 6),
(NOW(), 21, 'Mesa 21', 1, 4),
(NOW(), 22, 'Mesa 22', 2, 6),
(NOW(), 23, 'Mesa 23', 3, 2),
(NOW(), 24, 'Mesa 24', 4, 5),
(NOW(), 25, 'Mesa 25', 5, 8),
(NOW(), 26, 'Mesa 26', 6, 3),
(NOW(), 27, 'Mesa 27', 7, 4),
(NOW(), 28, 'Mesa 28', 8, 5),
(NOW(), 29, 'Mesa 29', 9, 7),
(NOW(), 30, 'Mesa 30', 10, 6);

-- Inserindo dados na tabela FORNECEDORES
INSERT INTO FORNECEDORES (NOME, CNPJ, TIPO_MATERIAL, EMAIL, TELEFONE, VALOR_MATERIAL) VALUES
('EXCLUÍDO', 'EXCLUÍDO', 'EXCLUÍDO', 'EXCLUÍDO', 'EXCLUÍDO', 0),
('Fornecedor A', '12345678000195', 'Legumes', 'fornecedorA@exemplo.com', '1111-1111', 1500.00),
('Fornecedor B', '23456789000196', 'Carnes', 'fornecedorB@exemplo.com', '2222-2222', 2500.00),
('Fornecedor C', '34567890000197', 'Bebidas', 'fornecedorC@exemplo.com', '3333-3333', 1800.00),
('Fornecedor D', '45678901000198', 'Pães', 'fornecedorD@exemplo.com', '4444-4444', 1200.00),
('Fornecedor E', '56789012000199', 'Condimentos', 'fornecedorE@exemplo.com', '5555-5555', 900.00),
('Fornecedor F', '67890123000100', 'Queijos', 'fornecedorF@exemplo.com', '6666-6666', 1300.00),
('Fornecedor G', '78901234000101', 'Frutas', 'fornecedorG@exemplo.com', '7777-7777', 1100.00),
('Fornecedor H', '89012345000102', 'Vinhos', 'fornecedorH@exemplo.com', '8888-8888', 2200.00),
('Fornecedor I', '90123456000103', 'Massas', 'fornecedorI@exemplo.com', '9999-9999', 1400.00),
('Fornecedor J', '01234567000104', 'Doces', 'fornecedorJ@exemplo.com', '0000-0000', 1600.00),
('Fornecedor K', '11223344000105', 'Temperos', 'fornecedorK@exemplo.com', '1010-1010', 800.00),
('Fornecedor L', '22334455000106', 'Frutos do Mar', 'fornecedorL@exemplo.com', '2020-2020', 3000.00),
('Fornecedor M', '33445566000107', 'Laticínios', 'fornecedorM@exemplo.com', '3030-3030', 1700.00),
('Fornecedor N', '44556677000108', 'Grãos', 'fornecedorN@exemplo.com', '4040-4040', 950.00),
('Fornecedor O', '55667788000109', 'Aperitivos', 'fornecedorO@exemplo.com', '5050-5050', 1250.00),
('Fornecedor P', '66778899000110', 'Saladas', 'fornecedorP@exemplo.com', '6060-6060', 1100.00),
('Fornecedor Q', '77889900100111', 'Sopas', 'fornecedorQ@exemplo.com', '7070-7070', 1350.00),
('Fornecedor R', '88990011200112', 'Doces Finos', 'fornecedorR@exemplo.com', '8080-8080', 1800.00),
('Fornecedor S', '99001122300113', 'Sorvetes', 'fornecedorS@exemplo.com', '9090-9090', 1500.00),
('Fornecedor T', '00112233400114', 'Carnes Processadas', 'fornecedorT@exemplo.com', '0001-1111', 2600.00),
('Fornecedor U', '11223344500115', 'Bebidas Alcoólicas', 'fornecedorU@exemplo.com', '1112-2222', 2200.00),
('Fornecedor V', '22334455600116', 'Azeites', 'fornecedorV@exemplo.com', '2223-3333', 1300.00),
('Fornecedor W', '33445566700117', 'Chás', 'fornecedorW@exemplo.com', '3334-4444', 900.00),
('Fornecedor X', '44556677800118', 'Cereais', 'fornecedorX@exemplo.com', '4445-5555', 1100.00),
('Fornecedor Y', '55667788900119', 'Especiarias', 'fornecedorY@exemplo.com', '5556-6666', 1400.00),
('Fornecedor Z', '66778899000120', 'Salgadinhos', 'fornecedorZ@exemplo.com', '6667-7777', 1500.00),
('Fornecedor AA', '77889900100121', 'Molhos', 'fornecedorAA@exemplo.com', '7778-8888', 1250.00),
('Fornecedor AB', '88990011200122', 'Frutas Secas', 'fornecedorAB@exemplo.com', '8889-9999', 1600.00),
('Fornecedor AC', '99001122300123', 'Pasta', 'fornecedorAC@exemplo.com', '9990-0000', 1300.00),
('Fornecedor AD', '00112233400124', 'Peixes', 'fornecedorAD@exemplo.com', '0001-1112', 2200.00);


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
('Creme Brulée', 'Sobremesa francesa de creme', 15.00),
('Tacos de Carne', 'Tacos recheados com carne e guacamole', 27.00),
('Camarão ao Alho', 'Camarões salteados com alho e limão', 35.00),
('Risoto de Funghi', 'Risoto cremoso com cogumelos', 32.00),
('Frango à Parmegiana', 'Frango empanado com molho de tomate e queijo', 29.00),
('Churrasco Gaúcho', 'Mistura de carnes grelhadas', 45.00),
('Penne ao Pesto', 'Penne com molho pesto e pinoli', 26.00),
('Mousse de Maracujá', 'Sobremesa leve de maracujá', 12.00),
('Calzone de Queijo', 'Calzone recheado com queijos variados', 23.00),
('Salmão Grelhado', 'Salmão grelhado com legumes', 38.00),
('Bolo de Cenoura', 'Bolo de cenoura com cobertura de chocolate', 10.00),
('Quiche de Espinafre', 'Quiche recheada com espinafre e queijo', 22.00),
('Ceviche de Peixe', 'Peixe marinado com limão e ervas', 28.00),
('Batata Rosti', 'Batata ralada e frita, crocante', 15.00),
('Frutos do Mar à Provençal', 'Frutos do mar com temperos franceses', 42.00),
('Pato com Laranja', 'Pato assado com molho de laranja', 50.00),
('Torta de Limão', 'Torta azeda de limão', 14.00),
('Sanduíche de Pernil', 'Pernil assado em pão francês', 18.00),
('Polenta com Ragu', 'Polenta mole com molho de carne', 20.00),
('Panna Cotta', 'Sobremesa italiana cremosa', 11.00),
('Wrap de Frango', 'Wrap com frango grelhado e salada', 19.00);

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
('Cappuccino', 'Café com leite e espuma', 7.00),
('Cerveja Weiss', 'Cerveja de trigo, leve e refrescante', 11.00),
('Vinho Rosé', 'Vinho rosé frutado', 45.00),
('Refrigerante Laranja', 'Refrigerante sabor laranja', 8.50),
('Suco de Limão', 'Suco natural de limão', 12.00),
('Chá Gelado', 'Chá gelado com limão', 7.00),
('Cerveja Stout', 'Cerveja escura e encorpada', 13.00),
('Pina Colada', 'Coquetel de abacaxi e coco', 15.00),
('Mojito', 'Coquetel de rum com hortelã', 14.00),
('Caipirinha', 'Coquetel brasileiro com cachaça e limão', 12.00),
('Smoothie de Frutas', 'Batido de frutas tropicais', 9.00),
('Água Tônica', 'Água com sabor tônico', 6.00),
('Cerveja Pilsen', 'Cerveja leve e refrescante', 10.00),
('Vinho do Porto', 'Vinho fortificado, doce', 70.00),
('Batida de Coco', 'Coquetel de coco e leite condensado', 13.00),
('Café Gelado', 'Café servido gelado', 8.00),
('Batida de Maracujá', 'Coquetel de maracujá e vodka', 12.00),
('Refrigerante Guaraná', 'Refrigerante sabor guaraná', 8.00),
('Lassi de Manga', 'Bebida indiana de iogurte e manga', 10.00),
('Cerveja Artesanal', 'Cerveja produzida artesanalmente', 15.00),
('Chá de Hibisco', 'Chá de hibisco refrescante', 7.00);

-- Inserindo dados na tabela INGREDIENTES
INSERT INTO INGREDIENTES (NOME, UNIDADE_MEDIDA) VALUES
('EXCLUÍDO', 'EXCLUÍDO'),
('Tomate', 'kg'),
('Carne Moída', 'kg'),
('Feijão Preto', 'kg'),
('Arroz', 'kg'),
('Alface', 'kg'),
('Peito de Frango', 'kg'),
('Massa de Pizza', 'kg'),
('Queijo Mozzarella', 'kg'),
('Cerveja Lager', 'litro'),
('Vinho Tinto', 'garrafa'),
('Cebola', 'kg'),
('Alho', 'kg'),
('Carne Seca', 'kg'),
('Laranja', 'kg'),
('Azeitona', 'kg'),
('Maionese', 'kg'),
('Farinha de Trigo', 'kg'),
('Queijo Parmesão', 'kg'),
('Sushi de Salmão', 'kg'),
('Camarão', 'kg'),
('Molho de Soja', 'litro'),
('Leite', 'litro'),
('Coco Ralado', 'kg'),
('Bacon', 'kg'),
('Batata', 'kg'),
('Frango em Cubos', 'kg'),
('Ervilha', 'kg'),
('Vinagre', 'litro'),
('Gengibre', 'kg'),
('Cenoura', 'kg'),
('Pimenta do Reino', 'kg');

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
(10, 10, 10, 55.00, 'Cartão', 'Rua J, 100', NOW(), 'Cancelado'),
(11, 1, 2, 45.00, 'Cartão', 'Rua K, 11', NOW(), 'Entregue'),
(12, 2, 3, 40.00, 'Dinheiro', 'Rua L, 22', NOW(), 'Pendente'),
(13, 3, 4, 50.00, 'Cartão', 'Rua M, 33', NOW(), 'Em Preparação'),
(14, 4, 5, 60.00, 'Cartão', 'Rua N, 44', NOW(), 'Entregue'),
(15, 5, 6, 55.00, 'Dinheiro', 'Rua O, 55', NOW(), 'Cancelado'),
(16, 6, 7, 65.00, 'Dinheiro', 'Rua P, 66', NOW(), 'Entregue'),
(17, 7, 8, 70.00, 'Cartão', 'Rua Q, 77', NOW(), 'Em Preparação'),
(18, 8, 9, 60.00, 'Cartão', 'Rua R, 88', NOW(), 'Pendente'),
(19, 9, 10, 65.00, 'Dinheiro', 'Rua S, 99', NOW(), 'Entregue'),
(20, 10, 1, 55.00, 'Cartão', 'Rua T, 101', NOW(), 'Cancelado'),
(21, 1, 3, 50.00, 'Dinheiro', 'Rua U, 102', NOW(), 'Entregue'),
(22, 2, 4, 55.00, 'Cartão', 'Rua V, 103', NOW(), 'Pendente'),
(23, 3, 5, 60.00, 'Cartão', 'Rua W, 104', NOW(), 'Em Preparação'),
(24, 4, 6, 70.00, 'Dinheiro', 'Rua X, 105', NOW(), 'Entregue'),
(25, 5, 7, 45.00, 'Cartão', 'Rua Y, 106', NOW(), 'Cancelado'),
(26, 6, 8, 65.00, 'Dinheiro', 'Rua Z, 107', NOW(), 'Entregue'),
(27, 7, 9, 50.00, 'Cartão', 'Rua AA, 108', NOW(), 'Em Preparação'),
(28, 8, 10, 60.00, 'Cartão', 'Rua AB, 109', NOW(), 'Pendente'),
(29, 9, 1, 55.00, 'Dinheiro', 'Rua AC, 110', NOW(), 'Entregue'),
(30, 10, 2, 40.00, 'Cartão', 'Rua AD, 111', NOW(), 'Cancelado');

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
('Rua J, 100', 10, NOW() + INTERVAL 3 DAY),
('Rua K, 11', 11, NOW()),
('Rua L, 22', 12, NOW() + INTERVAL 1 DAY),
('Rua M, 33', 13, NOW() + INTERVAL 2 DAY),
('Rua N, 44', 14, NOW() + INTERVAL 1 DAY),
('Rua O, 55', 15, NOW() + INTERVAL 3 DAY),
('Rua P, 66', 16, NOW() + INTERVAL 1 DAY),
('Rua Q, 77', 17, NOW() + INTERVAL 2 DAY),
('Rua R, 88', 18, NOW() + INTERVAL 1 DAY),
('Rua S, 99', 19, NOW() + INTERVAL 2 DAY),
('Rua T, 101', 20, NOW() + INTERVAL 3 DAY),
('Rua U, 102', 21, NOW() + INTERVAL 1 DAY),
('Rua V, 103', 22, NOW() + INTERVAL 2 DAY),
('Rua W, 104', 23, NOW() + INTERVAL 1 DAY),
('Rua X, 105', 24, NOW() + INTERVAL 3 DAY),
('Rua Y, 106', 25, NOW() + INTERVAL 1 DAY),
('Rua Z, 107', 26, NOW() + INTERVAL 2 DAY),
('Rua AA, 108', 27, NOW() + INTERVAL 1 DAY),
('Rua AB, 109', 28, NOW() + INTERVAL 2 DAY),
('Rua AC, 110', 29, NOW() + INTERVAL 3 DAY),
('Rua AD, 111', 30, NOW() + INTERVAL 1 DAY);

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
(10,10, 110, 11, 10),
(11, 1, 200, 15, 1),
(12, 2, 180, 10, 2),
(13, 3, 130, 12, 3),
(14, 4, 70, 5, 4),
(15, 5, 90, 10, 5),
(16, 6, 85, 7, 6),
(17, 7, 150, 15, 7),
(18, 8, 75, 8, 8),
(19, 9, 95, 10, 9),
(20, 10, 120, 12, 10),
(21, 1, 160, 15, 1),
(22, 2, 190, 20, 2),
(23, 3, 110, 10, 3),
(24, 4, 40, 5, 4),
(25, 5, 130, 12, 5),
(26, 6, 100, 8, 6),
(27, 7, 140, 10, 7),
(28, 8, 80, 6, 8),
(29, 9, 60, 7, 9),
(30, 10, 150, 15, 10);