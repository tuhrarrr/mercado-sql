-- CRIANDO O BANCO DE DADOS
CREATE DATABASE mercado;
-- USANDO O BANCO DE DADOS
USE mercado;

-- TABELA DE CLIENTES
CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE
);

-- TABELA DE PRODUTOS
CREATE TABLE produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2)
);

-- TABELA DE VENDA
CREATE TABLE venda(
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    cliente_comprou int not null,
    data_venda DATE NULL,
    FOREIGN KEY (cliente_comprou) REFERENCES clientes(id_cliente)
);


-- TABELA DE ITEM VENDA
CREATE TABLE item_venda(
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_item_venda int,
    id_item_produto int,
    qtd int not null,
    preco_unit DECIMAL(10, 2) not null,
    Foreign Key (id_item_venda) REFERENCES venda(id_venda),
    Foreign Key (id_item_produto) REFERENCES produtos(id_produto)
);

-- Inserindo Dados
INSERT INTO clientes (nome_cliente, email_cliente) VALUES ('Paulin', 'paulinbacana123faavela@gmail.com'), ('Jorge', 'jorgequebrada@gmail.com'), 
                     ('João', 'jaozingameplay@gmail.com'), ('Arthur', 'tutuproducoes@gmail.com'), ('tyler', 'tylerthecreator@gmail.com');
INSERT INTO produtos (nome_produto, preco) VALUES ('Teclado', '120.00'), ('Mouse', '90.00'), ('Fone', '60.00');
INSERT INTO venda (cliente_comprou, data_venda) VALUES (1, '2026-02-10'), (2, '2026-02-11'), (3, '2036-02-12'), (4, '2040-12-12'),
                  (5, '2080-12-31');
INSERT INTO item_venda (id_item_venda, id_item_produto, qtd, preco_unit) VALUES (1, 1, 2, '120.00'), (2, 2, 1, '90.00'), (3, 3, 2, '60.00'), 
                       (4, 2, 10, '90.00'), (5, 1, 2300, '120.00');

-- TESTES....
SELECT * FROM venda;

SELECT
    clientes.nome_cliente,
    clientes.email_cliente,
    venda.data_venda,
    produtos.nome_produto,
    item_venda.qtd,
    item_venda.preco_unit
FROM item_venda
JOIN venda ON venda.id_venda = item_venda.id_item_venda
JOIN clientes ON clientes.id_cliente = venda.cliente_comprou
JOIN produtos ON produtos.id_produto = item_venda.id_item_produto;