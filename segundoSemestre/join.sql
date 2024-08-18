-- INNER JOIN: Retorna apenas as linhas que têm correspondência em ambas as tabelas.
SELECT clientes.nome, pedidos.endereco,pedidos.data_pedido from Clientes INNER JOIN pedidos on clientes.id_cliente = pedidos.id_cliente;
-- Nesta linha, estou selecionando os atributos das respectivas tabelas combinando as tabelas Clientes e pedidos com o critério de o ID_cliente ser igual nas linhas em ambas as tabelas.

-- LEFT JOIN: Retorna todas as linhas da tabela da esquerda, juntamente com as linhas correspondentes da tabela à direita. Se não houver correspondênccia, o resultado é "NULL"
select clientes.nome, clientes.data_cadastro, clientes.idade, funcionarios.idade from clientes left join funcionarios on clientes.idade = funcionarios.idade;
-- Nesta linha, estou selecionando os atributos com o critério de a idade de clientes ser igual a do funcionário. Como Clientes é a tabela da esquerda, será priorizada e aparecerá todas idades, mesmo que a correspondência seja NULL.

-- RIGHT JOIN: Retorna todas as linhas da tabela da direita, juntamente com as linhas correspondentes da tabela à esquerda. Se não houver correspondênccia, o resultado é "NULL"
select clientes.nome, clientes.data_cadastro, clientes.idade, funcionarios.idade from clientes right join funcionarios on clientes.idade = funcionarios.idade;
-- Nesta linha, estou selecionando os atributos com o critério de a idade de clientes ser igual a do funcionário. Como funcionários é a tabela da esquerda, será priorizada e aparecerá todas idades, mesmo que a correspondência seja NULL.

-- FULL JOIN: Retorna todas as linhas e se não houver correspondência o resultado é null, porém o MySQL não suporte esse comando diretamente, sendo necessário juntar o LEFT e RIGHT para obter o mesmo resultado.
select clientes.nome, clientes.data_cadastro, clientes.idade, funcionarios.idade from clientes left join funcionarios on clientes.idade = funcionarios.idade UNION select clientes.nome, clientes.data_cadastro, clientes.idade, funcionarios.idade from clientes right join funcionarios on clientes.idade = funcionarios.idade;

-- CROSS JOIN: Combina as linhas das tabelas, sem necessariamente ter uma correspondência.
select * from clientes cross join funcionarios;

-- SELF JOIN: Um JOIN de uma tabela consigo mesma, utilizando para relacionar linhas dentro da mesma tabela. SELF JOIN É UM CONCEITO E NÃO UM COMANDO