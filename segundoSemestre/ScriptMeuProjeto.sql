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
    CPF VARCHAR(11) NOT NULL,
    NOME VARCHAR(255),
    SENHA VARCHAR(255) NOT NULL,
    SEXO VARCHAR(255),
    IDADE VARCHAR(3),
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255),
    TELEFONE VARCHAR(12),
    DATA_CADASTRO DATETIME,
    ID_FILIAL INT,
    PRIMARY KEY (ID_CLIENTE),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Funcionários
CREATE TABLE FUNCIONARIOS (
    ID_FUNC INT AUTO_INCREMENT,
    CPF VARCHAR(11) NOT NULL,
    NOME VARCHAR(255),
    SEXO VARCHAR(255),
    IDADE VARCHAR(3),
    ENDERECO VARCHAR(255),
    EMAIL VARCHAR(255),
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
    MESA VARCHAR(5),
    ID_FILIAL INT,
    CAPACIDADE VARCHAR(2),
    PRIMARY KEY (ID_RESERVA),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
);

-- Tabela de Fornecedores
CREATE TABLE FORNECEDORES (
    ID_FORNECEDOR INT AUTO_INCREMENT,
    NOME VARCHAR(255),
    CNPJ VARCHAR(14),
    TIPO_MATERIAL VARCHAR(255),
    EMAIL VARCHAR(255),
    TELEFONE VARCHAR(12),
    VALOR_MATERIAL DECIMAL(8,2),
    PRIMARY KEY (ID_FORNECEDOR)
);

-- Tabela de Estoque
CREATE TABLE ESTOQUE (
    ID_MATERIA INT AUTO_INCREMENT,
    ID_FORNECEDOR INT,
    QUANTIDADE INT,
    ID_FILIAL INT,
    PRIMARY KEY (ID_MATERIA),
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR),
    FOREIGN KEY (ID_FILIAL) REFERENCES FILIAIS(ID_FILIAL)
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

-- Inserir dados na tabela Filiais
INSERT INTO FILIAIS (ENDERECO, EMAIL, TELEFONE, QUANT_MESAS, AVALIACAO) VALUES
('Rua K, 123', 'filial1@restaurante.com', '1111111111', 10, 4.5),
('Rua L, 456', 'filial2@restaurante.com', '2222222222', 20, 4.0),
('Rua M, 789', 'filial3@restaurante.com', '3333333333', 15, 4.2),
('Rua N, 101', 'filial4@restaurante.com', '4444444444', 12, 4.7),
('Rua O, 202', 'filial5@restaurante.com', '5555555555', 18, 4.3);

-- Inserir dados na tabela Clientes
INSERT INTO CLIENTES (CPF, NOME, SENHA, SEXO, IDADE, ENDERECO, EMAIL, TELEFONE, DATA_CADASTRO, ID_FILIAL) VALUES 
('12345678901', 'Maria Silva', 'senha123', 'Feminino', '25', 'Rua A, 123', 'maria.silva@gmail.com', '9876543210', '2023-01-01 10:00:00', 1),
('23456789012', 'João Souza', 'senha234', 'Masculino', '30', 'Rua B, 456', 'joao.souza@gmail.com', '9876543211', '2023-01-02 11:00:00', 2),
('34567890123', 'Ana Pereira', 'senha345', 'Feminino', '22', 'Rua C, 789', 'ana.pereira@gmail.com', '9876543212', '2023-01-03 12:00:00', 3),
('45678901234', 'Carlos Santos', 'senha456', 'Masculino', '28', 'Rua D, 101', 'carlos.santos@gmail.com', '9876543213', '2023-01-04 13:00:00', 4),
('56789012345', 'Julia Oliveira', 'senha567', 'Feminino', '26', 'Rua E, 202', 'julia.oliveira@gmail.com', '9876543214', '2023-01-05 14:00:00', 5),
('67890123456', 'Pedro Lima', 'senha678', 'Masculino', '29', 'Rua F, 303', 'pedro.lima@gmail.com', '9876543215', '2023-01-06 15:00:00', 1),
('78901234567', 'Mariana Costa', 'senha789', 'Feminino', '27', 'Rua G, 404', 'mariana.costa@gmail.com', '9876543216', '2023-01-07 16:00:00', 2),
('89012345678', 'Lucas Almeida', 'senha890', 'Masculino', '24', 'Rua H, 505', 'lucas.almeida@gmail.com', '9876543217', '2023-01-08 17:00:00', 3),
('90123456789', 'Larissa Carvalho', 'senha901', 'Feminino', '23', 'Rua I, 606', 'larissa.carvalho@gmail.com', '9876543218', '2023-01-09 18:00:00', 4),
('01234567890', 'Ricardo Araújo', 'senha012', 'Masculino', '31', 'Rua J, 707', 'ricardo.araujo@gmail.com', '9876543219', '2023-01-10 19:00:00', 5);

-- Inserir dados na tabela Funcionarios
INSERT INTO FUNCIONARIOS (CPF, NOME, SEXO, IDADE, ENDERECO, EMAIL, TELEFONE, ID_FILIAL, CARGO, DATA_CONTATACAO) VALUES
('11111111111', 'José da Silva', 'Masculino', '35', 'Rua X, 101', 'jose.silva@restaurante.com', '9999999999', 1, 'Garçom', '2023-01-01 09:00:00'),
('22222222222', 'Fernanda Oliveira', 'Feminino', '28', 'Rua Y, 202', 'fernanda.oliveira@restaurante.com', '9999999998', 2, 'Cozinheira', '2023-02-01 10:00:00'),
('33333333333', 'Carlos Alberto', 'Masculino', '42', 'Rua Z, 303', 'carlos.alberto@restaurante.com', '9999999997', 3, 'Gerente', '2023-03-01 11:00:00'),
('44444444444', 'Mariana Santos', 'Feminino', '30', 'Rua W, 404', 'mariana.santos@restaurante.com', '9999999996', 4, 'Auxiliar de Cozinha', '2023-04-01 12:00:00'),
('55555555555', 'Roberto Costa', 'Masculino', '38', 'Rua V, 505', 'roberto.costa@restaurante.com', '9999999995', 5, 'Recepcionista', '2023-05-01 13:00:00'),
('66666666666', 'Juliana Pereira', 'Feminino', '26', 'Rua U, 606', 'juliana.pereira@restaurante.com', '9999999994', 1, 'Garçom', '2023-06-01 14:00:00'),
('77777777777', 'Diego Souza', 'Masculino', '29', 'Rua T, 707', 'diego.souza@restaurante.com', '9999999993', 2, 'Cozinheiro', '2023-07-01 15:00:00'),
('88888888888', 'Patrícia Lima', 'Feminino', '33', 'Rua S, 808', 'patricia.lima@restaurante.com', '9999999992', 3, 'Garçom', '2023-08-01 16:00:00');
