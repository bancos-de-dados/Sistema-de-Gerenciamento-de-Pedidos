
# Sistema de Gerenciamento de Pedidos

![OIG](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/37581f64-98dd-4876-ab42-f697069a4eaa)


O exercício envolve na criação de um sistema de gerenciamento de pedidos para uma loja.

### Objetivo

 Criar um sistema de gerenciamento de pedidos em um banco de dados utilizando stored procedures, triggers, views e JOINs no MySQL Workbench.


## Codigo:

```SQL
-- Criando a tabela Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Telefone VARCHAR(20),
    Descricao VARCHAR (1000),
    TotalPedido DOUBLE(10, 2)
);
-- Criandof a tabela Pedidos
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Produto VARCHAR(255),
    Quantidade INT,
    DataPedido DATE,
    Descricao VARCHAR (1000),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

```
## Etapa 1: Criação de Tabelas e Inserção de Dados

Crie as tabelas "Clientes" e "Pedidos" com campos apropriados. Insira dados de exemplo nas tabelas para simular clientes e pedidos. Certifique-se de incluir uma chave primária em cada tabela.

``` SQL
-- Criando a tabela Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Telefone VARCHAR(20),
    Descricao VARCHAR (1000),
    TotalPedido DOUBLE(10, 2)
);

```

![tabela Clientes](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/b11a5bc6-77df-4ec1-abb3-2c0bb080b83b)


``` SQL
-- Criandof a tabela Pedidos
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Produto VARCHAR(255),
    Quantidade INT,
    DataPedido DATE,
    Descricao VARCHAR (1000),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

```

![tabela Pedidos](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/87c26b07-09dc-4e8b-a7da-1b0a28e42ce5)



## Etapa 2: Criação de Stored Procedure

Crie uma stored procedure chamada "InserirPedido" que permite inserir um novo pedido na tabela "Pedidos" com as informações apropriadas. A stored procedure deve receber parâmetros como o ID do cliente e os detalhes do pedido. Ao término teste o funcionamento da stored procedure criada inserindo um pedido.
``` SQL
DELIMITER //
CREATE PROCEDURE InserirPedido (
    IN cliente_id INT,
    IN produto VARCHAR(255),
    IN quantidade INT,
    IN data_pedido DATE,
    IN descricao VARCHAR(1000)
)
BEGIN
    INSERT INTO Pedidos (ClienteID, Produto, Quantidade, DataPedido, Descricao)
    VALUES (cliente_id, produto, quantidade, data_pedido, descricao);
END //
DELIMITER ;

```
![tabela Pedidos](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/d753e82f-601b-41f3-86f4-47708b903e61)


## Etapa 3: Trigger

Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos". A trigger deve calcular o valor total dos pedidos para o cliente correspondente e atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.
``` SQL
DELIMITER //
CREATE TRIGGER CalculaTotalPedidos
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE total_pedidos DOUBLE(10, 2);
    SELECT SUM(Quantidade) INTO total_pedidos FROM Pedidos WHERE ClienteID = NEW.ClienteID;
    UPDATE clientes SET TotalPedido = total_pedidos WHERE ClienteID = NEW.ClienteID;
END //
DELIMITER ;

```
![tabela Clientes](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/5805e5f2-9386-47f5-a2ff-93a799d71638)


## Etapa 4: View

Crie uma view chamada "PedidosClientes" que combina informações das tabelas "Clientes" e "Pedidos" usando JOIN para mostrar os detalhes dos pedidos e os nomes dos clientes.
``` SQL
CREATE VIEW PedidosClientes AS
SELECT Pedidos.*, Clientes.Nome AS NomeCliente
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

```
![VIEW](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/ab0652ed-4189-4b8d-98b9-ac8bbedbb929)


## Etapa 5: Consulta com JOIN

Escreva uma consulta SQL que utiliza JOIN para listar os detalhes dos pedidos de cada cliente, incluindo o nome do cliente e o valor total de seus pedidos. Utilize a view "PedidosClientes" para essa consulta.
``` SQL
SELECT 
    pc.NomeCliente,
    p.PedidoID,
    p.Descricao,
    p.Quantidade,
    p.DataPedido,
    c.TotalPedido
FROM 
    PedidosClientes pc
JOIN 
    Pedidos p ON pc.PedidoID = p.PedidoID
JOIN 
    Clientes c ON pc.ClienteID = c.ClienteID;

```
![Join](https://github.com/bancos-de-dados/Sistema-de-Gerenciamento-de-Pedidos/assets/127689567/96ea4561-2ad2-42eb-bd41-85ea89680a56)


![logo-maker-featuring-aliens-and-robots-2367-el1](https://github.com/bancos-de-dados/Com-rcio-Eletr-nico/assets/127689567/96d142cd-2b5c-409d-9ba1-ce5a2a665972)
