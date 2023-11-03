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




DROP TRIGGER CalcularTotalPedidos;
