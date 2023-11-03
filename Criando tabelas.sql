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

ALTER TABLE Clientes
ADD COLUMN TotalPedido DOUBLE(10, 2);


22:42:55	CALL InserirPedido(1, 'Roupas de Pirata', 3, '2023-11-20', 'Roupas de pirata para a tripulação de Luffy')	Error Code: 1054. Unknown column 'TotalPedido' in 'field list'	0.000 sec


ALTER TABLE Clientes
ADD COLUMN TotalPedido DOUBLE(10, 2);

ALTER TABLE clientes
DROP COLUMN TotalPedido;

ALTER TABLE clientes
DROP COLUMN Total_Do_Pedido;

ALTER TABLE pedidos
DROP COLUMN TotalPedido;