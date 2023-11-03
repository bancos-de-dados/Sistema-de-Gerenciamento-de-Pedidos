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

