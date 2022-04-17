USE loja_roupas;

DELIMITER $$
    CREATE TRIGGER trg_compra_produto_insert 
    AFTER INSERT ON compra_produto FOR EACH ROW 
    BEGIN
        UPDATE estoque 
            SET quantidade = quantidade - NEW.quantidade
            WHERE produto_id = NEW.produto_id
                AND tamanho = NEW.tamanho
                AND cor = NEW.cor;
    END 
$$
    CREATE TRIGGER trg_produto_insert 
    BEFORE INSERT ON produto FOR EACH ROW 
    BEGIN
        SET NEW.preco_desconto = (NEW.preco * 0.90),
            NEW.destaque = 1;
    END 
$$
    CREATE PROCEDURE proc_pega_valor_compra_mensal (IN mes_in INT)
    BEGIN 
        SELECT SUM(valor_compra) 
            FROM compra 
            WHERE MONTH(data) = mes_in;
    END
$$
    CREATE PROCEDURE proc_atualiza_produto_destaque (IN preco_in DECIMAL(5,2))
    BEGIN 
        UPDATE produto 
            SET destaque = 1 
            WHERE preco < preco_in;
    END
$$