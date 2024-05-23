USE Restaurante; 

insert into Clientes(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,Data_cadastro) --5
values()

insert into Filiais(Endereco,Email,Telefone,Quant_mesas,Avaliacao) --1
values()

insert into Funcionarios(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,Cargo,Data_contatacao) --5
values()

insert into Reservas(Data_reserva,Mesa,Capacidade) --3
values()

insert into Fornecedores(Nome,CNPJ,Tipo_material,Email,Telefone,Valor_material) --2
values()

insert into Estoque(Quantidade) --material do prato
values()

insert into Ingredientes(Nome, Unidade_medida) --
values()

insert into Pratos(Nome,Descricao,Valor) --1
values()

insert into Bebidas(Nome,Descricao,Valor) --2
values()

insert into Pedidos(Valor,Tipo_pagamento,Endereco,Data_pedido) --5
values()

insert into Entregas(Endereco,Data_entrega) --3
values()