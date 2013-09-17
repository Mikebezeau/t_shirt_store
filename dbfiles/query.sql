-- G:\dbfiles\query.sql

DROP TRIGGER IF EXISTS bi_CartItem;

Delimiter $

CREATE TRIGGER bi_CartItem BEFORE INSERT ON CartItem
	FOR EACH ROW BEGIN
	
		DECLARE v_cartID INT;
	
		SELECT CartItem.CartID
			INTO v_cartID
		FROM CartItem
		WHERE CartItem.CartID = NEW.CartID AND CartItem.ShirtID = NEW.ShirtID;

		IF v_cartID > 0 THEN
			UPDATE CartItem
			SET Quantity = Quantity + 1
			WHERE CartItem.CartID = NEW.CartID AND CartItem.ShirtID = NEW.ShirtID;
		END IF;
		
	END$

Delimiter ;