USE Restaurante; 

insert into Clientes(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,Data_cadastro) --5
values()

insert into Filiais(Endereco,Email,Telefone,Quant_mesas,Avaliacao) --1
values()

insert into Funcionarios(CPF,Nome,Sexo,Idade,Endereco,Email,Telefone,ID_filial,Cargo,Data_contatacao) --5
values()

insert into Reservas(Data_reserva,ID_cliente,Mesa,ID_filial,) --3
values()

insert into Fornecedores(Nome,ID_fornecedor,CNPJ,Tipo_material,Email,Telefone,Valor_material) --2
values()

insert into Estoque(ID_materia,Quantidade,ID_filial) --material do prato
values()

insert into Ingredientes(Unidade_medida) --
values()

insert into Pratos(Nome,Descricao,Valor) --1
values()

insert into Bebidas(Nome,Descricao,Valor) --2
values()

insert into Pedidos(ID_cliente,ID_prato,ID_bebida,Valor,Tipo_pagamento,Endereco) --5
values()

insert into Entregas(Endereco,ID_pedido) --3
values()