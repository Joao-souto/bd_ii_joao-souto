use pizzaria; -- comando para indicar qual banco de dados utilizar
insert into clientes -- comando para referenciar qual entidade deste banco
(
cod_cliente, nome, cep, endereco, telefone, email -- quais campos receberam dados
)
values
(2,'Adriano',01515000,'Rua 121233',11976535190,'adriano123@outlook.com'), -- valores para respectivos campos
(3,'Marcelo',01515000,'Rua 112312323',11976535178,'lordeceluis@gmail.com'),
(4,'Larissa',01515000,'Rua 1afdg23',11976535177,'larissinha0@outlook.com'),
(5,'Pedro',01515000,'Rua 12dsfgsdf3',11976535148,'pedroca0@outlook.com')
