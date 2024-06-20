-- João Pedro Monteiro Souto

-- Quais dados são necessários para o login?
SELECT * FROM Login WHERE Username = 'joaosouza' AND Senha = 'senha234'; -- SELECT * FROM Login WHERE Username = @username AND Senha = @senha; Também poderia ser utilizado se usado a partir de uma aplicação

-- "" "" "" para vizualizar o cadastro do cliente
SELECT * FROM Clientes WHERE ID_cliente = 1;

-- Quantos funcionários existem por filial? Liste apenas os nomes
SELECT Nome FROM Funcionarios Where ID_filial = '4';

-- Quantos clientes existem por filial? Liste os clientes ordenados por filial
SELECT Nome, ID_filial FROM Clientes ORDER BY ID_filial ASC;

-- Elabore script de acordo com os requisitos de sua escolha
SELECT * FROM Pratos Where Valor > 30.00; -- Filtrando pratos acima de 30 reais