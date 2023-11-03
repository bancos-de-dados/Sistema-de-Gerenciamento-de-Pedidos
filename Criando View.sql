CREATE VIEW PedidosClientes AS
SELECT Pedidos.*, Clientes.Nome AS NomeCliente
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;


SELECT * FROM PedidosClientes;
