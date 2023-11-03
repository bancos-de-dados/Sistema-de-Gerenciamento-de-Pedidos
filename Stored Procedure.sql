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



-- stored procedure InserirPedido para adicionar 10 novos pedidos
	CALL InserirPedido(1, 'Roupas de Pirata', 3, '2023-11-20', 'Roupas de pirata para a tripulação de Luffy');
	CALL InserirPedido(2, 'Zanpakutou de Treino', 2, '2023-11-21', 'Zanpakutou especial para treinamento de Ichigo');
	CALL InserirPedido(3, 'Laço Mágico', 1, '2023-11-22', 'Laço mágico para a Princesa Diana');
	CALL InserirPedido(4, 'Lacrima de Fogo', 5, '2023-11-23', 'Item mágico para Natsu');
	CALL InserirPedido(5, 'Espada Anti-Titan', 3, '2023-11-24', 'Espada especializada contra Titãs de Mikasa');
	CALL InserirPedido(6, 'Varinha Lunar', 4, '2023-11-25', 'Varinha mágica para Sailor Moon');
	CALL InserirPedido(7, 'Traje de Herói Avançado', 1, '2023-11-26', 'Uniforme avançado para Deku');
	CALL InserirPedido(8, 'Scouter de Treinamento', 3, '2023-11-27', 'Dispositivo de treinamento para Vegeta');
	CALL InserirPedido(9, 'Luvas de Soco Poderoso Avançado', 2, '2023-11-28', 'Para socos ainda mais poderosos de Saitama');
	CALL InserirPedido(10, 'Lâmina de Titã', 6, '2023-11-29', 'Lâmina especializada para enfrentar Titãs de Eren');
