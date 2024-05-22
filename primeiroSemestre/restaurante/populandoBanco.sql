USE Restaurante; 

insert into Clientes(ID_cliente,CPF,Nome,Sexo,Idade,Endereco,Email,Telefone) --5
values()

insert into Filiais(ID_filial,Endereco,Email,Telefone,Quant_mesas,Avaliacao) --1
values()

insert into Funcionarios(ID_func,CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,ID_filial) --5
values()

insert into Reservas(Data_reserva,ID_cliente,Mesa,ID_filial) --3
values()

insert into Fornecedores(Nome,ID_fornecedor,CNPJ,Tipo_material,Email,Telefone,Valor_material) --2
values()

insert into Estoque(ID_fornecedor,ID_materia,Quantidade,ID_filial) --material do prato
values()

insert into Ingredientes(ID_ingrediente,Unidade_medida) --
values()

insert into Pratos(ID_prato,Nome,Descricao,Valor) --1
values()

insert into Bebidas(ID_bebida,Nome,Descricao,Valor) --2
values()

insert into Pedidos(ID_pedido,ID_cliente,ID_prato,ID_bebida,Valor,Tipo_pagamento,Endereco) --5
values()

insert into Entregas(ID_entrega,Endereco,ID_pedido) --3
values()