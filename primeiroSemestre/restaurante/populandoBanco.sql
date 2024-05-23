USE Restaurante; 

insert into Clientes(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,Data_cadastro)
values("50062851845","João Pedro Monteiro Souto","Masculino",16,"Rua Ministro Lins de Barros","joaosouto0@outlook.com","11976535178","2024-06-25"),
("50062851822","José Monteiro Souto","Masculino",18,"Rua da Mooca","jose123333@outlook.com","11976523278","2024-02-25"),
("50062851811","Pedro Silva Souto","Masculino",18,"Rua da Mooca","jose231133@outlook.com","11976599278","2024-01-25"),
("31062851811","Fernanda Silva Souto","Feminino",20,"Rua do Oratório","fefefe1212@outlook.com","11976599211","2024-01-25"),
("31062851221","Gielly Silva Souto","Feminino",45,"Curva do S","gigigi321654@outlook.com","11922599211","2023-01-25");

INSERT INTO Filiais(Endereco, Email, Telefone, Quant_mesas, Avaliacao)
 VALUES ('123 Main Street, Cityville', 'exemplo@email.com', '(123) 456-7890', 20, 4.5);



INSERT INTO Funcionarios(CPF, Nome, Sexo, Idade, Endereco, Email, Telefone, Cargo, Data_contatacao) 
VALUES 
('20037812391', 'Fernanda da Silva Santos', 'Feminino', 30, 'Rua das Flores, 123', 'fernanda@example.com', '(11) 98765-4321', 'Gerente', '2023-01-15'),
('12345678900', 'João Souza', 'Masculino', 25, 'Avenida Central, 456', 'joao@example.com', '(11) 98765-4321', 'Atendente', '2023-02-20'),
('98765432100', 'Maria Oliveira', 'Feminino', 28, 'Rua da Praia, 789', 'maria@example.com', '(11) 98765-4321', 'Cozinheira', '2023-03-10'),
('55566677788', 'Pedro Lima', 'Masculino', 22, 'Rua dos Sonhos, 321', 'pedro@example.com', '(11) 98765-4321', 'Auxiliar de Limpeza', '2023-04-05'),
('11122233344', 'Ana Costa', 'Feminino', 35, 'Avenida da Paz, 789', 'ana@example.com', '(11) 98765-4321', 'Chef de Cozinha', '2023-05-15');


INSERT INTO Reservas(Data_reserva, Mesa, Capacidade) 
VALUES 
('2024-05-25', 1, 4),
('2024-05-26', 2, 6),
('2024-05-27', 3, 8);


INSERT INTO Fornecedores(Nome, CNPJ, Tipo_material, Email, Telefone, Valor_material) 
VALUES 
('Fornecedor A', '12345678901234', 'Material A', 'fornecedorA@example.com', '(11) 98765-4321', 100.00),
('Fornecedor B', '98765432109876', 'Material B', 'fornecedorB@example.com', '(22) 12345-6789', 150.00);


INSERT INTO Estoque(Produtos, Quantidade) 
VALUES 
('Lasanha à Bolonhesa', 20),
('Risoto de Funghi', 15),
('Salada Caesar', 30),
('Sopa de Legumes', 25),
('Mousse de Chocolate', 40);

INSERT INTO Ingredientes(Nome, Unidade_medida) 
VALUES 
('Farinha de Trigo', 'gramas'),
('Azeite de Oliva', 'mililitros'),
('Cebola', 'unidade'),
('Tomate', 'unidade'),
('Queijo Parmesão', 'gramas');

INSERT INTO Pratos(Nome, Descricao, Valor) 
VALUES 
('Lasanha à Bolonhesa', 'DescriçãoDoPrato', 29.9);


INSERT INTO Bebidas(Nome, Descricao, Valor) 
VALUES 
('NomeDaBebida1', 'DescriçãoDaBebida1', 15.9),
('NomeDaBebida2', 'DescriçãoDaBebida2', 18.5);


INSERT INTO Pedidos(Valor, Tipo_pagamento, Endereco, Data_pedido) 
VALUES 
(54.9, 'TipoPagamento1', 'EnderecoPedido1', 'DataPedido1'),
(54.9, 'TipoPagamento2', 'EnderecoPedido2', 'DataPedido2'),
(54.9, 'TipoPagamento3', 'EnderecoPedido3', 'DataPedido3'),
(54.9, 'TipoPagamento4', 'EnderecoPedido4', 'DataPedido4'),
(54.9, 'TipoPagamento5', 'EnderecoPedido5', 'DataPedido5');

INSERT INTO Entregas(Endereco, Data_entrega) 
VALUES 
('EnderecoEntrega1', 'DataEntrega1'),
('EnderecoEntrega2', 'DataEntrega2'),
('EnderecoEntrega3', 'DataEntrega3');