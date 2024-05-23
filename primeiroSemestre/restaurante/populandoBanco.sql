USE Restaurante; 

insert into Clientes(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,Data_cadastro)
values("50062851845","João Pedro Monteiro Souto","Masculino",16,"Rua Ministro Lins de Barros","joaosouto0@outlook.com","11976535178","2024-06-25"),
values("50062851822","José Monteiro Souto","Masculino",18,"Rua da Mooca","jose123333@outlook.com","11976523278","2024-02-25"),
values("50062851811","Pedro Silva Souto","Masculino",18,"Rua da Mooca","jose231133@outlook.com","11976599278","2024-01-25"),
values("31062851811","Fernanda Silva Souto","Feminino",20,"Rua do Oratório","fefefe1212@outlook.com","11976599211","2024-01-25"),
values("31062851221","Gielly Silva Souto","Feminino",45,"Curva do S","gigigi321654@outlook.com","11922599211","2023-01-25")

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


INSERT INTO Estoque(Produtos, Ingredientes, Quantidade) 
VALUES 
('Lasanha à Bolonhesa', 'Massa de lasanha, carne moída, molho de tomate, queijo mussarela, queijo parmesão, temperos', 20),
('Risoto de Funghi', 'Arroz arbóreo, cogumelos funghi secos, caldo de legumes, cebola, alho, vinho branco, queijo parmesão, manteiga', 15),
('Salada Caesar', 'Alface romana, croutons, queijo parmesão, molho caesar, peito de frango grelhado', 30),
('Sopa de Legumes', 'Legumes variados (cenoura, batata, abóbora, etc.), caldo de legumes, cebola, alho, temperos', 25),
('Mousse de Chocolate', 'Chocolate meio amargo, creme de leite, ovos, açúcar, essência de baunilha', 40);

INSERT INTO Ingredientes(Nome, Unidade_medida) 
VALUES 
('Farinha de Trigo', 'gramas'),
('Azeite de Oliva', 'mililitros'),
('Cebola', 'unidade'),
('Tomate', 'unidade'),
('Queijo Parmesão', 'gramas');

INSERT INTO Pratos(Nome, Descricao, Valor) 
VALUES 
('NomeDoPrato', 'DescriçãoDoPrato', ValorDoPrato);


INSERT INTO Bebidas(Nome, Descricao, Valor) 
VALUES 
('NomeDaBebida1', 'DescriçãoDaBebida1', ValorDaBebida1),
('NomeDaBebida2', 'DescriçãoDaBebida2', ValorDaBebida2);


INSERT INTO Pedidos(Valor, Tipo_pagamento, Endereco, Data_pedido) 
VALUES 
(ValorDoPedido1, 'TipoPagamento1', 'EnderecoPedido1', 'DataPedido1'),
(ValorDoPedido2, 'TipoPagamento2', 'EnderecoPedido2', 'DataPedido2'),
(ValorDoPedido3, 'TipoPagamento3', 'EnderecoPedido3', 'DataPedido3'),
(ValorDoPedido4, 'TipoPagamento4', 'EnderecoPedido4', 'DataPedido4'),
(ValorDoPedido5, 'TipoPagamento5', 'EnderecoPedido5', 'DataPedido5');

INSERT INTO Entregas(Endereco, Data_entrega) 
VALUES 
('EnderecoEntrega1', 'DataEntrega1'),
('EnderecoEntrega2', 'DataEntrega2'),
('EnderecoEntrega3', 'DataEntrega3');

SELECT * FROM Clientes;
SELECT * FROM Filiais;
SELECT * FROM Funcionarios;
SELECT * FROM Reservas;
SELECT * FROM Fornecedores;
SELECT * FROM Estoque;
SELECT * FROM Ingredientes;
SELECT * FROM Pratos;
SELECT * FROM Bebidas;
SELECT * FROM Pedidos;
SELECT * FROM Entregas;