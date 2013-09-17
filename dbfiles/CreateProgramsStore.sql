-- G:\dbfiles\CreateProgramsStore.sql

DROP PROCEDURE IF EXISTS getShirts;

delimiter $

CREATE PROCEDURE getShirts()
BEGIN
	SELECT Shirt.ShirtID, Shirt.Description, Image.Image
	FROM Shirt
		INNER JOIN Image
		ON Shirt.ShirtID = Image.ShirtID
	WHERE Image.TypeID = 1
	ORDER BY Shirt.ShirtID;
END$

delimiter ;

DROP PROCEDURE IF EXISTS getDetails;

delimiter $

CREATE PROCEDURE getDetails(p_ID INT)
BEGIN
	SELECT 	Shirt.ShirtID, Shirt.Price, Shirt.Description, Shirt.Title, Shirt.Colour, 
					Tag.Tag, Image.Image
	FROM Shirt
		INNER JOIN Tag
		ON Shirt.TagID = Tag.TagID
		INNER JOIN Image
		ON Shirt.ShirtID = Image.ImageID
	WHERE Shirt.ShirtID = p_ID AND Image.TypeID = 1;

	SELECT Size.Size
	FROM Size
	WHERE Size.SizeID IN
		(SELECT ShirtSize.SizeID
		FROM ShirtSize
		WHERE ShirtSize.ShirtID = p_ID);

	SELECT Type.Type
	FROM Type
	WHERE Type.TypeID IN
		(SELECT ShirtType.TypeID
		FROM ShirtType
		WHERE ShirtType.ShirtID = p_ID);
END$

delimiter ;

DROP PROCEDURE IF EXISTS getRecommended;

DELIMITER $

CREATE PROCEDURE getRecommended(p_tag VARCHAR(40))
BEGIN
	SELECT Shirt.ShirtID, Shirt.Description, Image.Image
	FROM Shirt
		INNER JOIN Image
		ON Shirt.ShirtID = Image.ShirtID
	WHERE Image.TypeID = 1 AND Shirt.TagID IN
		(SELECT Tag.TagID
		FROM Tag
		WHERE Tag.Tag = p_tag)
	ORDER BY RAND()
	LIMIT 4;
END$

DELIMITER ;

DROP PROCEDURE IF EXISTS addCart;

Delimiter $

CREATE PROCEDURE addCart(p_SID VARCHAR(32))
BEGIN 
	INSERT INTO Cart (SID)
		VALUES (p_SID);
		
	SELECT last_insert_id() AS intRecordKey;
END$

Delimiter ;

DROP PROCEDURE IF EXISTS getCart;

Delimiter $

CREATE PROCEDURE getCart(p_SID VARCHAR(32))
BEGIN
	SELECT Cart.CartID
	FROM Cart
	WHERE Cart.SID = p_SID;
END$

Delimiter ;

DROP PROCEDURE IF EXISTS addShirt;

Delimiter $

CREATE PROCEDURE addShirt(p_cartID INT, p_shirtID INT, 
													p_type VARCHAR(20), p_size CHAR(3))
BEGIN
	DECLARE v_typeID INT;
	DECLARE v_sizeID INT;

	SELECT Type.TypeID 
		INTO v_typeID
	FROM Type
	WHERE Type.Type = p_type;
	
	SELECT Size.SizeID
		INTO v_sizeID
	FROM Size
	WHERE Size.Size = p_size;
	
	INSERT INTO CartItem
		(ShirtID, CartID, TypeID, SizeID, Quantity)
		VALUES
		(p_shirtID, p_cartID, v_typeID, v_sizeID, 1)
		ON DUPLICATE KEY UPDATE Quantity = Quantity + 1;
END$

Delimiter ;