-- G:\dbfiles\InsertDataStore.sql

-- Tag
DELETE FROM Tag;

INSERT INTO Tag (TagID, Tag) 
	VALUES 
		(1, 'Internet'),
		(2, 'Politics'),
		(3, 'Science'),
		(4, 'Computers'),
		(5, 'Video Games'),
		(6, 'Slang'),
		(7, 'Inspiring'),
		(8, 'Movies');

-- Shirt
DELETE FROM Shirt;

INSERT INTO Shirt 
	(ShirtID, Price, Description, Title, Colour, PointRate, TagID) 
	VALUES 
		(1, '20.00', 'Pretty much, like, the most badass animal you can wear on-- ew! It just ate a snake!', 'Honey Badger', 'Cream', 1, 1),
		(2, '20.00', 'One thimble to rule them all.', 'You Shall Not Pass Go', 'Grey', 1, 7),
		(3, '20.00', 'Amendment I The right to free speech. Amendment II The right to bear arms. Amendment III The right to buy t-shirts that your 10th grade social studies teacher would find hilarious.', 'Second Amendment', 'Cream', 1, 2),
		(4, '20.00', 'Remember the evolutionary war? The red-shirts are coming!', 'Viva La Evolucion', 'Red', 1, 2),
		(5, '20.00', 'Stiff upper lip, assuming your species has lips.', 'Keep Calm and Move Along', 'Red', 8, 2),
		(6, '20.00', 'The power is in your hands.', 'Control Freak', 'Grey', 5, 2),
		(7, '20.00', 'There are many theories behind the sudden mass extinction of dinosaurs 65 million years ago: asteroid attack, environmental changes, terrorism. But we will never know for sure...', 'Never Forget', 'Green', 3, 2),
		(8, '20.00', 'Sir, please don\'t throw rupees in the club. You\'ll put someone\'s eye out.', 'Song of Storms', 'Grey', 5, 2),
		(9, '20.00', 'Together we can change the world. Literally.', 'Reunite Pangea', 'Grey', 3, 2),
		(10, '20.00', 'If knowledge is so powerful, how come they don\'t make atomic bombs out of it?', 'Science', 'Red', 3, 2),
		(11, '20.00', 'Perfect gift for your non-kosher, non-vegetarian friends.', 'It\s all good', 'Grey', 7, 2),
		(12, '20.00', 'This shirt won\'t make you any better at Pac Man, but it will make you worse at math.', 'Pac Man Graph', 'Black', 5, 2),
		(13, '20.00', 'A 20-sided die is called an Icosahedron. You try making a pun out of that though.', 'That\'s How I Roll', 'Grey', 5, 2),
		(14, '20.00', 'Wear it and watch as snobs in normal tuxedo t-shirts gasp.', 'Disheveled Tuxedo', 'Black', 5, 2),
		(15, '20.00', 'Great news everyone!!!', 'Planet Express', 'Grey', 5, 2),
		(16, '20.00', 'If knowledge is so powerful, how come they don\'t make atomic bombs out of it?', 'Science', 'Red', 5, 2),
		(17, '20.00', 'Poor Slovakia...', 'Prague', 'Brown', 5, 2),
		(18, '20.00', 'The shirt store called and they\'re running out of you!', 'Vandelay Industries', 'Grey', 5, 2),
		(19, '20.00', 'Legalize It!!!!', 'Yes We Cannabis', 'Green', 5, 2),
		(20, '20.00', 'Keeping miles of barren snowy wasteland safe.', 'Captain Canada', 'Red', 5, 2),
		(21, '20.00', 'Sir, please don\'t throw rupees in the club. You\'ll put someone\'s eye out.', 'Song of Storms', 'Grey', 5, 2),
		(22, '20.00', 'This shirt won\'t make you any better at Pac Man, but it will make you worse at math.', 'Pac Man Graph', 'Grey', 5, 2);

-- Size
DELETE FROM Size;

INSERT INTO Size (SizeID, Size) 
	VALUES 
		(1, 'XS'),
		(2, 'S'),
		(3, 'M'),
		(4, 'L'),
		(5, 'XL'),
		(6, '2XL'),
		(7, '3XL'),
		(8, '4XL');

-- ShirtSize
DELETE FROM ShirtSize;

INSERT INTO ShirtSize (ShirtID, SizeID) 
	VALUES 
		(1, 1),
		(1, 2),
		(1, 3),
		(1, 4),
		(1, 5),
		(1, 6),
		(1, 7),
		(2, 1),
		(2, 2),
		(2, 3),
		(2, 4),
		(2, 5),
		(2, 6),
		(2, 7),
		(3, 1),
		(3, 2),
		(3, 3),
		(3, 4),
		(3, 5),
		(3, 6),
		(3, 7),
		(4, 1),
		(4, 2),
		(4, 3),
		(4, 4),
		(4, 5),
		(4, 6),
		(4, 7),
		(5, 1),
		(5, 2),
		(5, 3),
		(5, 4),
		(5, 5),
		(5, 6),
		(5, 7),
		(6, 1),
		(6, 2),
		(6, 3),
		(6, 4),
		(6, 5),
		(6, 6),
		(6, 7),
		(7, 1),
		(7, 2),
		(7, 3),
		(7, 4),
		(7, 5),
		(7, 6),
		(7, 7),
		(8, 1),
		(8, 2),
		(8, 3),
		(8, 4),
		(8, 5),
		(8, 6),
		(8, 7),
		(9, 1),
		(9, 2),
		(9, 3),
		(9, 4),
		(9, 5),
		(9, 6),
		(9, 7),
		(10, 1),
		(10, 2),
		(10, 3),
		(10, 4),
		(10, 5),
		(10, 6),
		(10, 7),
		(11, 1),
		(11, 2),
		(11, 3),
		(11, 4),
		(11, 5),
		(11, 6),
		(11, 7),
		(12, 1),
		(12, 2),
		(12, 3),
		(12, 4),
		(12, 5),
		(12, 6),
		(12, 7),
		(13, 1),
		(13, 2),
		(13, 3),
		(13, 4),
		(13, 5),
		(13, 6),
		(13, 7),
		(14, 1),
		(14, 2),
		(14, 3),
		(14, 4),
		(14, 5),
		(14, 6),
		(14, 7),
		(15, 1),
		(15, 2),
		(15, 3),
		(15, 4),
		(15, 5),
		(15, 6),
		(15, 7),
		(16, 1),
		(16, 2),
		(16, 3),
		(16, 4),
		(16, 5),
		(16, 6),
		(16, 7),
		(17, 1),
		(17, 2),
		(17, 3),
		(17, 4),
		(17, 5),
		(17, 6),
		(17, 7),
		(18, 1),
		(18, 2),
		(18, 3),
		(18, 4),
		(18, 5),
		(18, 6),
		(18, 7),
		(19, 1),
		(19, 2),
		(19, 3),
		(19, 4),
		(19, 5),
		(19, 6),
		(19, 7),
		(20, 1),
		(20, 2),
		(20, 3),
		(20, 4),
		(20, 5),
		(20, 6),
		(20, 7),
		(21, 1),
		(21, 2),
		(21, 3),
		(21, 4),
		(21, 5),
		(21, 6),
		(21, 7),
		(22, 1),
		(22, 2),
		(22, 3),
		(22, 4),
		(22, 5),
		(22, 6),
		(22, 7);

-- Type
DELETE FROM Type;

INSERT INTO Type (TypeID, Type) 
	VALUES 
	(1, 'Default'),
	(2, 'Female'),
	(3, 'Male'),
	(4, 'Children'),
	(5, 'Hoodie');
		
-- Image
DELETE FROM Image;

INSERT INTO Image (ImageID, Image, TypeID, ShirtID) 
	VALUES 
	(1, 'shirt1.gif', 1, 1),
	(2, 'shirt2.gif', 1, 2),
	(3, 'shirt3.gif', 1, 3),
	(4, 'shirt4.gif', 1, 4),		
	(5, 'shirt5.gif', 1, 5),		
	(6, 'shirt6.gif', 1, 6),		
	(7, 'shirt7.gif', 1, 7),		
	(8, 'shirt8.gif', 1, 8),
	(9, 'shirt9.gif', 1, 9),		
	(10, 'shirt10.gif', 1, 10),		
	(11, 'shirt11.gif', 1, 11),		
	(12, 'shirt12.gif', 1, 12),
	(13, 'shirt13.gif', 1, 13),
	(14, 'shirt14.gif', 1, 14),
	(15, 'shirt15.gif', 1, 15),
	(16, 'shirt16.gif', 1, 16),
	(17, 'shirt17.gif', 1, 17),
	(18, 'shirt18.gif', 1, 18),
	(19, 'shirt19.gif', 1, 19),
	(20, 'shirt20.gif', 1, 20),
	(21, 'shirt21.gif', 1, 21),
	(22, 'shirt22.gif', 1, 22);

-- ShirtType
DELETE FROM ShirtType;

INSERT INTO ShirtType (ShirtID, TypeID) 
	VALUES 
		(1, 2),
		(1, 3),
		(2, 2),
		(2, 3),
		(2, 4),
		(2, 5),
		(3, 2),
		(3, 3),
		(3, 5),
		(4, 2),
		(4, 3),
		(5, 2),
		(5, 3),
		(6, 2),
		(6, 3),
		(6, 4),
		(6, 5),
		(7, 2),
		(7, 3),
		(7, 5),
		(8, 2),
		(8, 3),
		(9, 2),
		(9, 3),
		(10, 2),
		(10, 3),
		(10, 4),
		(10, 5),
		(11, 2),
		(11, 3),
		(11, 5),
		(12, 2),
		(12, 3),
		(13, 2),
		(13, 3),
		(13, 5),
		(14, 2),
		(14, 3),
		(14, 5),
		(15, 2),
		(15, 3),
		(15, 5),
		(16, 2),
		(16, 3),
		(16, 5),
		(17, 2),
		(17, 3),
		(17, 5),
		(18, 2),
		(18, 3),
		(18, 5),
		(19, 2),
		(19, 3),
		(19, 5),
		(20, 2),
		(20, 3),
		(20, 5),
		(21, 2),
		(21, 3),
		(21, 5),
		(22, 2),
		(22, 3),
		(22, 5);
		

-- Shipping
DELETE FROM Shipping;	
	
INSERT INTO Shipping (ShippingID, Method, UnitCost) 
	VALUES 
	(1, 'Canada Post Regular', '1.25'),
	(2, 'Canada Post Express', '3.50'),
	(3, 'FedEx Express', '3.50'),
	(4, 'FedEx Overnight', '5.00');

-- PaymentType
DELETE FROM PaymentType;

INSERT INTO PaymentType (PaymentTypeID, Type) 
	VALUES 
		(1, 'Visa'),
		(2, 'MasterCard'),
		(3, 'American Express'),
		(4, 'PayPal'),
		(5, 'Diner\'s Club');
	
-- Province
DELETE FROM Province;

INSERT INTO Province (ProvinceCode, ProvinceName) 
	VALUES 
		('AB', 'Alberta'),
		('BC', 'British Columbia'),
		('MB', 'Manitoba'),
		('NB', 'New Brunswick'),
		('NL', 'Newfoundland and Labrador'),
		('NT', 'Northwest Territories'),
		('NS', 'Nova Scotia'),
		('NU', 'Nunavut'),
		('ON', 'Ontario'),
		('PE', 'Prince Edward Island'),
		('QC', 'Quebec'),
		('SK', 'Saskatchewan'),
		('YT', 'Yukon');